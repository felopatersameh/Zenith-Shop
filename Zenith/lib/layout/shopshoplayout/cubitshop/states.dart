abstract class StatesShop {}

class Inizlization extends StatesShop {}

class ChangeNavBottomShop extends StatesShop {}

class ShopLoadingHomeData extends StatesShop {}

class ShopSuccesHomeData extends StatesShop {}

class ShopErrorHomeData extends StatesShop {
  final String error ;
  ShopErrorHomeData(this.error);
}
