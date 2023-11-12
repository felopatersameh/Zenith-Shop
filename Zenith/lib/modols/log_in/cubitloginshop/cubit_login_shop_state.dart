part of 'cubit_login_shop_cubit.dart';

abstract class LoginShopState {}

class LoginShopInitial extends LoginShopState {}

class LoginShopLoadding extends LoginShopState {}

class LoginShopSucsess extends LoginShopState
{
  final LoginShopModel model1 ;

  LoginShopSucsess(this.model1);

}

class LoginShopChangesShowPasswardextends extends LoginShopState {}

class LoginShopFailed extends LoginShopState {
  final String error ;
  LoginShopFailed(this.error) ;
}
