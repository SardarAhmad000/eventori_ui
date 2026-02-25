import 'dart:convert';

import 'package:eventori/models/collaborator_model.js.dart';
import 'package:get/get.dart';

import '../../../../../api_services/api_exceptions.dart';
import '../../../../../api_services/data_api.dart';
import '../../../../../utils/snackbar_util.dart';
import '../../../../auth/controller/base_controller.dart';

class DashboardController extends GetxController {

  final BaseController _baseController = BaseController.instance;
  RxList<CollaboratorModel> collaboratorModelList=<CollaboratorModel>[].obs;
  RxBool isLoading=false.obs;

  RxString selectedImage = ''.obs;


  Future addCollaborator(String image, String firstName,String lastName,String email,String role) async {
    _baseController.showLoading();
    Map<String, String> body = {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'role': role
    };
    var response = await DataApiService.instance
        .multiPartImage('collaborator',[image],'image', body)
        .catchError((error) {
      if (error is BadRequestException) {
        var apiError = json.decode(error.message!);
        print("object...");
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
    if (result['success'].toString()=="true") {

      getCollaborator();
      print("Ad  Collaborator Api Hit Successfully!!!!!!!!!");
      print("CollaboratorModel Is : ${collaboratorModelList.length}");

    } else if(result['status'].toString()=="failed"&&result['error'].toString()=="true"){
      String message = result['data']['message'];
      SnackbarUtil.showSnackbar(message: message, type: SnackbarType.error);
    }
  }

  Future getCollaborator() async {
    isLoading.value=true;
    var  response = await DataApiService.instance
        .get('collaborators',)
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

      collaboratorModelList.value=List<CollaboratorModel>.from(result['data']['collaborators'].map((x) => CollaboratorModel.fromJson(x)));

    }

    else if(result['status'].toString()=="failed"&&result['error'].toString()=="true"){
      String message = result['data']['message'];
      SnackbarUtil.showSnackbar(message: message, type: SnackbarType.error);
    }
  }

}