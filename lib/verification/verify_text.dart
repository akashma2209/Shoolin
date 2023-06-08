import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../utils/colors.dart';
import 'VerhoeffAlgorithm.dart';
import 'button.dart';

class AadhaarVerificationScreen extends StatefulWidget {
  @override
  _AadhaarVerificationScreenState createState() =>
      _AadhaarVerificationScreenState();
}

class _AadhaarVerificationScreenState extends State<AadhaarVerificationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _aadhaarController = TextEditingController();
  TextEditingController _otpController = TextEditingController();
  bool _isAadhaarValid = false;
  int count = 0;
  String mobileNumber = '';

  void _verifyAadhaar() {
    count++;
    final aadhaarNumber = _aadhaarController.text;
    final isAadhaarValid = VerhoeffAlgorithm.verifyAadhaar(aadhaarNumber);
    setState(() {
      _isAadhaarValid = isAadhaarValid;
      if (isAadhaarValid) {
        // Logic to fetch the mobile number associated with Aadhaar
        mobileNumber = getMobileNumberFromAadhaar(aadhaarNumber);
      } else {
        mobileNumber = '';
      }
    });
  }

  String getMobileNumberFromAadhaar(String aadhaarNumber) {
    // Implement your logic to fetch the mobile number associated with Aadhaar
    return 'XXXXXXXXXX'; // Replace with actual mobile number
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 50),
              TextFormField(
                controller: _aadhaarController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Aadhaar Number',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    Get.snackbar("Empty!","Please enter your Aadhaar Number" ,backgroundColor: AppColors.mainColor, colorText: Colors.white,);
                  } else {
                    _verifyAadhaar();
                    if (!_isAadhaarValid) {
                      Get.snackbar("Invalid ","'Enter Valid Aadhaar Number'" ,backgroundColor: AppColors.mainColor, colorText: Colors.white,);
                    }

                    return null;
                  }
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    String f_name = _aadhaarController.text;
                    _aadhaarController.clear();
                  }
                },
                child: const Text('Verify Aadhaar'),
              ),
              if (_isAadhaarValid) SizedBox(height: 16.0),
              if (_isAadhaarValid)
                Text(
                  'OTP will be sent to: $mobileNumber',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
              if (_isAadhaarValid) SizedBox(height: 16.0),
              if (_isAadhaarValid) TextFormField(
                controller: _otpController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Enter OTP',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the OTP';
                  }
                  return null;
                },
              ),
              if (_isAadhaarValid) SizedBox(height: 16.0),
              if (_isAadhaarValid)
                ElevatedButton(
                  onPressed: () {
                    // Logic to handle OTP submission
                    if (_formKey.currentState!.validate()) {
                      String otp = _otpController.text;
                      _otpController.clear();
                      // Perform OTP verification logic here
                    }
                  },
                  child: const Text('Submit OTP'),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
