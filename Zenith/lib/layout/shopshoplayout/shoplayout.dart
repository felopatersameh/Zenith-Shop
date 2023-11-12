
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../modols/search/seaerch_screen.dart';
import 'cubitshop/cubit.dart';
import 'cubitshop/states.dart';

class ShopLayout extends StatelessWidget {
  const ShopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitShop, StatesShop>(

      listener: (context, state) {
      },
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title:const Text('Shop App'),
              actions: [IconButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchAppShop(),));
              }, icon: const Icon(Icons.search))],
            ) ,
            body: CubitShop.get(context).screens[CubitShop.get(context).newIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: CubitShop.get(context).newIndex,
             items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home_filled ), label: 'Home') ,
                BottomNavigationBarItem(icon: Icon(Icons.category_rounded), label: 'Catogories') ,
                BottomNavigationBarItem(icon: Icon(Icons.favorite_rounded ), label: 'Favorite') ,
                BottomNavigationBarItem(icon: Icon(Icons.settings ), label: 'Setting') ,
            ],
            onTap: (value)  {
              CubitShop.get(context).bottomNAv(value) ;
            },
          ),
        );
      },
    );
  }
}
