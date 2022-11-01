import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:liveasyinterntask/modules/login/login_screen.dart';
import 'package:liveasyinterntask/navigation/route_constants.dart';
import 'package:pinput/pinput.dart';
import 'package:sizer/sizer.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key, required this.mobileNumber}) : super(key: key);
  final String mobileNumber;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}



class _OtpScreenState extends State<OtpScreen> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  String verification = LoginScreen.verify;
  String countryCode = '+91';

  void requestCodeAgain(String code, String number) async{
    String countryCode = code;
    String mobileNumber = number;
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '${countryCode + mobileNumber}',
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {
        verification = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  @override
  Widget build(BuildContext context) {

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(0),
        color: const Color(0xff93D2F3),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: const Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color:const Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    var code = '';
    
    return Scaffold(
      body: SafeArea(
          child:Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
              ),

              SizedBox(height: 16.h,),

              const Text(
                'Verify Phone',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Roboto'
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8,),
                child: Text(
                  'Code is sent to ${widget.mobileNumber}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xff6A6C7B),
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    fontFamily: 'Roboto',
                  ),
                ),
              ),

              SizedBox(height: 4.h,),

              Pinput(
                defaultPinTheme: defaultPinTheme,
                showCursor: true,
                length: 6,
                onChanged: (value) {
                  code = value;
                },
              ),

              // SizedBox(height: 1.h,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Didn\'t receive the code?',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff6A6C7B),
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Roboto'
                  ),),

                  TextButton(
                      onPressed: () async {
                       requestCodeAgain(countryCode, widget.mobileNumber);
                      },
                      child: const Text(
                          'Request Again',
                        style:  TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                  ),
                ],
              ),

              SizedBox(height: 4.h,),

              ElevatedButton(
                onPressed: () async{
                  try{
                    PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verification, smsCode: code);

                    await auth.signInWithCredential(credential);
                    Navigator.pushNamedAndRemoveUntil(context, ProfileRoute, (route) => false);
                    // Navigator.pushNamed(context, ProfileRoute);
                  }
                  catch(e){
                    // print(e);
                    const snackBar = SnackBar(content: Text('Enter a valid OTP'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                child: Text(
                  'VERIFY AND CONTINUE',
                  style: const TextStyle(
                    fontSize: 16,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Montserrat'
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff2E3B62),
                  minimumSize: Size(90.w, 8.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),

                ),
              ),
            ],
          ) ),
    );
  }
}
