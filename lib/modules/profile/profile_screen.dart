import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


enum Profile { shipper , transporter}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Profile? _character = Profile.shipper;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: SafeArea(
       child: Column(
         children: [
           SizedBox(height: 16.h,),
            const Text(
              'Please select your profile',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                fontFamily: 'Roboto'
              ),
            ),

           SizedBox(height: 4.h,),

            Padding(
             padding: EdgeInsets.symmetric(horizontal: 2.h),
             child: Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 2.h, bottom: 2.h, ),
                  child: Row(
                   children: [
                     Radio(value: Profile.shipper, groupValue: _character,
                         onChanged: (Profile? value) {
                       setState(() {
                         _character = value;
                       });
                     },
                       activeColor: const Color(0xff2E3B62),

                     ),
                     const Icon(Icons.home_filled,size: 50,  color: Color(0xff2F3037)),
                     SizedBox(width: 2.w,),
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                        const Text(
                           'Shipper',
                           style: TextStyle(
                             fontSize: 18,
                             fontWeight: FontWeight.w400,
                             color: Color(0xff2F3037),
                             fontFamily: 'Roboto',
                           ),
                         ),
                         SizedBox(height: 1.h,),
                         const Text(
                           'Lorem ipsum dolor sit amet,\nconsectetur adipiscing',
                           style: TextStyle(
                             fontSize: 12,
                             color: Color(0xff6A6C7B),
                             fontWeight: FontWeight.w400,
                             fontFamily: 'Roboto',
                           ),
                         ),
                       ],
                     ),
                    ],
               ),
                ),
             ),
           ),

           SizedBox(height: 4.h,),

           Padding(
             padding: EdgeInsets.symmetric(horizontal: 2.h),
             child: Container(
               decoration: BoxDecoration(
                 border: Border.all(),
               ),
               child: Padding(
                 padding: EdgeInsets.only(top: 2.h, bottom: 2.h, ),
                 child: Row(
                   children: [
                     Radio(value: Profile.transporter, groupValue: _character,
                         onChanged: (Profile? value) {
                           setState(() {
                             _character = value;
                           });
                         },
                       activeColor: const Color(0xff2E3B62),
                         ),
                     const Icon(Icons.emoji_transportation_sharp,size: 50, color: Color(0xff2F3037),),
                     SizedBox(width: 2.w,),
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         const Text(
                           'Transporter',
                           style: TextStyle(
                             fontSize: 18,
                             fontWeight: FontWeight.w400,
                             color: Color(0xff2F3037),
                             fontFamily: 'Roboto',
                           ),
                         ),
                         SizedBox(height: 1.h,),
                         const Text(
                           'Lorem ipsum dolor sit amet,\nconsectetur adipiscing',
                           style: TextStyle(
                             fontSize: 12,
                             color: Color(0xff6A6C7B),
                             fontWeight: FontWeight.w400,
                             fontFamily: 'Roboto',
                           ),
                         ),
                       ],
                     ),
                   ],
                 ),
               ),
             ),
           ),

           SizedBox(height: 4.h,),

           //Button
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 15,),
             child: ElevatedButton(
               onPressed: () {},
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
         ],
       ),


     ),
    );
  }
}
