import 'dart:convert';
import 'dart:core';
import 'dart:ffi';
import 'dart:io';
import 'dart:ui';
import 'package:eventori/view/auth/controller/base_controller.dart';
import 'package:get/get.dart';
import '../../../AppTheme/app_theme.dart';
import '../../../api_services/api_exceptions.dart';
import '../../../api_services/data_api.dart';
import '../../../models/user_model.dart';
import '../../../routes/app_routes.dart';
import '../../../services/shared_preferences/shared_preference.dart';
import '../../../utils/custom_dialog.dart';
import '../../../utils/snackbar_util.dart';

class AuthController extends GetxController {
  // SignUp Screen States
  var signUpSamePassword = false.obs;
  var signUpHasMinLength = false.obs;
  var signUpHasUppercase = false.obs;
  var signUpHasLowercase = false.obs;
  var signUpHasNumber = false.obs;
  var signUpHasSpecialChar = false.obs;

  RxString imagePath=''.obs;
  final Rx<File?> selectedProfileImage = Rx<File?>(null);

  // Create New Password Screen States
  var createPasswordSamePassword = false.obs;
  var createPasswordHasMinLength = false.obs;
  var createPasswordHasUppercase = false.obs;
  var createPasswordHasLowercase = false.obs;
  var createPasswordHasNumber = false.obs;
  var createPasswordHasSpecialChar = false.obs;

  // Password Visibility
  var obscurePassword = true.obs;
  var obscureConfirmPassword = true.obs;

  var isLoading = false.obs;

  RxString accessToken = "".obs;
  final BaseController _baseController = BaseController.instance;



  RxString storedEmailForReuse = ''.obs;
  RxString storedPasswordForReuse = ''.obs;
  RxString storedFirstNameForReuse = ''.obs;
  RxString storedLastNameForReuse = ''.obs;
  RxString storedRoleForReuse=''.obs;

  Rxn<UserModel> userData=Rxn<UserModel>();
  final AuthPreference _authPreference = AuthPreference.instance;




  Future signUpUser(String firstName, String lastName, String email, String password,String role) async {
    print(imagePath.value);
    _baseController.showLoading();
    Map<String, String> body = {
      "firstName":firstName ,
      "lastName": lastName,
      "email": email,
      "password": password,
      "role": role,
      "fcmToken":'hjhj'
    };
    var response='';
    if(imagePath.isEmpty){
      response = await DataApiService.instance
          .post('/signup', body)
          .catchError((error) {
        if (error is BadRequestException) {
          var apiError = json.decode(error.message!);
          print("object...");
          SnackbarUtil.showSnackbar(message: apiError.toString(), type: SnackbarType.error);
        } else {
          print("objsaghect...");
          _baseController.handleError(error);
        }
      });
    }else{
      response = await DataApiService.instance
          .multiPartImage('/signup',[imagePath.value],'image', body)
          .catchError((error) {
        if (error is BadRequestException) {
          var apiError = json.decode(error.message!);
          SnackbarUtil.showSnackbar(message: apiError.toString(), type: SnackbarType.error);
        } else {
          _baseController.handleError(error);
        }
      });
    }


    update();
    _baseController.hideLoading();
    if (response == null) return;
    print(response + " responded");
    print(imagePath);
    var result = json.decode(response);
    print(result['message']);
    print(result['success']);
    if (result['success'].toString()=="true" && result['message']=="Successful") {

      Get.toNamed(AppRoutes.verifyAccountScreen);
      accessToken.value=result['data']['token'];
      // signUpOtp.value=result['data']['otp'];
      SnackbarUtil.showSnackbar(message: result['data']['otp'], type: SnackbarType.success);


      storedEmailForReuse.value=email;
      storedPasswordForReuse.value=password;
      storedFirstNameForReuse.value=firstName;
      storedLastNameForReuse.value=lastName;
      storedRoleForReuse.value=role;


    } else if(result['status'].toString()=="failed"&&result['error'].toString()=="true"){
      String message = result['data']['message'];
      SnackbarUtil.showSnackbar(message: message, type: SnackbarType.error);
    }
  }

