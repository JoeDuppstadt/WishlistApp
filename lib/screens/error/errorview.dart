import 'package:flutter/material.dart';
import 'package:wishlist/helpers/constants/app_colors.dart';

class Errorview extends StatelessWidget {
  final String errorMessage;

  Errorview({required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: const Text('Error',
        style: TextStyle(
          color: AppColors.accentColor
        ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Icon(
                Icons.error,
                size: 100.0,
                color: Colors.red,
              ),
              const SizedBox(height: 20),
              const Text(
                'Something went wrong!',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: AppColors.accentColor
                ),
              ),
              const SizedBox(height: 10),
              Text(
                errorMessage,
                style: const TextStyle(
                  fontSize: 16.0,
                  color: AppColors.accentColor,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
