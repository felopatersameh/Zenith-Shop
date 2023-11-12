class SinginModelsShop
{
  bool ? status ;
  String ? message ;
  DataRegister ? data ;
  SinginModelsShop.fromJason(Map<String ,dynamic> jason)
  {
    status=jason['status'];
    message=jason['message'];
    jason['data'] != null ? DataRegister.fromJason(jason['data']) : null ;

  }
}
class DataRegister
{
  String? name ;
  String? email ;
  String? password ;
  int? phone ;
  DataRegister.fromJason(Map<String ,dynamic> jason)
  {
    name=jason['name'];
    email=jason['email'];
    password=jason['password'];
    phone=jason['phone'];
  }
}
