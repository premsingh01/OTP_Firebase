import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../navigation/route_constants.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // String beforeImage = 'assets/image1.png';
  // String afterImage = 'assets/image2.png';
  String img = 'assets/image1.png';

  String? dropDownValue = 'English';
  var items = [
    'English',
    'Hindi',
    'Spanish',
    'Chinese',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20.h,),

            Icon(
              Icons.image_outlined,
            size: 8.h,
            ),

            SizedBox(height: 4.h,),

           const Center(
              child: Text(
                'Please select your Language',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                fontFamily: 'Roboto',
              ),),
            ),

            const SizedBox(height: 10,),

            const Text(
                'You can change the language \nat any time.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Color(0xff6A6C7B),
              fontWeight: FontWeight.w400,
              fontFamily: 'Roboto',
            ),
            ),

            SizedBox(height: 4.h,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70,),
              child: DropdownButtonFormField(
                value: dropDownValue,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff2F3037),
                  letterSpacing: 1,
                  fontFamily: 'Montserrat',
                ),

                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0),
                      borderSide: const BorderSide(
                        style: BorderStyle.solid,
                        color: Colors.black,
                      )
                  ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0),
                        borderSide: const BorderSide(
                          style: BorderStyle.solid,
                          color: Colors.black,
                        ))
                ),

                items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                    child: Text(items),
                );
              }).toList(),

                  onChanged: (String? newValue) {
                    setState(() {
                      dropDownValue = newValue;
                      img = 'assets/image2.png';
                    });
                  },
              ),
            ),

            SizedBox(height: 4.h,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, LoginRoute);
                  },
                  child: Text(
                      'NEXT',
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
                '$img',
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
