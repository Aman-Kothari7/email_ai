import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../main.dart';

class AccountController extends GetxController {
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
  }

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
}
