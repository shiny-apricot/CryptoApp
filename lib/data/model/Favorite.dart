

class Favorite{

  int _id;
  String _title;

  Favorite(this._id, this._title);

  String get title => _title;

  set title(String value) {
    _title = value;
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
    if(title != null)
      map['title'] = _title;
    return map;
  }

  // Extract a Favorite object from a Map object
  Favorite.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._title = map['title'];
  }
}