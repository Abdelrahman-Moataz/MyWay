


class  LogInUserModel {
  String? name;
  String? phone;
  String? email;
  String? uID;

  LogInUserModel({this.name, this.email,this.phone,this.uID});

  LogInUserModel.fromJson(Map<String, dynamic>json){
    email = json['email'];
    phone = json['phone'];
    name = json['name'];
    uID = json['uID'];
  }


  Map<String, dynamic> toMap(){
    return {
      'name' : name,
      'email' : email,
      'phone' : phone,
      'uID' : uID,
    };
  }


}