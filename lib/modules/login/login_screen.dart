import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:liveasyinterntask/navigation/route_constants.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static String verify = '';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}


class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneController = TextEditingController();
  var phone = '';
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String countryCode = '+91';


    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close),
              ),
            ),

            SizedBox(height: 16.h,),

            const Text(
              'Please enter your mobile number',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                fontFamily: 'Roboto'
              ),
            ),

            const Padding(
              padding:  EdgeInsets.only(top: 8,),
              child: Text(
                'You\'ll receive a 6 digit code \n to verify next.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff6A6C7B),
                  fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Roboto'
                ),
              ),
            ),

           SizedBox(height: 4.h,),

            Form(
              key: _formkey,
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 3.w),
                child: TextFormField(
                  onChanged: (value) {
                    phone = value;
                  },
                  controller: phoneController,
                  validator: (value) {
                    if(value == null || value.isEmpty || value.length>10 || value.length < 10) {
                      return 'Please enter the correct Mobile Number';
                    }
                  },

                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    prefixIconConstraints: BoxConstraints(
                      maxWidth: 30.w,
                    ),
                      constraints: BoxConstraints(
                        maxHeight: 12.h,
                      ),
                    prefixIcon: Row(
                      children: [
                      Padding(
                          padding: const EdgeInsets.only(
                            left: 5, top: 14, right: 20, bottom: 14,
                          ),
                          child: Image.asset('assets/Flag-India.webp',
                              fit: BoxFit.contain,
                              height: 4.h, width: 4.h,
                          ),
                        ),

                        Text(
                          '$countryCode',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff2F3037),
                            fontFamily: 'Montserrat',
                          ),
                        ),

                        SizedBox(width: 2.w,),
                        Text(
                          '-',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff2F3037),
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ],
                    ),

                    hintText: 'Mobile Number',
                    hintStyle:  const TextStyle(
                      fontSize: 16,
                      color: Color(0xff6A6C7B),
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Montserrat',
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                      borderSide: const BorderSide(
                        color: Colors.black,
                      )
                    )
                  ),

                  //mobile number digits
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xff2F3037),
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Montserrat',
                  ),
                  keyboardType: TextInputType.phone,
                ),
              ),
            ),

            //Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 35),
              child: ElevatedButton(
                onPressed: () async {
                  if(_formkey.currentState!.validate()){
                    await FirebaseAuth.instance.verifyPhoneNumber(
                      phoneNumber: '${countryCode+phone}',
                      verificationCompleted: (PhoneAuthCredential credential) {},
                      verificationFailed: (FirebaseAuthException e) {
                        final snackBar = SnackBar(content: Text(e.code));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                       //  if (e.code == 'invalid-phone-number') {
                       //    print('The provided phone number is not valid.');
                       // }
                      },
                      codeSent: (String verificationId, int? resendToken) {
                        LoginScreen.verify = verificationId;
                      },
                      codeAutoRetrievalTimeout: (String verificationId) {},
                    );
                    Navigator.pushNamed(context, OtpRoute, arguments: phoneController.text);
                  }
                },
                child: Text(
                  'CONTINUE',
                  style: const TextStyle(
                    fontSize: 16,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Montserrat',
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff2E3B62),
                  minimumSize: Size(100.w, 8.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),

                ),
              ),
            ),

            const Spacer(),

            Container(
              width: 100.w,
              child: Image.asset(
                'assets/image3.png',
                fit: BoxFit.cover,
              ),
            ),


          ],
        ),
      ),
    );
  }
}
