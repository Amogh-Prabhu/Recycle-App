// ignore_for_file: sized_box_for_whitespace, unused_element, prefer_is_empty

import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:recycle_app/constants/constants.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({Key? key}) : super(key: key);
  static String id = "verify";

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  bool press = false;
  Color onPressColor = const Color(0xff01661c).withOpacity(0.5);
  Color buttonColor = const Color(0xff01661c);
  final TextEditingController _controller = TextEditingController();
  bool isPhone = false;


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: AppBar(
        shadowColor: Colors.transparent,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          splashRadius: 20,
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context, false);
          },
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: AvatarGlow(
                  endRadius: 100,
                  glowColor: Colors.blueAccent,
                  repeat: true,
                  child: Lottie.network(
                    "https://assets3.lottiefiles.com/packages/lf20_mftd0tzf.json",
                    width: 200,
                    repeat: true,
                  ),
                ),
              ),
              Text(
                "Verification",
                style: poppinFonts(Colors.white, FontWeight.bold, 30),
              ),
              Text(
                "Enter your OTP code number",
                style: poppinFonts(Colors.white, FontWeight.normal, 15),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: size.height / 20,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: scaffoldColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _textFieldOTP(first: true, last: false),
                        _textFieldOTP(first: false, last: false),
                        _textFieldOTP(first: false, last: false),
                        _textFieldOTP(first: false, last: true),
                      ],
                    ),
                  )
                ]),
              ),
              SizedBox(
                height: size.height / 30,
              ),
              GestureDetector(
                onTap: () async {
                  setState(() {
                    press = !press;
                  });
                  Future.delayed(const Duration(milliseconds: 500), () {
                    setState(() {
                      press = !press;
                    });
                  });
                },
                child: Container(
                  width: size.width / 1.1,
                  height: size.height / 13,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: press
                              ? [Colors.blue, Colors.red]
                              : [
                                  const Color(0xff00548e),
                                  const Color(0xff009297)
                                ]),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: kButtonShadows),
                  child: const Center(
                    child: Text(
                      "Verify",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
                SizedBox(
                height: size.height / 35,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Didn't you receive any code ?",
                    style: poppinFonts(Colors.white, FontWeight.normal, 15),
                  ),
                  TextButton(onPressed: (){
                    
                    //TODO

                  }, child:  Text(
                      "Resend Code",
                      style: poppinFonts(Colors.white, FontWeight.bold, 15),
                    ),
                  )
                ],
              )
              

            ],
          ),
        ),
      ),
    );
  }


  Widget _textFieldOTP({required bool first, last}) {
    return Container(
      height: 75,
      child: Center(
        child: AspectRatio(
          aspectRatio: 0.8,
          child: TextField(
            autofocus: true,
            onChanged: (value) {
              if (value.length == 1 && last == false) {
                FocusScope.of(context).nextFocus();
              }
              if (value.length == 0 && first == false) {
                FocusScope.of(context).previousFocus();
              }
            },
            showCursor: false,
            readOnly: false,
            textAlign: TextAlign.center,
            style: poppinFonts(Colors.white, FontWeight.normal, 20),
            keyboardType: TextInputType.number,
            maxLength: 1,
            decoration: InputDecoration(
              counter: const Offstage(),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.grey.withOpacity(0.2)),
                  borderRadius: BorderRadius.circular(12)),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 2, color: Colors.white),
                  borderRadius: BorderRadius.circular(12)),
            ),
          ),
        ),
      ),
    );
  }

}


