import 'package:car_shop/views/screens/otp_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: screenWidth,
          height: screenHeight,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _mobileNumberTextField(),
              const SizedBox(
                height: 16.0,
              ),
              _customSendButton(screenWidth: screenWidth,),
            ],
          ),
        ),
      ),
    );
  }

  void sendOtp({required BuildContext context}) async {
    String number = mobileController.text.toString();
    String otpUrl =
        "http://dev.carclenx.com/api/V2/customers/get-otp?phone=$number";
    var otpRequest = http.Request(
      'POST',
      Uri.parse(otpUrl),
    );
    http.StreamedResponse apiResponse = await otpRequest.send();
    if (apiResponse.statusCode == 200) {
      String result = await apiResponse.stream.bytesToString();
      if (kDebugMode) {
        print("OTP SENT SUCCESSFULLY: $result");
      }
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) =>  OtpScreen(otpSentNumber: number,),
        ),
      );
    } else {
      const snackBar =  SnackBar(
        content: Text(
          "Something Went Wrong! Please Try Again.",
        ),
      );
      if (kDebugMode) {
        print("ERROR OCCURRED: ${apiResponse.reasonPhrase}");
      }
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  _mobileNumberTextField() => TextFormField(
        controller: mobileController,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
          hintText: "Enter Phone Number",
          hintStyle: const TextStyle(
            fontSize: 16.0,
            color: Colors.grey,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
          ),
          prefixIcon: const Icon(
            Icons.phone_android_outlined,
          ),
        ),
      );

  _customSendButton({required double screenWidth}) => InkWell(
    onTap: () => sendOtp(context: context),
    child: Container(
      width: screenWidth * 0.8,
      height: 48.0,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.deepPurple,
      ),
      child: const Text(
        "GET OTP",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          letterSpacing: 2.0,
        ),
      ),
    ),
  );
}
