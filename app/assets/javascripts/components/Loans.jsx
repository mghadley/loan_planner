class Loans extends React.Component {
	constructor(props) {
		super(props);
		this.displayLoans = this.displayLoans.bind(this)
	}

  months() {
    return ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 
           'September', 'October', 'November', 'December']
  }

  monthlyPayments() {
    let d = new Date();
    let m = d.getMonth();
    total = this.props.loans
    debugger
    return ( <h4>{this.months()[m]}</h4>)
    for (num of Array(5).keys()) {
      console.log(num)
    }
  }

	displayLoans() {
		return this.props.loans.map( l => {
			return (
        <div>
  				<h3>{l[0].name}</h3>
          <h4>Monthly Payment: {l[1]}</h4>
        </div>
      )
    })
  }

  render() {
    return (
      <div>
        <h1>Hi</h1>
        {this.displayLoans()}
        {this.monthlyPayments()}
			</div>
		)
	}
}