  Future resendOtpToVerifyRegisteredUser() async {
    print(imagePath.value);
    _baseController.showLoading();
    Map<String, String> body = {
      "firstName":storedFirstNameForReuse.value,
      "lastName": storedLastNameForReuse.value,
      "email": storedEmailForReuse.value,
      "password": storedPasswordForReuse.value,
      "role": storedRoleForReuse.value,
      "fcmToken":'hjhj'
    };
    var response='';
    if(imagePath.isEmpty){
      response = await DataApiService.instance
          .post('/signup', body)
          .catchError((error) {
        if (error is BadRequestException) {
          var apiError = json.decode(error.message!);
          print("object...");
          SnackbarUtil.showSnackbar(message: apiError.toString(), type: SnackbarType.error);
        } else {
          print("objsaghect...");
          _baseController.handleError(error);
        }
      });
    }else{
      response = await DataApiService.instance
          .multiPartImage('/signup',[imagePath.value],'image', body)
          .catchError((error) {
        if (error is BadRequestException) {
          var apiError = json.decode(error.message!);
          SnackbarUtil.showSnackbar(message: apiError.toString(), type: SnackbarType.error);
        } else {
          _baseController.handleError(error);
        }
      });
    }


    update();
    _baseController.hideLoading();
    if (response == null) return;
    print(response + " responded");
    print(imagePath);
    var result = json.decode(response);
    print(result['message']);
    print(result['success']);
    if (result['success'].toString()=="true" && result['message']=="Successful") {


      accessToken.value=result['data']['token'];
      // signUpOtp.value=result['data']['otp'];
      SnackbarUtil.showSnackbar(message: result['data']['otp'], type: SnackbarType.success);


    } else if(result['status'].toString()=="failed"&&result['error'].toString()=="true"){
      String message = result['data']['message'];
      SnackbarUtil.showSnackbar(message: message, type: SnackbarType.error);
    }
  }

  Future verifyEmailRegisteredUser(String otp) async {
    print(imagePath.value);
    _baseController.showLoading();
    Map<String, String> body = {
      "otp":otp
    };

    var  response = await DataApiService.instance
          .post('/verify-otp', body)
          .catchError((error) {
        if (error is BadRequestException) {
          var apiError = json.decode(error.message!);
          print("object...");
          SnackbarUtil.showSnackbar(message: apiError.toString(), type: SnackbarType.error);
        } else {
          print("objsaghect...");
          _baseController.handleError(error);
        }
      });

    update();
    _baseController.hideLoading();
    if (response == null) return;
    print(response + " responded");
    print(imagePath);
    var result = json.decode(response);
    print(result['message']);
    print(result['success']);
    if (result['success'].toString()=="true") {

      loginUserAfterVerification();
    }
    else if(result['status'].toString()=="failed"&&result['error'].toString()=="true"){
      String message = result['data']['message'];
      SnackbarUtil.showSnackbar(message: message, type: SnackbarType.error);
    }
  }

