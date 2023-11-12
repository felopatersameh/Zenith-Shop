
import '../network/local/cachehelper.dart';

void singout({
  required String key,
}) {
  CashHelper.removeData(key: key);
}

String? token;
