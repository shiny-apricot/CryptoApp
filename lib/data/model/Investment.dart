

class Investment{

  int _id;
  String _currency;
  String _amount;
  String _initialCurrencyValue;


  Investment(
      this._id, this._currency, this._amount, this._initialCurrencyValue);

  String get initialCurrencyValue => _initialCurrencyValue;

  set initialCurrencyValue(String value) {
    _initialCurrencyValue = value;
  }

  String get amount => _amount;

  set amount(String value) {
    _amount = value;
  }

  String get currency => _currency;

  set currency(String value) {
    _currency = value;
  }


  int get id => _id;

  set id(int value) {
    _id = value;
  } // Convert a Investment object into a Map object
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    if (id != null)
      map['id'] = _id;
    else
      print('id null....');

    if(currency != null) {
      print('curreny = $_currency');
      map['currency'] = _currency;
    }
    else
      print('currency null....');

    if(amount != null)
      map['amount'] = _amount;
    else
      print('amount null......');

    if(initialCurrencyValue != null)
      map['initial_value'] = _initialCurrencyValue;
    else
      print('initial null....');

    return map;
  }

  // Extract a Investment object from a Map object
  Investment.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._currency = map['currency'];
    this._amount = map['amount'];
    this.initialCurrencyValue = map['initial_value'];
  }
}