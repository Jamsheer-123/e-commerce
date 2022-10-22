import 'package:get/get.dart';

import 'package:e_cart_shopping/app/modules/Detailed_page/bindings/detailed_page_binding.dart';
import 'package:e_cart_shopping/app/modules/Detailed_page/views/detailed_page_view.dart';
import 'package:e_cart_shopping/app/modules/add_adress/bindings/add_adress_binding.dart';
import 'package:e_cart_shopping/app/modules/add_adress/views/add_adress_view.dart';
import 'package:e_cart_shopping/app/modules/adress/bindings/adress_binding.dart';
import 'package:e_cart_shopping/app/modules/adress/views/adress_view.dart';
import 'package:e_cart_shopping/app/modules/cart/bindings/cart_binding.dart';
import 'package:e_cart_shopping/app/modules/cart/views/cart_view.dart';
import 'package:e_cart_shopping/app/modules/dash/bindings/dash_binding.dart';
import 'package:e_cart_shopping/app/modules/dash/views/dash_view.dart';
import 'package:e_cart_shopping/app/modules/home/bindings/home_binding.dart';
import 'package:e_cart_shopping/app/modules/home/views/home_view.dart';
import 'package:e_cart_shopping/app/modules/login/bindings/login_binding.dart';
import 'package:e_cart_shopping/app/modules/login/views/login_view.dart';
import 'package:e_cart_shopping/app/modules/my_account/bindings/my_account_binding.dart';
import 'package:e_cart_shopping/app/modules/my_account/views/my_account_view.dart';
import 'package:e_cart_shopping/app/modules/order_summery/bindings/order_summery_binding.dart';
import 'package:e_cart_shopping/app/modules/order_summery/views/order_summery_view.dart';
import 'package:e_cart_shopping/app/modules/profile/bindings/profile_binding.dart';
import 'package:e_cart_shopping/app/modules/profile/views/profile_view.dart';
import 'package:e_cart_shopping/app/modules/search/bindings/search_binding.dart';
import 'package:e_cart_shopping/app/modules/search/views/search_view.dart';
import 'package:e_cart_shopping/app/modules/show_product/bindings/show_product_binding.dart';
import 'package:e_cart_shopping/app/modules/show_product/views/show_product_view.dart';
import 'package:e_cart_shopping/app/modules/sinup/bindings/sinup_binding.dart';
import 'package:e_cart_shopping/app/modules/sinup/views/sinup_view.dart';
import 'package:e_cart_shopping/app/modules/splash/bindings/splash_binding.dart';
import 'package:e_cart_shopping/app/modules/splash/views/splash_view.dart';
import 'package:e_cart_shopping/app/modules/wishlist/bindings/wishlist_binding.dart';
import 'package:e_cart_shopping/app/modules/wishlist/views/wishlist_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SINUP,
      page: () => SinupView(),
      binding: SinupBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.DASH,
      page: () => DashView(),
      binding: DashBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.DETAILED_PAGE,
      page: () => DetailedPageView(),
      binding: DetailedPageBinding(),
    ),
    GetPage(
      name: _Paths.CART,
      page: () => CartView(),
      binding: CartBinding(),
    ),
    GetPage(
      name: _Paths.MY_ACCOUNT,
      page: () => MyAccountView(),
      binding: MyAccountBinding(),
    ),
    GetPage(
      name: _Paths.ORDER_SUMMERY,
      page: () => OrderSummeryView(),
      binding: OrderSummeryBinding(),
    ),
    GetPage(
      name: _Paths.ADRESS,
      page: () => AdressView(),
      binding: AdressBinding(),
    ),
    GetPage(
      name: _Paths.ADD_ADRESS,
      page: () => AddAdressView(),
      binding: AddAdressBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH,
      page: () => SearchView(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: _Paths.SHOW_PRODUCT,
      page: () => ShowProductView(),
      binding: ShowProductBinding(),
    ),
    GetPage(
      name: _Paths.WISHLIST,
      page: () => WishlistView(),
      binding: WishlistBinding(),
    ),
  ];
}
