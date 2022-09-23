import 'package:iShoppin/main.dart';
import 'package:iShoppin/screens/account_screen/account_screen.dart';
import 'package:iShoppin/screens/account_screen/address/address.dart';
import 'package:iShoppin/screens/account_screen/my_orders/my_orders.dart';
import 'package:iShoppin/screens/account_screen/my_points/my_points.dart';
import 'package:iShoppin/screens/account_screen/payment/payment.dart';
import 'package:iShoppin/screens/account_screen/profile/change_email/change_email.dart';
import 'package:iShoppin/screens/account_screen/profile/change_name/change_name.dart';
import 'package:iShoppin/screens/account_screen/profile/change_password/change_password.dart';
import 'package:iShoppin/screens/account_screen/profile/change_phoneNumber/change_phoneNumber.dart';
import 'package:iShoppin/screens/account_screen/profile/profile.dart';
import 'package:iShoppin/screens/account_screen/settings/contact_us/contact_us.dart';
import 'package:iShoppin/screens/account_screen/settings/contact_us/contact_us_two.dart';
import 'package:iShoppin/screens/account_screen/settings/delete_account/delete_account.dart';
import 'package:iShoppin/screens/account_screen/settings/settings.dart';
import 'package:iShoppin/screens/auth/login_screen/login_screen.dart';
import 'package:iShoppin/screens/auth/sign_up_screen/otp_verification/otp_verification.dart';
import 'package:iShoppin/screens/auth/sign_up_screen/sign_up_screen.dart';
import 'package:iShoppin/screens/home_screen/categories_screen/categories_screen.dart';
import 'package:iShoppin/screens/home_screen/check_out_screen/checkout_screen.dart';
import 'package:iShoppin/screens/home_screen/check_out_screen/confirm_order/confirm_order.dart';
import 'package:iShoppin/screens/home_screen/check_out_screen/payment_method/payment_method.dart';
import 'package:iShoppin/screens/home_screen/check_out_screen/ship_to/ship.dart';
import 'package:iShoppin/screens/home_screen/check_out_screen/success/success.dart';
import 'package:iShoppin/screens/home_screen/home_screen.dart';
import 'package:iShoppin/screens/home_screen/product_detail/product_detail.dart';
import 'package:iShoppin/screens/onboarding_screens/onboarding_view.dart';
import 'package:flutter/material.dart';

class Routes {
  Routes._privateConstructor();

  static const String homeScreen = "/homeScreen";
  static const String categoriesScreen = '/categoriesScreen';
  static const String productDetails = "/productDetails";
  static const String onboardingScreen = "/onboardingScreen";
  static const String loginScreen = "/loginScreen";
  static const String signUpScreen = "/signUpScreen";
  static const String otpVerification = "/otpVerification";
  static const String connected_screen = '/connected_screen';

  static const String profileScreen = "/profileScreen";
  static const String myPointsScreen = "/myPointsScreen";
  static const String myOrdersScreen = "/myOrdersScreen";
  static const String addressesScreen = "/addressesScreen";
  static const String paymentScreen = "/paymentScreen";
  static const String settingsScreen = "/settingsScreen";
  static const String accountsScreen = "/accountsScreen";
  static const String shoppingApp = "/shoppingApp";

  /// under profile screen
  static const String changePhoneNumber = "/changePhoneNumber";
  static const String changeEmail = "/changeEmail";
  static const String changePassword = "/changePassword";
  static const String changeName = "/changeName";

  ///
  static const String deleteAccount = "/deleteAccount";

  // account screen

  static const String contactUs = "/contactUs";
  static const String contactUsTwo = "/contactUsTwo";
  static const String cartScreen = "/cartScreen";

  static const String shipTo = 'shipTo';
  static const String paymentsMethods = 'paymentsMethods';
  static const String confirmOrder = 'confirmOrder';


static const String successScreen = 'successScreen';

  static Map<String, Widget Function(BuildContext)> routes =
      <String, WidgetBuilder>{
    homeScreen: (_) => HomeScreen(),
    productDetails: (_) => ProductDetails(),
    categoriesScreen: (_) => CategoriesScreen(),
    onboardingScreen: (_) => OnBoardingBaseView(),
    loginScreen: (_) => LoginScreen(),
    signUpScreen: (_) => SignUpScreen(),
    otpVerification: (_) => OtpVerification(),
    profileScreen: (_) => ProfileScreen(),
    myPointsScreen: (_) => MyPointsScreen(),
    myOrdersScreen: (_) => MyOrdersScreen(),
    addressesScreen: (_) => AddressScreen(),
    paymentScreen: (_) => PaymentScreen(),
    settingsScreen: (_) => SettingsScreen(),
    accountsScreen: (_) => AccountScreen(),
    shoppingApp: (_) => ShoppingApp(),
    changeEmail: (_) => ChangeEmail(),
    changePhoneNumber: (context) => ChangePhoneNumber(),
    changeName: (context) => ChangeName(),
    changePassword: (context) => ChangePassword(),
    deleteAccount: (context) => DeleteAccount(),
    contactUs: ((context) => ContactUs()),
    contactUsTwo: (context) => ContactUsTwo(),
    cartScreen: (context) => CartScreen(),
    shipTo: (context) => ShipTo(),
    paymentsMethods: (context) => PaymentMethods(),
    confirmOrder: (context) => ConfirmOrder(),
    successScreen:(context)=>SuccessScreen(),
  };
}
