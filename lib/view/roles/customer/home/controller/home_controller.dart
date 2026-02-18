import 'dart:convert';
import 'package:eventori/models/event_category_model.dart';
import 'package:eventori/models/event_vendor.dart';
import 'package:get/get.dart';
import 'package:flutter/foundation.dart';
import 'package:country_picker_bkb/model/country_model.dart';
import '../../../../../api_services/api_exceptions.dart';
import '../../../../../api_services/data_api.dart';
import '../../../../../utils/snackbar_util.dart';
import '../../../../auth/controller/base_controller.dart';


class HomeController extends GetxController {
  final RxInt selectedCategoryIndex = 0.obs;
  RxBool isLoading=false.obs;
  final BaseController _baseController = BaseController.instance;
  RxList<EventCategory> eventCategoryList=<EventCategory>[].obs;
  RxList<EventVendor> eventAllVendorsList=<EventVendor>[].obs;

  // Filter State Management
  final Rx<String?> selectedCountry = Rx<String?>(null);
  final Rx<String?> selectedCity = Rx<String?>(null);

  // Using ValueNotifier for compatibility with country_picker_bkb
  late final ValueNotifier<CountryModel> countryVN;
  late final ValueNotifier<CityModel> cityVN;

  final Rx<String?> selectedNotice = Rx<String?>(null);
  final Rx<String?> selectedRating = Rx<String?>(null);
  final Rx<String?> selectedTravelAvailability = Rx<String?>(null);

  final RxBool isCateringSelected = false.obs;
  final RxBool isDjSelected = false.obs;
  final RxBool isPhotographySelected = false.obs;
  final RxBool isFloralSelected = false.obs;
  final RxBool isVerifiedIdSelected = false.obs;


  void selectVendorCategory(int index) {
    selectedCategoryIndex.value = index;
    print('Selected category: ${eventCategoryList.value[index].categoryName}');
  }

  final List<String> eventCategories = [
    'All Events',
    'Weddings',
    'Festivals',
    'Corporate',
    'Birthday',
  ];

  void selectEventCategory(int index) {
    selectedCategoryIndex.value = index;
    print('Selected category: ${eventCategories[index]}');
  }

  final List<String> forumCategories = [
    'All Forums',
    'Trending Topics',
    'New topics',
    'followings',
  ];

  void selectForumCategory(int index) {
    selectedCategoryIndex.value = index;
    print('Selected category: ${forumCategories[index]}');
  }


  Future getVendorCategory() async {
    isLoading.value=true;
    var  response = await DataApiService.instance
        .get('event/getCategories',)
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

      eventCategoryList.value=List<EventCategory>.from(result['data'].map((x) => EventCategory.fromJson(x)));

    }

    else if(result['status'].toString()=="failed"&&result['error'].toString()=="true"){
      String message = result['data']['message'];
      SnackbarUtil.showSnackbar(message: message, type: SnackbarType.error);
    }
  }

  Future getAllVendors({String searchQuery='',String eventCategory=''}) async {
    isLoading.value=true;
    String endPoint='';
    if(searchQuery.isNotEmpty){
      endPoint="event/vendors?search=$searchQuery";
    }else if(eventCategory.isNotEmpty){
      endPoint="event/vendors?categoryId=$eventCategory";
    }else{
      endPoint="event/vendors";
    }
    var  response = await DataApiService.instance
        .get(endPoint)
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

    if (result['success'].toString()=="true") {
      eventAllVendorsList.value=List<EventVendor>.from(result['data']['vendors'].map((x) => EventVendor.fromJson(x)));
      print(eventAllVendorsList.length.toString()+"lenght");

    }

    else if(result['status'].toString()=="failed"&&result['error'].toString()=="true"){
      String message = result['data']['message'];
      SnackbarUtil.showSnackbar(message: message, type: SnackbarType.error);
    }
  }

  Future blockVendor( String vendorId) async {
    _baseController.showLoading();
    Map<String, String> body = {
      "vendorId":vendorId,
    };

    var response = await DataApiService.instance
        .post('/vendor/block', body)
        .catchError((error) {
      if (error is BadRequestException) {
        var apiError = json.decode(error.message!);
        SnackbarUtil.showSnackbar(message: apiError.toString(), type: SnackbarType.error);
      }
      else {
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
    if (result['success'].toString()=="true" ) {

      getAllVendors();


    } else if(result['status'].toString()=="failed"&&result['error'].toString()=="true"){
      String message = result['data']['message'];
      SnackbarUtil.showSnackbar(message: message, type: SnackbarType.error);
    }
  }

  @override
  void onInit() {
    super.onInit();
    // Initialize ValueNotifiers
    countryVN = ValueNotifier(CountryModel());
    cityVN = ValueNotifier(CityModel());

    // Add listeners to sync with Rx variables
    countryVN.addListener(() {
      selectedCountry.value = countryVN.value.name;
      // Reset city when country changes
      selectedCity.value = null;
      cityVN.value = CityModel();
    });

    cityVN.addListener(() {
      selectedCity.value = cityVN.value.name;
    });
  }

  @override
  void onClose() {
    countryVN.dispose();
    cityVN.dispose();
    super.onClose();
  }

  // Update Rating
  void updateRating(String rating) {
    selectedRating.value = rating;
  }

  // Update Notice
  void updateNotice(String? notice) {
    selectedNotice.value = notice;
  }

  // Update Travel Availability
  void updateTravelAvailability(String availability) {
    selectedTravelAvailability.value = availability;
  }

  // Toggle Services
  void toggleCatering() {
    isCateringSelected.value = !isCateringSelected.value;
  }

  void toggleDj() {
    isDjSelected.value = !isDjSelected.value;
  }

  void togglePhotography() {
    isPhotographySelected.value = !isPhotographySelected.value;
  }

  void toggleFloral() {
    isFloralSelected.value = !isFloralSelected.value;
  }

  void toggleVerifiedId() {
    isVerifiedIdSelected.value = !isVerifiedIdSelected.value;
  }

  // Clear All Filters
  void clearAllFilters() {
    selectedCountry.value = null;
    selectedCity.value = null;
    countryVN.value = CountryModel();
    cityVN.value = CityModel();
    selectedNotice.value = null;
    selectedRating.value = null;
    selectedTravelAvailability.value = null;
    isCateringSelected.value = false;
    isDjSelected.value = false;
    isPhotographySelected.value = false;
    isFloralSelected.value = false;
    isVerifiedIdSelected.value = false;
  }

  // Get Filter Results
  Map<String, dynamic> getFilterResults() {
    return {
      'country': selectedCountry.value,
      'city': selectedCity.value,
      'notice': selectedNotice.value,
      'rating': selectedRating.value,
      'travelAvailability': selectedTravelAvailability.value,
      'catering': isCateringSelected.value,
      'dj': isDjSelected.value,
      'photography': isPhotographySelected.value,
      'floral': isFloralSelected.value,
      'verifiedId': isVerifiedIdSelected.value,
    };
  }
}