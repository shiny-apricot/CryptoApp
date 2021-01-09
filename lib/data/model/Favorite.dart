

class Favorite{

  int _id;
  String _currency;

  Favorite(this._id, this._currency);

  String get currency => _currency;

  set currency(String value) {
    _currency = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  // Convert a Favorite object into a Map object
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    if (id != null)
      map['id'] = _id;
    if(currency != null)
      map['currency'] = _currency;
    return map;
  }

  // Extract a Favorite object from a Map object
  Favorite.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._currency = map['currency'];
  }
}