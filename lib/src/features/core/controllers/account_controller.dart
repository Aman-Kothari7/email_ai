import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../main.dart';

class AccountController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController roleController = TextEditingController();
  TextEditingController educationController = TextEditingController();
  TextEditingController yourSelfController = TextEditingController();

  GoogleSignIn _googleSignIn = GoogleSignIn(
    // Optional clientId
    // clientId: 'your-client_id.apps.googleusercontent.com',
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  AccountController() {
    emailId.value = box.read("userEmail") ?? '';
    profileImage.value = box.read("userProfile") ?? '';
    nameController.text = box.read("userName") ?? '';
    ageController.text = box.read("userAge") ?? '';
    gender.value = box.read("userGender") ?? "Male";
    companyController.text = box.read("userCompany") ?? '';
    roleController.text = box.read("userRole") ?? '';
    educationController.text = box.read("userEducation") ?? '';
    yourSelfController.text = box.read("userSelf") ?? '';
  }
  RxString gender = "Male".obs;
  RxString emailId = "".obs;
  RxString profileImage = "".obs;

  googleSign() async {
    var email = box.read("userEmail");
    if (email == null) {
      try {
        final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
        if (googleSignInAccount != null) {
          print(googleSignInAccount.email);
          emailId.value = googleSignInAccount.email;
          profileImage.value = googleSignInAccount.photoUrl ?? '';
          box.write("userEmail", googleSignInAccount.email);
          box.write("userName", googleSignInAccount.displayName);
          box.write("userProfile", googleSignInAccount.photoUrl);
        }
      } catch (error) {
        print(error);
      }
    }
  }

  save() {
    box.write("userName", nameController.text);
    box.write("userAge", ageController.text);
    box.write("userGender", gender.value);
    box.write("userCompany", companyController.text);
    box.write("userRole", roleController.text);
    box.write("userEducation", educationController.text);
    box.write("userSelf", yourSelfController.text);
  }

  userRegister() async {
    var email = box.read("userEmail");
    if (email == null) {
      try {
        // final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
        // if (googleSignInAccount != null) {
        //   print(googleSignInAccount.email);
        //   emailId.value = googleSignInAccount.email;
        //   profileImage.value = googleSignInAccount.photoUrl ?? '';
        //   box.write("userEmail", googleSignInAccount.email);
        //   box.write("userName", googleSignInAccount.displayName);
        //   box.write("userProfile", googleSignInAccount.photoUrl);
        // }
      } catch (error) {
        print(error);
      }
    }
  }
}
