import 'dart:convert';
import 'dart:io';
import 'package:country_picker_bkb/model/country_model.dart';
import 'package:eventori/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../AppTheme/app_theme.dart';
import '../../../../../api_services/api_exceptions.dart';
import '../../../../../api_services/data_api.dart';
import '../../../../../app_widgets/custom_success_dialog.dart';
import '../../../../../constants/aap_assets.dart';
import '../../../../../routes/app_routes.dart';
import '../../../../../utils/snackbar_util.dart';
import '../../../../auth/controller/base_controller.dart';

class EventController extends GetxController {
  // Existing properties
  var selectedPromotionPlan = '7day'.obs;
  var selectedPaymentMethod = 'paypal'.obs;

  // Form key and controllers
  final TextEditingController eventNameController = TextEditingController();
  final TextEditingController eventAboutController = TextEditingController();
  final TextEditingController eventdateController = TextEditingController();

  // Observable properties
  var selectedCategory = Rxn<String>();
  var selectedCountry = Rxn<String>();
  var selectedCity = Rxn<String>();
  var isNotSureChecked = false.obs;
  var isNotSureDate = false.obs;
  var isReminderEnabled = false.obs;

  // Image selection property
  final Rx<File?> selectedEventImage = Rx<File?>(null);

  // ValueNotifiers for country and city
  final ValueNotifier<CountryModel> countryVN = ValueNotifier(CountryModel());
  final ValueNotifier<CityModel> cityVN = ValueNotifier(CityModel());

  // Validation error messages
  var countryError = Rxn<String>();
  var cityError = Rxn<String>();
  var imageError = Rxn<String>(); // New: Image validation error

  // Event categories list
  final List<String> eventCategories = [
    'Conference',
    'Workshop',
    'Seminar',
    'Meeting',
    'Concert',
    'Exhibition',
    'Party',
    'Sports',
    'Other',
  ];

  RxString accessToken = "".obs;
  RxBool isLoading=false.obs;
  final BaseController _baseController = BaseController.instance;
  RxList<EventModel> eventList=<EventModel>[].obs;

