import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login_screen.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 55),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 35,
              ),
              Image.asset('assets/images/landing_page.png'),
              SizedBox(
                height: 5,
              ),
              Text(
                "Welcome to Daily Reminder",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff4942E4)),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Never Miss a Beat, Stay Organized with Daily Reminders",
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff000000)),
              ),
              Spacer(),
              ReusableButton(
                onPressed: () {
                  print("object");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
                color: Color(0xff11009E),
                text: "Login",
                textColor: Color(0xffFFFFFF),
              ),
              SizedBox(
                height: 15,
              ),
              ReusableButton(
                onPressed: () {
                  print("object");
                },
                color: Color(0xffC4B0FF),
                text: "Register",
                textColor: Color(0xff000000),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

class ReusableButton extends StatelessWidget {
  ReusableButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.color,
    required this.textColor,
  });
  final VoidCallback onPressed;
  final String text;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        width: 230,
        child: ElevatedButton(
          onPressed: () {
            onPressed();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            padding: EdgeInsets.symmetric(vertical: 10.5),
          ),
          child: Text(
            text,
            style: GoogleFonts.poppins(
                fontSize: 14, fontWeight: FontWeight.w600, color: textColor),
          ),
        ));
  }
}
