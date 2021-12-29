import 'package:car_shop/views/screens/home_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class OtpScreen extends StatefulWidget {
  final String otpSentNumber;

  const OtpScreen({
    Key? key,
    required this.otpSentNumber,
  }) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _otpTextField(),
              const SizedBox(height: 16.0,),
              _verifyOtpButton(screenWidth: screenWidth),
            ],
          ),
        ),
      ),
    );
  }

  _otpTextField() => TextFormField(
        controller: otpController,
        keyboardType: TextInputType.number,
        maxLength: 6,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
          hintText: "Enter Received OTP",
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

  _verifyOtpButton({required double screenWidth}) => InkWell(
        onTap: () => verifyOTP(context: context),
        child: Container(
          width: screenWidth * 0.8,
          height: 48.0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.deepPurple,
          ),
          child: const Text(
            "VERIFY OTP",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
            ),
          ),
        ),
      );

  verifyOTP({required BuildContext context}) async {
    String receivedOTP = otpController.text;
    String otpUrl =
        "http://dev.carclenx.com/api/V2/customers/validate-otp?phone=${widget.otpSentNumber}&otp=$receivedOTP";
    var verifyRequest = http.Request(
      'POST',
      Uri.parse(otpUrl),
    );
    http.StreamedResponse verifiedResponse = await verifyRequest.send();

    if (verifiedResponse.statusCode == 200) {
      if (kDebugMode) {
        print("SUCCESS: Mobile Verified Successfully!");
      }
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    }
  }
}
