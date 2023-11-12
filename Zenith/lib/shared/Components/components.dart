import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../modols/log_in/login_screen.dart';
import '../network/local/cachehelper.dart';

//-------------------------------------------------------- // For_ALL
Widget defuletButton(
        {required void Function() press,
        required String text,
        double? width,
        Color background = Colors.teal,
        double? fontSize,
        EdgeInsetsGeometry? padding}) =>
    Container(
      width: width,
      color: background,
      child: MaterialButton(
        padding: padding,
        onPressed: press,
        child: Text(text, style: TextStyle(fontSize: fontSize)),
      ),
    );

Widget defulettextFormField(
        {required var text,
        required TextInputType type,
        TextEditingController? controller,
        IconData? prefix,
        IconData? suffix,
        bool ispassward = false,
        Function()? pressSuffixx,
        Function()? tap,
        String? Function(String?)? inputValidator,
        ValueChanged<String>? submitted}) =>
    TextFormField(
      onFieldSubmitted: submitted,
      controller: controller,
      onTap: tap,
      keyboardType: type,
      obscureText: ispassward,
      validator: inputValidator,
      decoration: InputDecoration(
        labelText: '$text',
        prefixIcon: Icon(prefix),
        suffixIcon: IconButton(onPressed: pressSuffixx, icon: Icon(suffix)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );

//-------------------------------------------------------------- // Shop_App
List<BoardingModel> padges = [
  BoardingModel(image: 'assests/images/welcome.png', title: 'Shop Zenith', text: ''),
  BoardingModel(
      image: 'assests/images/v871batch5-tang-instagram-04.png',
      title: 'Shop Zenith',
      text:
          'Discover the ultimate shopping experience with Shop Zenith, where quality and style are at your fingertips!'),
  BoardingModel(
      image: 'assests/images/shopping-logo-svgrepo-com.png',
      title: 'Shop Zenith',
      text:
          'Get ready for an exceptional shopping experience in the world of Shop Zenith, where diversity and ease meet in one platform'),
];

class BoardingModel {
  final String image;

  final String title;

  final String text;

  BoardingModel({
    required this.image,
    required this.title,
    required this.text,
  });
}

Widget buildpadge(BoardingModel model) => ListView(
      scrollDirection: Axis.vertical,
      children: [
        Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.zero,
                  bottomRight: Radius.zero,
                  topLeft: Radius.zero,
                  topRight: Radius.zero)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Image(
                image: AssetImage(
                  model.image,
                ),
                fit: BoxFit.contain,
              ),
              const SizedBox(
                height: 50,
              ),
              Text(model.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 25,
                      fontFamily: 'Extra',
                      color: Color.fromARGB(255, 242, 240, 239))),
              const SizedBox(
                height: 20,
              ),
              Text(model.text,
                  style: const TextStyle(
                      fontSize: 18,
                      fontFamily: 'Extra',
                      color: Color.fromARGB(255, 255, 255, 255))),
            ]),
          ),
        ),
      ],
    );

void tapSkipOnboarding(context) {
  CashHelper.saveData(key: 'OnBoarding', value: true).then((value) => {
        if (value)
          {
            Navigator.pushAndRemoveUntil(context,
                MaterialPageRoute(builder: (context) => const LoginShop()), (route) => false)
          }
      });
}

void showMessage({
  required String text,
  required ToastStates state,
}) {
  Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: choseToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0);
}

enum ToastStates { error, warning, succeed }

Color choseToastColor(ToastStates state) {
  switch (state) {
    case ToastStates.succeed:
      return Colors.green;
    case ToastStates.error:
      return Colors.red;
    case ToastStates.warning:
      return Colors.amber;
  }
}
