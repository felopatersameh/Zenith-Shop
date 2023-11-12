
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../layout/shopshoplayout/shoplayout.dart';
import '../../../shared/Components/components.dart';
import '../../../shared/network/local/cachehelper.dart';
import '../../../shared/styles/colors.dart';
import '../sing_in/singin_shop.dart';
import 'cubitloginshop/cubit_login_shop_cubit.dart';

var emailcontroler = TextEditingController();
var passwarscontroler = TextEditingController();
var formkey = GlobalKey<FormState>();

class LoginShop extends StatelessWidget {
  const LoginShop({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginShopCubit, LoginShopState>(
      listener: (context, state) {
        if (state is LoginShopSucsess) {
          if (state.model1.status == false) {
            showMessage(text: '${state.model1.message}', state: ToastStates.error);
          } else {
            showMessage(text: '${state.model1.message}', state: ToastStates.succeed);
            CashHelper.saveData(key: 'token', value: state.model1.data?.token).then((value) {
              Navigator.pushAndRemoveUntil(context,
                  MaterialPageRoute(builder: (context) => const ShopLayout()), (route) => false);
            });

          }
        }
      },
      builder: (context, state) => Scaffold(
        backgroundColor: prinarycolor,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  height: 350,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.zero,
                        topRight: Radius.zero,
                        bottomLeft: Radius.zero,
                        bottomRight: Radius.zero),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'LOGIN',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Colors.white, fontSize: 50),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(150),
                        bottomLeft: Radius.zero,
                        bottomRight: Radius.zero,
                        topRight: Radius.zero),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Form(
                      key: formkey,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 90,
                            ),
                            defulettextFormField(
                              text: 'Email',
                              type: TextInputType.emailAddress,
                              prefix: Icons.email_rounded,
                              controller: emailcontroler,
                              inputValidator: (value) {
                                if (value?.isEmpty == true) {
                                  return 'Inpute Your Email Please';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            defulettextFormField(
                              submitted: (value) {
                                if (formkey.currentState?.validate() == true) {
                                  LoginShopCubit.get(context).postDataUser(
                                      email: emailcontroler.text, password: passwarscontroler.text);
                                }
                              },
                              text: 'Passward',
                              type: TextInputType.visiblePassword,
                              prefix: Icons.lock_clock_rounded,
                              ispassward: LoginShopCubit.get(context).isshowpassward,
                              suffix: LoginShopCubit.get(context).iconssuffic,
                              pressSuffixx: () {
                                LoginShopCubit.get(context).changeshowpassward();
                              },
                              controller: passwarscontroler,
                              inputValidator: (value) {
                                if (value?.isEmpty == true) {
                                  return 'Inpute Your Passward Please';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            ConditionalBuilder(
                              condition: state is! LoginShopLoadding,
                              fallback: (context) =>
                                  const Center(child: CircularProgressIndicator()),
                              builder: (context) => defuletButton(
                                  padding: const EdgeInsetsDirectional.only(bottom: 15, top: 15),
                                  fontSize: 20,
                                  press: () {
                                    if (formkey.currentState?.validate() == true) {
                                      LoginShopCubit.get(context).postDataUser(
                                          email: emailcontroler.text,
                                          password: passwarscontroler.text);
                                    }
                                  },
                                  text: 'Login',
                                  background: secondarycolor,
                                  width: 400),
                            ),
                            const SizedBox(
                              height: 35,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Create Account ? ',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(fontSize: 18)),
                                const SizedBox(
                                  width: 5,
                                ),
                                InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => const SinginShop(),
                                          ));
                                    },
                                    child: const Text(
                                      'Sing in',
                                      style: TextStyle(color: secondarycolor),
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
