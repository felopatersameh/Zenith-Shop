import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/network/remote/dio.dart';
import 'cubit_singin_shop_state.dart';

class SinginShopCubit extends Cubit<SinginShopState> {
  SinginShopCubit() : super(SinginShopInitial());

  static SinginShopCubit get(context) => BlocProvider.of(context);

  void postDataRegister(
      {required String email,
      required String password,
      required String name,
      required String phone}) {
    emit(SinginShopLoadding());

    DioHelper.postData(path: 'register', data: {
      'email': email,
      'password': password,
      'name': name,
      'phone': phone,
    }).then((value) {
      // print(value);
      emit(SinginShopSucsess());
    }).catchError((error) {
      // print(error.toString()) ;
      emit(SinginShopFailed());
    });
  }

  bool isshowpassward = true;
  IconData iconssuffic = Icons.visibility_rounded;

  void changeshowpassward() {
    isshowpassward = !isshowpassward;
    isshowpassward == true
        ? iconssuffic = Icons.visibility_rounded
        : iconssuffic = Icons.visibility_off_rounded;

    emit(SinginShopChangesShowPassward());
  }
}