  Future loginUserAfterVerification() async {
    print(imagePath.value);
    _baseController.showLoading();
    Map<String, String> body = {
      "email":storedEmailForReuse.value,
      "password":storedPasswordForReuse.value,
      "fcmToken":"hshshg"
    };

    var  response = await DataApiService.instance
        .post('/login', body)
        .catchError((error) {
      if (error is BadRequestException) {
        var apiError = json.decode(error.message!);
        SnackbarUtil.showSnackbar(message: apiError.toString(), type: SnackbarType.error);
      } else {
        _baseController.handleError(error);
      }
    });

    update();
    _baseController.hideLoading();
    if (response == null) return;
    print(response + " responded");
    print(imagePath);
    var result = json.decode(response);
    print(result['message']);
    print(result['success']);

    if (result['success'].toString()=="true" && result['message']=="Successful") {

      userData.value=UserModel.fromJson(result['data']);
      accessToken.value=result['data']['token'];
      _authPreference.saveUserData(data: jsonEncode(userData.value?.toJson()));
      _authPreference.saveUserDataToken(token: accessToken.value);
      _authPreference.setUserLoggedIn(true);

      Get.toNamed(AppRoutes.navBarScreen);

    }

    else if(result['status'].toString()=="failed"&&result['error'].toString()=="true"){
      String message = result['data']['message'];
      SnackbarUtil.showSnackbar(message: message, type: SnackbarType.error);
    }
  }


  Future loginUser(String email, String password) async {
    print(imagePath.value);
    _baseController.showLoading();
    Map<String, String> body = {
      "email":email,
      "password":password,
      "fcmToken":"hshshg"
    };

    var  response = await DataApiService.instance
        .post('/login', body)
        .catchError((error) {
      if (error is BadRequestException) {
        var apiError = json.decode(error.message!);
        SnackbarUtil.showSnackbar(message: apiError.toString(), type: SnackbarType.error);
      } else {
        _baseController.handleError(error);
      }
    });

    update();
    _baseController.hideLoading();
    if (response == null) return;
    print(response + " responded");
    print(imagePath);
    var result = json.decode(response);
    print(result['message']);
    print(result['success']);

    if (result['success'].toString()=="true" && result['message']=="Successful") {

      userData.value=UserModel.fromJson(result['data']);
      accessToken.value=result['data']['token'];
      _authPreference.saveUserData(data: jsonEncode(userData.value?.toJson()));
      _authPreference.saveUserDataToken(token: accessToken.value);
      _authPreference.setUserLoggedIn(true);

      Get.offAllNamed(AppRoutes.navBarScreen);

    }

    else if(result['status'].toString()=="failed"&&result['error'].toString()=="true"){
      String message = result['data']['message'];
      SnackbarUtil.showSnackbar(message: message, type: SnackbarType.error);
    }
  }




  // Method to set profile image
  void setProfileImage(File? path) {
    selectedProfileImage.value = path;
    void setProfileImage(File? path) {
      selectedProfileImage.value = path;
      if (path != null) {
        imagePath.value = path.path;
        // print(path.path);
      }
    }
  }
  // Method to remove profile image
  void removeProfileImage() {
    selectedProfileImage.value = null;
    print('Profile Image Removed');
  }
  // Method to get image path
  String? getImagePath() {
    return selectedProfileImage.value?.path;
  }


  /// Validate SignUp password requirements
  // void validateSignUpPassword(String password) {
  //   signUpHasMinLength.value = password.length >= 8;
  //   signUpHasUppercase.value = password.contains(RegExp(r'[A-Z]'));
  //   signUpHasLowercase.value = password.contains(RegExp(r'[a-z]'));
  //   signUpHasNumber.value = password.contains(RegExp(r'[0-9]'));
  //   signUpHasSpecialChar.value = password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  // }

  // /// Validate CreateNewPassword password requirements
  // void validateCreateNewPassword(String password) {
  //   createPasswordHasMinLength.value = password.length >= 8;
  //   createPasswordHasUppercase.value = password.contains(RegExp(r'[A-Z]'));
  //   createPasswordHasLowercase.value = password.contains(RegExp(r'[a-z]'));
  //   createPasswordHasNumber.value = password.contains(RegExp(r'[0-9]'));
  //   createPasswordHasSpecialChar.value = password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  // }

  /// Check if SignUp passwords match
  void checkSignUpPasswordsMatch(String password, String confirmPassword) {
    signUpSamePassword.value = confirmPassword == password && confirmPassword.isNotEmpty;
  }

