import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zenith/layout/shopshoplayout/cubitshop/states.dart';

import '../../../modols/category/category_screen.dart';
import '../../../modols/favorite/favorite_screen.dart';
import '../../../modols/home/home_model/models_home.dart';
import '../../../modols/home/shophome_screen.dart';
import '../../../modols/setting/setting_screen.dart';
import '../../../shared/Components/constant.dart';
import '../../../shared/network/endPoints.dart';
import '../../../shared/network/remote/dio.dart';

class CubitShop extends Cubit<StatesShop> {
  CubitShop() : super(Inizlization());

  static CubitShop get(context) => BlocProvider.of(context);

  int newIndex = 0;

  List<Widget> screens = [
    const ShopApp(),
    const CategoriesApp(),
    const FavoriteApp(),
    const SetttingOfAppShop()
  ];

  void bottomNAv(int index) {
    newIndex = index;
    emit(ChangeNavBottomShop());
  }

  ShopDataHome? model;

  void getdata() {
    emit(ShopLoadingHomeData());

    DioHelper.getData(path: home, token: token).then((value) {
      model = ShopDataHome.fromJason(value.data);
      // print(model?.data?.banners?[1].id);
      emit(ShopSuccesHomeData());
    }).catchError((error) {
      emit(ShopErrorHomeData(error.toString()));
    });
  }
}
