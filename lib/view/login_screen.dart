import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isHidden = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 34),
          child: Column(
            children: [
              SizedBox(
                height: 75,
              ),
              Text(
                "Welcome",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff000000)),
              ),
              Text(
                "Daily Reminder",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff000000)),
              ),
              SizedBox(
                height: 65,
              ),
              Row(
                children: [
                  Text("Email",
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff000000))),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                height: 40,
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff000000)),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xffD9D9D9).withOpacity(0.38),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text("Password",
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff000000))),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                height: 40,
                child: TextField(
                  obscureText: _isHidden,
                  keyboardType: TextInputType.emailAddress,
                  style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff000000)),
                  decoration: InputDecoration(
                    suffixIcon: InkWell(
                        onTap: () => setState(() => _isHidden = !_isHidden),
                        child: _isHidden
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility)),
                    filled: true,
                    fillColor: Color(0xffD9D9D9).withOpacity(0.38),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Forgot Password?",
                      style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff000000))),
                ],
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?",
                      style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff000000))),
                  InkWell(
                    onTap: () {
                      print("object");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    },
                    child: Text(" Sign Up",
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff11009E))),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              ReusableButton(
                onPressed: () {},
                text: "Login",
                color: Color(0xff11009E),
                textColor: Color(0xffFFFFFF),
              ),
              SizedBox(
                height: 10,
              ),
              ReusableButton(
                onPressed: () {},
                text: "Login with Google",
                color: Color(0xffC4B0FF),
                textColor: Color(0xff000000),
              ),
              SizedBox(
                height: 110,
              ),
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
