import 'package:flutter/material.dart';
import 'package:roomrentalapp/components/customappbar.dart';
import 'package:roomrentalapp/themes/texts.dart';

class TermsPage extends StatelessWidget {
  const TermsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: "Terms and Condition", arrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome to room rental !!",
                style: AppText.blacknormalText,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "By accessing or using our mobile app, you agree to comply with "
                "and be bound by these terms and conditions: ",
                style: AppText.blacksmallText,
              ),
              SizedBox(
                height: 5,
              ),
              CustomTerms(
                termstitle: "1. User and Registration",
                firstterm:
                    "- Users must provide accurate and truthful information during the "
                    "registration process.",
                secondterm:
                    "- Users are responsible for maintaining the confidentiality of"
                    " their account credentials.",
              ),
              CustomTerms(
                termstitle: "2. Listing and Booking",
                firstterm:
                    "- Users can list for rent and book accommodations through the app.",
                secondterm:
                    "- Listings must adhere to local laws and users are resonsible for the accuracy of the information provided.",
              ),
              CustomTerms(
                termstitle: "3. Security and Privacy",
                firstterm:
                    "- The app collects and uses user data in accordance with the privacy policy.",
                secondterm:
                    "- Measures are taken to secure user information, but users are advised to tale precautions as well.",
              ),
              CustomTerms(
                termstitle: "4. Prohibited Activities",
                firstterm:
                    "- Users are prohibited from engaging in fraudulent activities, discrimination, or any misuse of the app.",
                secondterm:
                    "- Violation of these terms may result in the termination of the user's account.",
              ),
              CustomTerms(
                termstitle: "5. Prohibited Activities",
                firstterm:
                    "- Users are prohibited from engaging in fraudulent activities, discrimination, or any misuse of the app.",
                secondterm:
                    "- Violation of these terms may result in the termination of the user's account.",
              ),
              CustomTerms(
                termstitle: "6. Liability and Disclaimers",
                firstterm:
                    "- The app is not liable for anu inaccuracies in user-provided information.",
                secondterm:
                    "- Users are responsible for te condition of the listed property, and the app is not responsible for any disputes between users.",
              ),
              CustomTerms(
                termstitle: "7. Termination of Account",
                firstterm:
                    "- The app reserves the right to terminate or suspend a user's account for violations of these terms or illegal activities.",
                secondterm: "",
              ),
              CustomTerms(
                termstitle: "8. Changes to Terms",
                firstterm:
                    "The app may update or modify these terms, and users will be notified of any changes.",
                secondterm: "",
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTerms extends StatelessWidget {
  const CustomTerms({
    super.key,
    required this.termstitle,
    required this.firstterm,
    required this.secondterm,
  });
  final String termstitle;
  final String firstterm;
  final String secondterm;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          termstitle,
          style: AppText.blacknormalText,
        ),
        const SizedBox(
          height: 2,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 4),
          child: Text(
            firstterm,
            style: AppText.blacksmallText,
            textAlign: TextAlign.start,
          ),
        ),
        const SizedBox(
          height: 2,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 4),
          child: Text(
            secondterm,
            style: AppText.blacksmallText,
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }
}
