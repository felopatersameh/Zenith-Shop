import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/network/endPoints.dart';
import '../../../../shared/network/remote/dio.dart';
import '../loginshopmodel/loginshopmodel.dart';

part 'cubit_login_shop_state.dart';

class LoginShopCubit extends Cubit<LoginShopState> {
  LoginShopCubit() : super(LoginShopInitial());

  static LoginShopCubit get(context) => BlocProvider.of(context);

//------------------------------------------------------------
  bool isshowpassward = true;
  IconData iconssuffic = Icons.visibility_rounded;

  void changeshowpassward() {
    isshowpassward = !isshowpassward;
    isshowpassward == true
        ? iconssuffic = Icons.visibility_rounded
        : iconssuffic = Icons.visibility_off_rounded;

    emit(LoginShopChangesShowPasswardextends());
  }


  void postDataUser(
      {
        required String email,
        required String password
      })
  {
    emit(LoginShopLoadding());
    DioHelper.postData(path: login,
        data: {
      'email': email,
      'password': password
    }).then((value)
    {
      LoginShopModel model1 =LoginShopModel.fromJason(value.data) ;
      // print(value);
      emit(LoginShopSucsess(model1));
    }).catchError((error) {
      // print(error.toString()) ;
      emit(LoginShopFailed(error.toString()));
    });
  }
}
//------------------------------------------------------------


