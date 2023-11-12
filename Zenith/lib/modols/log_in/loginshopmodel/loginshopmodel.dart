class LoginShopModel {
  bool ? status;
  String ? message;
  UserData ? data;

  LoginShopModel.fromJason(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? UserData.fromJason(json['data']) : null ;
  }

}

class UserData {
  int? id;
  int? point;
  int? credit;
  String? name;
  String? email;
  String? phone;
  String? image;
  late String token;


  UserData.fromJason(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    point = json['point'];
    credit = json['credit'];
    token = json['token'];
  }
}
