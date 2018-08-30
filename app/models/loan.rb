class Loan < ApplicationRecord

  def self.loans_with_payments
    loans = []
    all.order(:interest_rate).each_with_index do |l, i|
      extra = i == count - 1 ? self.calc_extra : 0
      loans << [l, (l.minimum + l.additional + extra)]
    end
    return loans
  end

  def self.all_payments
    loans = []
    total = total_owed
    counter = 0
    while total > 0
      month = Hash.new
      all.each_with_index do |l, i|
        binding.pry
        month[l.name.to_sym] = Hash.new
        month[l.name.to_sym][:remaining] = loans.length > 0 ? (l.amount - loans.inject(0) { |sum, month| sum + month[l.name.to_sym][:payment]}) : 0
        month[l.name.to_sym][:payment] = l.minimum + l.additional
        loans << month
        total -= l.minimum + l.additional
      end
      counter += 1
    end
    return loans
  end

  def self.all_payments_rec

  end

  

  def self.total_owed
    all.pluck(:amount).inject(:+)
  end

  def self.min_monthy_toal
    Loan.all.pluck(:minimum, :additional).flatten.inject(:+)
  end

  # def self.loans_with_payments
  #   loans = []
  #   all.order(interest_rate: :desc).each_with_index do |l, i|
  #     extra = i == count - 1 ? calc_extra : 0
  #     loans << calc_payments(l, extra)
  #   end
  # end

  # def calc_payments(loan, extra)
  #   month_index = Date.today.month
  #   current_month = Date::MONTHNAMES[month_index]
  #   monthly_payment = loan.minimum + loan.additional
  #   payments_count = (loan.amount / (monthly_payment)).ceil
  #   payments = []
  #   payments_count.times do |i|
  #     payments << [Date::MONTHNAMES[(month_index + i) % 12], 
  #   end
  # end

  private

  def self.calc_extra
    payments = Loan.all.pluck(:minimum, :additional).flatten
    return Budget.last.amount - payments.reduce(:+)
  end

end
