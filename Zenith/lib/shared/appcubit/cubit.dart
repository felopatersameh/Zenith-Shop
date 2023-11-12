import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zenith/shared/appcubit/states.dart';

import '../../../shared/network/local/cachehelper.dart';

           //    emit('clss()');

class Appcubit extends Cubit<Appstate>
{
  Appcubit() : super(Initialstates());

  static Appcubit get(context)=> BlocProvider.of (context);

  bool isdark = false;

  void changethemesdark({bool? formshared}) {
    if (formshared != null) {
      isdark = formshared;
      emit(ChangeThemesDark());
    } else {
      isdark = !isdark;
      CashHelper.putBoolean(key: 'isDark', value: isdark).then((value) {
        emit(ChangeThemesDark());
      });
    }
  }

}
