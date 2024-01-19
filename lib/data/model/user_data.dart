

class UserData {
  String id;
  String name;
  double lat;
  double long;

  UserData({
    required this.id,
    required this.name,
    required this.lat,
    required this.long,
  });


  factory UserData.fromJson(Map<String,dynamic> json){
    return UserData(
        id: json['id'] as String,
        name: json['name'] as String,
        lat: json['lat'] as double,
        long: json['long'] as double);
  }

  Map<String,dynamic> toJson(){
    return {
      'id':id,
      'name':name,
      'lat':lat,
      'long':long,
    };
  }

}
