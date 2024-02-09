import 'dart:developer';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kangleiphotographers/constant/alertbox.dart';
import 'package:kangleiphotographers/constant/constant.dart';

import 'package:kangleiphotographers/pages/loginpage.dart';

import 'package:shared_preferences/shared_preferences.dart';

class GetxTapController extends GetxController {
  String _verificationId = '';
  String _gmail = '';

  bool _isphonenumberexist = false;
  bool _ispresscontinue = false;
  bool? _isuserexist;
  bool _iscodesent = false;
  String _initialdateformat = 'dd/mm/yyyy';
  File? _image;
  genderok _character = genderok.male;
  User? _finaluser;

  get isphonenumberexist => _isphonenumberexist;
  get ispresscontinue => _ispresscontinue;
  get iscodesent => _iscodesent;
  get verificationId => _verificationId;
  get initialdateformat => _initialdateformat;
  get image => _image;
  get character => _character;
  get finaluser => _finaluser;
  get isuserexist => _isuserexist;
  get gmail => _gmail;

  Future signout() async {
    log('Log Out');
    final FirebaseAuth auth = FirebaseAuth.instance;

    try {
      await auth.signOut();
      _finaluser = auth.currentUser;
      update();
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<String?> uploadImageToFirebaseStorage(File imageFile) async {
    var mail = _gmail.split('@');
    final Reference storageReference =
        FirebaseStorage.instance.ref().child('${mail[0]}/profilephoto.jpg');
    final UploadTask uploadTask = storageReference.putFile(imageFile);
    final TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);

    if (taskSnapshot.state == TaskState.success) {
      final String imageUrl = await storageReference.getDownloadURL();
      return imageUrl;
    }
    return null;
  }

  Future saveuserdata(
      {required String firstname,
      required String lastname,
      required String cityname}) async {
    String? imageUrl = await uploadImageToFirebaseStorage(_image!);
    late DatabaseReference dbrefADMIN;
    var mail = _gmail.split('@');

    dbrefADMIN = FirebaseDatabase.instance.ref("allusers");
    dbrefADMIN.child(mail[0]).set({
      "profileimage": "$imageUrl",
      "firstname": firstname,
      "lastname": lastname,
      "city": cityname,
      "dateofbirth": _initialdateformat,
      "gender": _character == genderok.male
          ? 'Male'
          : _character == genderok.female
              ? 'Female'
              : "Other",
    });
  }

  Future Googlesignout() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      return await googleSignIn.disconnect();
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  void selectgender(genderok value) {
    _character = value;
    update();
  }

  void selectprofilephoto(BuildContext context) {
    showDialog<ImageSource>(
      context: context,
      builder: (context) => AlertDialog(
          contentPadding: const EdgeInsets.symmetric(vertical: 15),
          insetPadding: EdgeInsets.zero,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          content: SizedBox(
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () => Navigator.pop(context, ImageSource.camera),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Take Photo',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                ),
                const Divider(thickness: 1),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () => Navigator.pop(context, ImageSource.gallery),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Choose From Galley',
                        style: TextStyle(color: Colors.orange),
                      ),
                    ],
                  ),
                ),
                const Divider(thickness: 1),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () => Navigator.pop(context),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Cancel',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    ).then((ImageSource? source) async {
      if (source == null) return;

      final pickedFile = await ImagePicker().pickImage(source: source);
      if (pickedFile == null) return;

      _image = File(pickedFile.path);
      update();
    });
  }

  void selectdob(BuildContext context) {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime(2025),
            helpText: "SELECT DATE OF BIRTH",
            cancelText: "CANCEL",
            confirmText: "OK",
            fieldHintText: "DATE/MONTH/YEAR",
            fieldLabelText: "ENTER YOUR DATE OF BIRTH",
            errorFormatText: "Enter a Valid Date",
            errorInvalidText: "Date Out of Range")
        .then((value) {
      _initialdateformat =
          '${value!.day.toString()}-${value.month.toString()}-${value.year.toString()}';
      update();
    });
  }

  void checkuser() async {
    final prefs = await SharedPreferences.getInstance();
    String useremail = prefs.getString('email')!;
    print('Email :$useremail');
    _gmail = useremail;
    var mail = useremail.split('@');
    late DatabaseReference dbrefADMIN;

    dbrefADMIN = FirebaseDatabase.instance.ref("allusers");
    final snapshot = await dbrefADMIN.child(mail[0]).get();
    print(snapshot.value);
    if (snapshot.exists) {
      _isuserexist = true;
      update();
    } else {
      _isuserexist = false;
      update();
    }
    update();
  }

  void getotp({required String phonenumber}) async {
    late DatabaseReference dbrefADMIN;
    MobileVerificationState currentState =
        MobileVerificationState.SHOW_MOBILE_FORM_STATE;
    FirebaseAuth auth = FirebaseAuth.instance;
    _ispresscontinue = true;

    dbrefADMIN = FirebaseDatabase.instance.ref("allusers");
    final snapshot = await dbrefADMIN.child('+91$phonenumber').get();
    if (snapshot.exists) {
      print(snapshot.value);

      _isphonenumberexist = true;

      await auth.verifyPhoneNumber(
        phoneNumber: '+91$phonenumber',
        verificationCompleted: (phoneAuthCredential) async {
          log('auth.verifyPhoneNumber Completed');

          _ispresscontinue = false;
          update();

          //signInWithPhoneAuthCredential(phoneAuthCredential);
        },
        verificationFailed: (verificationFailed) {
          log('Verification fail');

          _ispresscontinue = false;

          EasyLoading.showError('VERIFICATION FAILED');
          update();
        },
        codeSent: (verificationId, resendingToken) {
          _ispresscontinue = false;
          _iscodesent = true;
          currentState = MobileVerificationState.SHOW_OTP_FORM_STATE;
          _verificationId = verificationId;

          log('code sent Completed');
          update();
        },
        codeAutoRetrievalTimeout: (verificationId) async {},
      );
    } else {
      // setState(() {
      //   showLoading = false;
      // });
      // AlertController.show(
      //   " ERROR !! ",
      //   "YOU DONT HAVE THE RIGHT TO ACCESS AS ADMIN!",
      //   TypeAlert.error,
      // );
      await auth.verifyPhoneNumber(
        phoneNumber: '+91$phonenumber',
        verificationCompleted: (phoneAuthCredential) async {
          log('auth.verifyPhoneNumber Completed');

          _ispresscontinue = false;
          update();

          //signInWithPhoneAuthCredential(phoneAuthCredential);
        },
        verificationFailed: (verificationFailed) async {
          log('Verification fail');

          _ispresscontinue = false;

          EasyLoading.showError('VERIFICATION FAILED');
          update();
        },
        codeSent: (verificationId, resendingToken) async {
          _ispresscontinue = false;
          _iscodesent = true;
          currentState = MobileVerificationState.SHOW_OTP_FORM_STATE;
          _verificationId = verificationId;

          log('code sent Completed');
          update();
        },
        codeAutoRetrievalTimeout: (verificationId) async {},
      );
    }
    update();
  }

  savemail(email) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("email", email);
  }

  final FirebaseAuth auth = FirebaseAuth.instance;
  Future<void> googlesignin(BuildContext context) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return alertbox('Please Wait...');
      },
    );
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      // ignore: use_build_context_synchronously
      context.router.pop();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication.whenComplete(() {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return alertbox('Please Wait...');
          },
        );
      });
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      // Getting users credential
      UserCredential result = await auth.signInWithCredential(authCredential);
      if (result.user != null) {
        // ignore: use_build_context_synchronously
        context.router.pop();
        String? mail = result.user!.email;
        User user = result.user!;
        savemail(mail);
        _gmail = mail!;
        _finaluser = user;
        _image = null;
        _initialdateformat = 'dd/mm/yyyy';
        _character = genderok.male;
        _isuserexist = null;
        update();
        print("HELLO000000 $mail");
        print(_finaluser);
        checkuser();
        // ignore: use_build_context_synchronously
      }

// if result not null we simply call the MaterialpageRoute,
      // for go to the HomePage screen
    }
  }
}

