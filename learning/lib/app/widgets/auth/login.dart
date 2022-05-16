import 'package:flutter/material.dart';
import 'package:learning/app/components/size_config.dart';
import 'package:learning/app/components/colors.dart';
import 'package:learning/app/widgets/auth/forgot.dart';

class LoginScreen extends StatelessWidget {
  // const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double mediaHeight = MediaQuery.of(context).size.height;

    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(32.5),
          child: ListView(
            children: [
              // SizedBox(
              //   height: mediaHeight * 0.03,
              // ),
              Container(
                height: 213,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/image/login_logox.png')),
                ),
              ),
              SizedBox(
                height: mediaHeight * 0.06,
              ),
              Text(
                'Login',
                style: TextStyle(
                  fontFamily: 'SFProText',
                  fontSize: mediaHeight * 0.04,
                  color: darkColor,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: mediaHeight * 0.02,
              ),
              _inputField(
                text: "username",
                iconName: Icons.person,
                ltext: "Username",
              ),
              SizedBox(
                height: mediaHeight * 0.02,
              ),
              _inputField(
                text: "password",
                iconName: Icons.padding_outlined,
                ltext: "Password",
              ),
              SizedBox(
                height: mediaHeight * 0.02,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ForgotScreen()));
                },
                child: new Text(
                  'Forgot password?',
                  style: TextStyle(
                    fontFamily: 'SFProText',
                    fontSize: mediaHeight * 0.02,
                    color: darkColor,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
              SizedBox(
                height: mediaHeight * 0.07,
              ),
              _buttonLogin()
            ],
          ),
        ),
      ),
    );
  }
}

class _buttonLogin extends StatelessWidget {
  const _buttonLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.black26, offset: Offset(0, 4), blurRadius: 5.0)
        ],
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          stops: [0.0, 1.0],
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
          // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage()));
        },
        child: Text(
          "LOGIN",
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

class _inputField extends StatelessWidget {
  String text;
  IconData iconName;
  String ltext;
  _inputField(
      {required this.text, required this.iconName, required this.ltext});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.06,
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        style: TextStyle(
          fontFamily: 'SFProText',
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(iconName),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            borderSide: BorderSide(color: darkColor),
          ),
          enabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(width: 1, color: Color(0xFF666666)),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          hintText: text,
          hintStyle: TextStyle(
            color: darkColor.withOpacity(0.3),
            fontSize: 20,
          ),
          labelText: ltext,
        ),
      ),
    );
  }
}
