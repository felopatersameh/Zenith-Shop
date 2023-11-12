import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../layout/shopshoplayout/shoplayout.dart';
import '../../../shared/Components/components.dart';
import '../../../shared/styles/colors.dart';
import 'cubitsinginshop/cubit_singin_shop_cubit.dart';
import 'cubitsinginshop/cubit_singin_shop_state.dart';

var namecontroler = TextEditingController();
var emailcontroler = TextEditingController();
var phonecontroler = TextEditingController();
var passwarscontroler = TextEditingController();
var formkey = GlobalKey<FormState>();

class SinginShop extends StatelessWidget {
  const SinginShop({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SinginShopCubit, SinginShopState>(
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
        backgroundColor: prinarycolor,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: SizedBox(
                  height: 350,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'SING IN',
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
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: formkey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 60,
                            ),
                            defulettextFormField(
                              text: 'Name',
                              type: TextInputType.name,
                              prefix: Icons.person_2_rounded,
                              controller: namecontroler,
                              inputValidator: (value) {
                                if (value?.isEmpty == true) {
                                  return 'Inpute Your Name Please';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 30,
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
                              text: 'Phone',
                              type: TextInputType.phone,
                              prefix: Icons.phone_android_rounded,
                              controller: phonecontroler,
                              inputValidator: (value) {
                                if (value?.isEmpty == true) {
                                  return 'Inpute Your Phone Please';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            defulettextFormField(
                              text: 'Passward',
                              type: TextInputType.visiblePassword,
                              prefix: Icons.lock_clock_rounded,
                              ispassward: SinginShopCubit.get(context).isshowpassward,
                              suffix: SinginShopCubit.get(context).iconssuffic,
                              pressSuffixx: () {
                                SinginShopCubit.get(context).changeshowpassward();
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
                              condition: state is! SinginShopCubit,
                              fallback: (context) =>
                                  const Center(child: CircularProgressIndicator()),
                              builder: (context) => defuletButton(
                                  padding: const EdgeInsetsDirectional.only(bottom: 15, top: 15),
                                  fontSize: 20,
                                  press: () {
                                    if (formkey.currentState?.validate() == true) {
                                      SinginShopCubit.get(context).postDataRegister(
                                          email: emailcontroler.text,
                                          password: passwarscontroler.text,
                                          name: namecontroler.text,
                                          phone: phonecontroler.text);
                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => const ShopLayout(),
                                          ),
                                          (route) => false);
                                    }
                                  },
                                  text: 'Singin',
                                  background: secondarycolor,
                                  width: 400),
                            ),
                            const SizedBox(
                              height: 35,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('You Have Already ! ',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(fontSize: 18)),
                                const SizedBox(
                                  width: 5,
                                ),
                                InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      'Login',
                                      style: TextStyle(color: secondarycolor),
                                    )),
                              ],
                            )
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