  Future createEvent(String eventName, String eventCategory, String about, String country, String city, String eventDate, bool sendReminderEmail, String image) async {
    _baseController.showLoading();
    Map<String,String> body = {
      "eventName":eventName,
      "eventCategory":eventCategory,
      "about":about,
      if(country.isNotEmpty)
        "country":country,
      if(city.isNotEmpty)
        "city":city,
      if(eventDate.isNotEmpty)
        "eventDate":eventDate,
      "sendReminderEmail":sendReminderEmail.toString(),
    };
    var response = await DataApiService.instance
        .multiPartImage('event/create',[image],'image', body)
        .catchError((error) {
      if (error is BadRequestException) {
        var apiError = json.decode(error.message!);
        print("object...");
        SnackbarUtil.showSnackbar(message: apiError.toString(), type: SnackbarType.error);
      }
      else {
        print("objsaghect...");
        _baseController.handleError(error);
      }
    });

    update();
    _baseController.hideLoading();
    if (response == null) return;
    print(response + " responded");
    var result = json.decode(response);
    print(result['message']);
    print(result['success']);
    if (result['success'].toString()=="true") {
      showDialog(
        context: Get.context!,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return CustomSuccessDialog(
            title: 'Event created\nsuccessfully',
            subtitle: 'Event created — let the planning begin.',
            buttonText: 'Next',
            iconAsset: AppAssets.vectorIcon,
            iconBackgroundColor: AppTheme.greenColor,
            buttonColor: AppTheme.greenColor,
            buttonTextColor: AppTheme.whiteColor,
            buttonBorderColor: AppTheme.greenColor,
            onTap: () async {
              Get.back();
              Get.offAllNamed(AppRoutes.myEventScreeen);
            },
          );
        },
      );
      print("Event Created Successfully Api Called");

    }
    else if(result['status'].toString()=="failed"&&result['error'].toString()=="true"){
      String message = result['data']['message'];
      SnackbarUtil.showSnackbar(message: message, type: SnackbarType.error);
    }
  }

  Future getEvent() async {
    isLoading.value=true;
    var  response = await DataApiService.instance
        .get('event',)
        .catchError((error) {
      if (error is BadRequestException) {
        var apiError = json.decode(error.message!);
        SnackbarUtil.showSnackbar(message: apiError.toString(), type: SnackbarType.error);
      } else {
        _baseController.handleError(error);
      }
    });
    isLoading.value=false;
    update();
    if (response == null) return;
    print(response + " responded");
    var result = json.decode(response);
    print(result['message']);
    print(result['success']);

    if (result['success'].toString()=="true" && result['message']=="Successful") {

      eventList.value=List<EventModel>.from(result['data'].map((x) => EventModel.fromJson(x)));

    }

    else if(result['status'].toString()=="failed"&&result['error'].toString()=="true"){
      String message = result['data']['message'];
      SnackbarUtil.showSnackbar(message: message, type: SnackbarType.error);
    }
  }

  Future updateEvent(String eventName, String eventCategory, String about, String country, String city, String eventDate, String sendReminderEmail,String id ) async {
    _baseController.showLoading();
    Map<String,String> body = {
      "eventName":eventName,
      "eventCategory":eventCategory,
      "about":about,
      "country":country,
      "city":city,
      "eventDate":eventDate,
      "sendReminderEmail":sendReminderEmail,
    };
    var response;
    if(selectedEventImage.value!=null){
      response= await DataApiService.instance
          .multiPartImagePut('/event/$id',[selectedEventImage.value!.path],'image', body)
          .catchError((error) {
        if (error is BadRequestException) {
          var apiError = json.decode(error.message!);
          print("object...");
          SnackbarUtil.showSnackbar(message: apiError.toString(), type: SnackbarType.error);
        }
        else {
          print("objsaghect...");
          _baseController.handleError(error);
        }
      });
    }else{
      response= await DataApiService.instance
          .put('/event/$id', body)
          .catchError((error) {
        if (error is BadRequestException) {
          var apiError = json.decode(error.message!);
          print("object...");
          SnackbarUtil.showSnackbar(message: apiError.toString(), type: SnackbarType.error);
        }
        else {
          print("objsaghect...");
          _baseController.handleError(error);
        }
      });
    }


    update();
    _baseController.hideLoading();
    if (response == null) return;
    print(response + " responded");
    var result = json.decode(response);
    print(result['message']);
    print(result['success']);
    if (result['success'].toString()=="true") {

      print("Event Updated Successfully Api Called");
      Get.back();
      getEvent();

    }
    else if(result['status'].toString()=="failed"&&result['error'].toString()=="true"){
      String message = result['data']['message'];
      SnackbarUtil.showSnackbar(message: message, type: SnackbarType.error);
    }
  }

  Future deleteEvent(String id) async {
    isLoading.value= true;
    var response = await DataApiService.instance
        .delete('/event/$id')
        .catchError((error) {
      if (error is BadRequestException) {
        var apiError = json.decode(error.message!);
        print("object...");
        SnackbarUtil.showSnackbar(message: apiError.toString(), type: SnackbarType.error);
      }
      else {
        print("objsaghect...");
        _baseController.handleError(error);
      }
    });

    update();
    isLoading.value= false;
    if (response == null) return;
    print(response + " responded");
    var result = json.decode(response);
    print(result['message']);
    print(result['success']);
    if (result['success'].toString()=="true") {
      getEvent();
    } else if(result['status'].toString()=="failed"&&result['error'].toString()=="true"){
      String message = result['data']['message'];
      SnackbarUtil.showSnackbar(message: message, type: SnackbarType.error);
    }
  }

  @override
  void onInit() {
    super.onInit();

    // Add listeners
    countryVN.addListener(() {
      selectedCountry.value = countryVN.value.name;
      countryError.value = null;
      // Reset city when country changes
      selectedCity.value = null;
      cityVN.value = CityModel();
    });

    cityVN.addListener(() {
      selectedCity.value = cityVN.value.name;
      cityError.value = null;
    });
  }

  // Methods
  void selectPromotionPlan(String plan) {
    selectedPromotionPlan.value = plan;
  }

  void selectPaymentMethod(String method) {
    selectedPaymentMethod.value = method;
  }

  void updateCategory(String? category) {
    selectedCategory.value = category;
  }

  void toggleNotSureLocation(bool value) {
    isNotSureChecked.value = value;
    if (value) {
      countryError.value = null;
      cityError.value = null;
    }
  }

  void toggleNotSureDate(bool value) {
    isNotSureDate.value = value;
    // Clear date field when "Not sure" is checked
    if (value) {
      eventdateController.clear();
    }
  }

  void toggleReminder(bool value) {
    isReminderEnabled.value = value;
    print('Toggle changed: $value');
  }

  // Method to set event image
  void setEventImage(File? image) {
    selectedEventImage.value = image;
    // Clear error when image is selected
    if (image != null) {
      imageError.value = null;
    }
  }



  // Method to remove event image
  void removeEventImage() {
    selectedEventImage.value = null;
  }

  bool validateForm() {
    bool isValid = true;

    // // Validate form fields
    // if (!formKey.currentState!.validate()) {
    //   isValid = false;
    // }

    // Validate country if "Not sure" is not checked
    if (!isNotSureChecked.value) {
      final countryValidation = _validateCountry(selectedCountry.value);
      if (countryValidation != null) {
        countryError.value = countryValidation;
        isValid = false;
      }

      // Validate city if "Not sure" is not checked
      final cityValidation = _validateCity(selectedCity.value);
      if (cityValidation != null) {
        cityError.value = cityValidation;
        isValid = false;
      }
    }

    // Validate date only if "Not sure" is not checked
    if (!isNotSureDate.value && eventdateController.text.isEmpty) {
      isValid = false;
    }

    // NEW: Validate image (always required)
    final imageValidation = _validateImage(selectedEventImage.value);
    if (imageValidation != null) {
      imageError.value = imageValidation;
      isValid = false;
    }

    return isValid;
  }

  bool validateEditForm(GlobalKey<FormState> formKey, TextEditingController eventEditdateController, String? existingImage) {
    bool isValid = true;

    // Validate form fields (name, about, category)
    if (!formKey.currentState!.validate()) {
      isValid = false;
    }

    // Validate country if "Not sure" is not checked
    if (!isNotSureChecked.value) {
      final countryValidation = _validateCountry(selectedCountry.value);
      if (countryValidation != null) {
        countryError.value = countryValidation;
        isValid = false;
      } else {
        countryError.value = null;
      }

      // Validate city if "Not sure" is not checked
      final cityValidation = _validateCity(selectedCity.value);
      if (cityValidation != null) {
        cityError.value = cityValidation;
        isValid = false;
      } else {
        cityError.value = null;
      }
    } else {
      // Clear errors if "Not sure" is checked
      countryError.value = null;
      cityError.value = null;
    }

    // Validate date only if "Not sure" is not checked
    if (!isNotSureDate.value && eventEditdateController.text.isEmpty) {
      isValid = false;
    }

    // For edit screen: Image validation is optional
    // If user hasn't selected a new image, use existing image
    // Only validate if both selectedEventImage and existing image are null
    if (selectedEventImage.value == null && (existingImage == null || existingImage.isEmpty)) {
      imageError.value = 'Please select an image';
      isValid = false;
    } else {
      imageError.value = null;
    }

    return isValid;
  }

  String? _validateCountry(String? country) {
    if (country == null || country.isEmpty) {
      return 'Please select a country';
    }
    return null;
  }

  String? _validateCity(String? city) {
    if (city == null || city.isEmpty) {
      return 'Please select a city';
    }
    return null;
  }

  // NEW: Image validation method
  String? _validateImage(File? image) {
    if (image == null) {
      return 'Please upload an event image';
    }
    return null;
  }

  void handlePayment() {
    print('Selected Plan: ${selectedPromotionPlan.value}');
    print('Selected Payment Method: ${selectedPaymentMethod.value}');
  }

  // Method to reset form
  void resetForm() {
    eventNameController.clear();
    eventAboutController.clear();
    eventdateController.clear();
    selectedCategory.value = null;
    selectedCountry.value = null;
    selectedCity.value = null;
    isNotSureChecked.value = false;
    isNotSureDate.value = false;
    isReminderEnabled.value = false;
    selectedEventImage.value = null;
    countryError.value = null;
    cityError.value = null;
    imageError.value = null; // Reset image error
  }

  static Map<String, String> getMonthAndDay(String isoDate) {
    final DateTime date = DateTime.parse(isoDate);

    const List<String> months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];

    return {
      'month': months[date.month - 1],
      'day': date.day.toString().padLeft(2, '0'),
    };
  }

  @override
  void onClose() {
    eventNameController.dispose();
    eventAboutController.dispose();
    eventdateController.dispose();
    countryVN.dispose();
    cityVN.dispose();
    super.onClose();
  }
}