  /// Check if CreateNewPassword passwords match
  void checkCreateNewPasswordsMatch(String password, String confirmPassword) {
    createPasswordSamePassword.value = confirmPassword == password && confirmPassword.isNotEmpty;
  }

  // Toggle visibility
  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }

  void toggleConfirmPasswordVisibility() {
    obscureConfirmPassword.value = !obscureConfirmPassword.value;
  }

  // /// Check if all SignUp password requirements are met
  // bool areSignUpPasswordRequirementsMet() {
  //   return signUpHasMinLength.value &&
  //       signUpHasUppercase.value &&
  //       signUpHasLowercase.value &&
  //       signUpHasNumber.value &&
  //       signUpHasSpecialChar.value &&
  //       signUpSamePassword.value;
  // }

  /// Check if all CreateNewPassword password requirements are met
  bool areCreateNewPasswordRequirementsMet() {
    return createPasswordHasMinLength.value &&
        createPasswordHasUppercase.value &&
        createPasswordHasLowercase.value &&
        createPasswordHasNumber.value &&
        createPasswordHasSpecialChar.value &&
        createPasswordSamePassword.value;
  }

  /// Calculate CreateNewPassword strength (0.0 to 1.0)
  double getCreateNewPasswordStrength() {
    int criteriaCount = 0;
    if (createPasswordSamePassword.value) criteriaCount++;
    if (createPasswordHasMinLength.value) criteriaCount++;
    if (createPasswordHasUppercase.value) criteriaCount++;
    if (createPasswordHasLowercase.value) criteriaCount++;
    if (createPasswordHasNumber.value) criteriaCount++;
    if (createPasswordHasSpecialChar.value) criteriaCount++;
    return criteriaCount / 6;
  }


  /// Get CreateNewPassword strength text
  String getCreateNewPasswordStrengthText() {
    int criteriaCount = 0;
    if (createPasswordSamePassword.value) criteriaCount++;
    if (createPasswordHasMinLength.value) criteriaCount++;
    if (createPasswordHasUppercase.value) criteriaCount++;
    if (createPasswordHasLowercase.value) criteriaCount++;
    if (createPasswordHasNumber.value) criteriaCount++;
    if (createPasswordHasSpecialChar.value) criteriaCount++;

    if (criteriaCount <= 0) return '0%';
    if (criteriaCount <= 1) return '10%';
    if (criteriaCount <= 2) return '30%';
    if (criteriaCount <= 3) return '40%';
    if (criteriaCount <= 4) return '50%';
    if (criteriaCount <= 5) return '70%';
    return '100%';
  }

  /// Get strength color based on criteria met
  Color getPasswordStrengthColor() {
    return AppTheme.lightCyanColor;
  }

  /// Clear all SignUp form fields
  void clearSignUpForm() {
    signUpHasMinLength.value = false;
    signUpHasUppercase.value = false;
    signUpHasLowercase.value = false;
    signUpHasNumber.value = false;
    signUpHasSpecialChar.value = false;
    signUpSamePassword.value = false;
  }

  /// Clear all CreateNewPassword form fields
  void clearCreateNewPasswordForm() {
    createPasswordHasMinLength.value = false;
    createPasswordHasUppercase.value = false;
    createPasswordHasLowercase.value = false;
    createPasswordHasNumber.value = false;
    createPasswordHasSpecialChar.value = false;
    createPasswordSamePassword.value = false;
  }


  /// Calculate password strength value (0.0 to 1.0)
  double getPasswordStrength() {
    int criteriaCount = 0;
    if(createPasswordSamePassword.value) criteriaCount++;
    if (createPasswordHasMinLength.value) criteriaCount++;
    if (createPasswordHasUppercase.value) criteriaCount++;
    if (createPasswordHasLowercase.value) criteriaCount++;
    if (createPasswordHasNumber.value) criteriaCount++;
    if (createPasswordHasSpecialChar.value) criteriaCount++;

    return criteriaCount / 6;
  }


}





