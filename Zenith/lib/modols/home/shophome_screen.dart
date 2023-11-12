import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../layout/shopshoplayout/cubitshop/cubit.dart';
import '../../../layout/shopshoplayout/cubitshop/states.dart';
import 'home_model/models_home.dart';

class ShopApp extends StatelessWidget {
  const ShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitShop, StatesShop>(
      listener: (context, state) {},
      builder: (context, state) => ConditionalBuilder(
        condition: CubitShop.get(context).model != null,
        fallback: (context) => const Center(child: CircularProgressIndicator()),
        builder: (context) => prodectBiulder(CubitShop.get(context).model!),
      ),
    );
  }
}

Widget prodectBiulder(ShopDataHome model2) => Column(
      children: [
        CarouselSlider(
            items: model2.data!.banners
                ?.map((e) => Image(
                      image: NetworkImage(e.image!),
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ))
                .toList(),
            options: CarouselOptions(
                height: 250,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: false,
                autoPlayAnimationDuration: const Duration(seconds: 3),
                autoPlayInterval: const Duration(seconds: 1),
                autoPlayCurve: Curves.slowMiddle,
                scrollDirection: Axis.horizontal))
      ],
    );
