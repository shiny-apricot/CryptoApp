

class Investment{

  int _id;
  String _currency;
  String _amount;

  Investment(this._id, this._currency, this._amount);

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
    if(currency != null)
      map['currency'] = _currency;
    if(amount != null)
      map['amount'] = _amount;

    return map;
  }

  // Extract a Investment object from a Map object
  Investment.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._currency = map['currency'];
    this._amount = map['amount'];
  }
}