import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'layout/shopshoplayout/cubitshop/cubit.dart';
import 'layout/shopshoplayout/shoplayout.dart';
import 'modols/log_in/cubitloginshop/cubit_login_shop_cubit.dart';
import 'modols/log_in/login_screen.dart';
import 'modols/on_boarding/onbording_screen.dart';
import 'modols/sing_in/cubitsinginshop/cubit_singin_shop_cubit.dart';
import 'shared/Components/constant.dart';
import 'shared/appcubit/cubit.dart';
import 'shared/appcubit/states.dart';
import 'shared/bloc/bloc_observer.dart';
import 'shared/network/local/cachehelper.dart';
import 'shared/network/remote/dio.dart';
import 'shared/styles/thems.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CashHelper.init();
  final Widget screens;

  bool isDark = CashHelper.getData(key: 'isDark') == true;
  bool onboarding = CashHelper.getData(key: 'OnBoarding') == true;
  token = CashHelper.getData(key: 'token');
  if (onboarding) {
    if (token == null) {
      screens = const ShopLayout();
    } else {
      screens = const LoginShop();
    }
  } else {
    screens = const OnBordingShop();
  }

  runApp(Myapp(
    isDark,
    screens: screens,
  ));
}

class Myapp extends StatelessWidget {
  final bool? isDark;
  final Widget screens;

  const Myapp(this.isDark, {super.key, required this.screens});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => Appcubit()..changethemesdark(formshared: isDark)),
        BlocProvider(create: (context) => CubitShop()..getdata()),
        BlocProvider(create: (context) => LoginShopCubit()),
        BlocProvider(create: (context) => SinginShopCubit()),
      ],
      child: BlocConsumer<Appcubit, Appstate>(
          listener: (context, state) {},
          builder: (context, state) => MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: lightthem,
                darkTheme: darkthem,
                themeMode: Appcubit.get(context).isdark ? ThemeMode.dark : ThemeMode.light,
                home: screens,
              )),
    );
  }
}
