import 'package:flutter/material.dart';
import 'package:learning/app/components/size_config.dart';
import 'package:learning/app/components/colors.dart';
import 'package:pinput/pinput.dart';

class ForgotScreen extends StatelessWidget {
  const ForgotScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double mediaHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(32.5),
          child: ListView(
            children: [
              Container(
                height: 213,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/image/emailx.png')),
                ),
              ),
              SizedBox(
                height: mediaHeight * 0.05,
              ),
              Text(
                'Forgot Your Password?',
                style: TextStyle(
                  fontFamily: 'SFProText',
                  fontSize: mediaHeight * 0.03,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: mediaHeight * 0.02,
              ),
              Text(
                'Enter your registered email below to receive password reset instruction.',
                style: TextStyle(
                  fontFamily: 'SFProText',
                  fontSize: mediaHeight * 0.018,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: mediaHeight * 0.05,
              ),
              TextField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: darkColor, width: 2.0),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  hintText: 'example@email.com',
                ),
              ),
              SizedBox(
                height: mediaHeight * 0.05,
              ),
              _gradientButton(
                btnName: "Send",
                pageName: "PinPage",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ForgotPinScreen extends StatelessWidget {
  const ForgotPinScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double mediaHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(32.5),
          child: ListView(
            children: [
              Container(
                height: 213,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/image/email_receivex.png')),
                ),
              ),
              SizedBox(
                height: mediaHeight * 0.05,
              ),
              Text(
                'Verification',
                style: TextStyle(
                  fontFamily: 'SFProText',
                  fontSize: mediaHeight * 0.03,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: mediaHeight * 0.02,
              ),
              Text(
                'Enter the verification code we just sent you on your email address.',
                style: TextStyle(
                  fontFamily: 'SFProText',
                  fontSize: mediaHeight * 0.018,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: mediaHeight * 0.05,
              ),
              _FilledState(),
              SizedBox(
                height: mediaHeight * 0.06,
              ),
              Text(
                "Didn't receive code?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'SFProText',
                  fontSize: mediaHeight * 0.018,
                ),
              ),
              Text(
                "Resend",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'SFProText',
                  fontSize: mediaHeight * 0.018,
                  color: darkColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _gradientButton extends StatelessWidget {
  String btnName;
  String pageName;

  _gradientButton({required this.btnName, required this.pageName});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
              color: Colors.black26, offset: Offset(0, 4), blurRadius: 5.0)
        ],
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          stops: const [0.0, 1.0],
          colors: [
            darkColor,
            lightColor,
          ],
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          minimumSize: MaterialStateProperty.all(Size(
              SizeConfig.screenWidth! / 1.37,
              SizeConfig.screenHeight! / 13.66)),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          shadowColor: MaterialStateProperty.all(Colors.transparent),
        ),
        onPressed: () {
          if (pageName == 'PinPage') {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ForgotPinScreen()));
          } else if(pageName == 'ResetPage'){
            // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ForgotPinScreen()));
          }
        },
        child: Text(
          btnName,
          style: TextStyle(
            fontSize: SizeConfig.screenHeight! / 42.68,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),

          /// 16
        ),
      ),
    );
  }
}

class _FilledState extends StatelessWidget {
  final controller = TextEditingController();
  final focusNode = FocusNode();

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
  }

  bool showError = false;

  @override
  Widget build(BuildContext context) {
    final length = 5;
    const borderColor = Color.fromRGBO(114, 178, 238, 1);
    const errorColor = Color.fromRGBO(255, 234, 238, 1);
    const fillColor = Color.fromRGBO(222, 231, 240, .57);
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 60,
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.transparent),
      ),
    );

    return SizedBox(
      height: 50,
      child: Pinput(
        length: length,
        controller: controller,
        focusNode: focusNode,
        defaultPinTheme: defaultPinTheme,
        onCompleted: (pin) {
          setState(() => showError = pin != '5555');
        },
        focusedPinTheme: defaultPinTheme.copyWith(
          height: 68,
          width: 64,
          decoration: defaultPinTheme.decoration!.copyWith(
            border: Border.all(color: borderColor),
          ),
        ),
        errorPinTheme: defaultPinTheme.copyWith(
          decoration: BoxDecoration(
            color: errorColor,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }

  void setState(bool Function() param0) {}
}