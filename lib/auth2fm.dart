import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:async';

class AuthenticationTwoFM extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _AuthenticationTwoFMState createState() => _AuthenticationTwoFMState();
}

class _AuthenticationTwoFMState extends State<AuthenticationTwoFM> {
  final TextEditingController _otpController = TextEditingController();
  bool _isResendEnabled = false;
  int _start = 30;
  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    setState(() {
      _start = 30;
      _isResendEnabled = false;
    });
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            _isResendEnabled = true;
          });
          timer.cancel();
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  void _verifyOTP() {
    String otp = _otpController.text.trim();
    if (otp.isNotEmpty) {
      // Call your backend API to verify the OTP
      // For demo purposes, we assume the OTP is '123456'
      if (otp == '123456') {
        Fluttertoast.showToast(msg: 'OTP Verified!');
      } else {
        Fluttertoast.showToast(msg: 'Invalid OTP!');
      }
    } else {
      Fluttertoast.showToast(msg: 'Please enter the OTP!');
    }
  }

  void _resendOTP() {
    if (_isResendEnabled) {
      // Call your backend API to resend the OTP
      Fluttertoast.showToast(msg: 'OTP Resent!');
      _startTimer();
    } else {
      Fluttertoast.showToast(msg: 'Please wait for the timer to finish.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Two-Factor Authentication'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text:
                        'An SMS with verfication code has been sent toyour mobile ',
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                  TextSpan(
                    text:
                        'since Two Factor Authenticationis enabled.. Please enter code',
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                  TextSpan(
                    text: ' here.',
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: TextField(
                controller: _otpController,
                decoration: const InputDecoration(
                  labelText: 'Enter OTP',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(height: 16.0),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      // TextSpan(
                      //   text: 'Didn\'t receive the code? ',
                      //   style: TextStyle(color: Colors.black),
                      // ),
                      TextSpan(
                        text: _isResendEnabled
                            ? 'Resend Code'
                            : 'Resend Code ($_start s)',
                        style: TextStyle(
                          color: _isResendEnabled ? Colors.blue : Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            if (_isResendEnabled) {
                              _resendOTP();
                            }
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 415),
            ElevatedButton(
              onPressed: _verifyOTP,
              child: Text(
                'Submit'.toUpperCase(),
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Background color
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 155),
                textStyle: TextStyle(fontSize: 18.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            SizedBox(height: 25),
            ElevatedButton(
              onPressed: _verifyOTP,
              child: Text(
                'Cancel'.toUpperCase(),
                style: TextStyle(color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xfff9f9f9), // Background color
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 155),
                textStyle: TextStyle(fontSize: 18.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
