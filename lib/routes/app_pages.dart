import 'package:eventori/view/auth/screens/add_profile_photo_screen.dart';
import 'package:eventori/view/bottom_nav_bar/nav_bar_screen.dart';
import 'package:eventori/view/roles/customer/event/screen/my_event_screeen.dart';
import 'package:get/get.dart';
import '../view/auth/screens/create_new_password_screen.dart';
import '../view/auth/screens/forgot_password_screen.dart';
import '../view/auth/screens/login_screen.dart';
import '../view/auth/screens/sign_up_screen.dart';
import '../view/auth/screens/verify_account_screen.dart';
import '../view/auth/screens/verify_forget_password_otp_screen.dart';
import '../view/onboarding/onboarding_screen.dart';
import '../view/onboarding/selection_screen.dart';
import '../view/profile/screen/profile_screen.dart';
import '../view/roles/customer/Dashboard/screen/add_collaborators_screen.dart';
import '../view/roles/customer/Dashboard/screen/tasks_dashboard_screen.dart';
import '../view/roles/customer/Dashboard/screen/vendors_dashboard_screen.dart';
import '../view/roles/customer/chat/screen/chat_detailed_screen.dart';
import '../view/roles/customer/home/screens/dashboard_screen.dart';
import '../view/roles/customer/home/screens/events_screen.dart';
import '../view/roles/customer/home/screens/forum_screen.dart';
import '../view/roles/customer/home/screens/home_screen.dart';
import '../view/roles/customer/home/screens/vendors_screen.dart';
import '../view/roles/customer/search/screens/faviourte_vendors_screen.dart';
import '../view/roles/customer/search/screens/report_vendor_screen.dart';
import '../view/roles/customer/search/screens/vendor_detailed_screen.dart';
import '../view/splash/splash_screen.dart';
import 'app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(name: AppRoutes.splash, page: () =>  SplashScreen()),
    GetPage(name: AppRoutes.onboradingScreen, page: () =>  OnboardingScreen()),
    GetPage(name: AppRoutes.selectionScreen, page: () =>  SelectionScreen()),
    GetPage(name: AppRoutes.addProfilePhotoPage, page: () =>  AddProfilePhotoPage()),
    GetPage(name: AppRoutes.loginScreen, page: () =>  LoginScreen()),
    GetPage(name: AppRoutes.signUpScreen, page: () =>  SignUpScreen()),
    GetPage(name: AppRoutes.verifyAccountScreen, page: () =>  VerifyAccountScreen()),
    GetPage(name: AppRoutes.forgotPasswordScreen, page: () =>  ForgotPasswordScreen()),
    GetPage(name: AppRoutes.verifyForgetPasswordOTPScreen, page: () =>  VerifyForgetPasswordOTPScreen()),
    GetPage(name: AppRoutes.createNewPasswordScreen, page: () =>  CreateNewPasswordScreen()),
    GetPage(name: AppRoutes.navBarScreen, page: () =>  NavBarScreen()),
    // GetPage(name: AppRoutes.createEventScreen, page: () =>  CreateEventScreen()),
    GetPage(name: AppRoutes.myEventScreeen, page: () =>  MyEventsScreen()),
    GetPage(name: AppRoutes.dashboardScreen, page: () =>  DashboardScreen()),
    GetPage(name: AppRoutes.homeScreen, page: () =>  HomeScreen()),
    GetPage(name: AppRoutes.eventsScreen, page: () =>  EventsScreen()),
    GetPage(name: AppRoutes.vendorsScreen, page: () =>  VendorsScreen()),
    GetPage(name: AppRoutes.forumScreen, page: () =>  ForumScreen()),
    GetPage(name: AppRoutes.teamChatScreen, page: () =>  ChatDetailedScreen()),
    GetPage(name: AppRoutes.profileScreen, page: () =>  ProfileScreen()),
    GetPage(name: AppRoutes.addCollaboratorsScreen, page: () =>  AddCollaboratorsScreen()),
    GetPage(name: AppRoutes.vendorsDashboardScreen, page: () =>  VendorsDashboardScreen()),
    GetPage(name: AppRoutes.tasksDashboardScreen, page: () =>  TasksDashboardScreen()),
    GetPage(name: AppRoutes.vendorDetailedScreen, page: () =>  VendorDetailedScreen()),
    GetPage(name: AppRoutes.reportVendorScreen, page: () =>  ReportVendorScreen()),
    GetPage(name: AppRoutes.faviourteVendorsScreen, page: () =>  FaviourteVendorsScreen()),

  ];
}