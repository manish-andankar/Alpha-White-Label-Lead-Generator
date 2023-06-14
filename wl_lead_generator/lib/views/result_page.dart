import 'package:flutter/material.dart';
import 'landing_page.dart';

class ResultPage extends StatelessWidget {
  final int statusCode;
  final String firstName;
  final String lastName;
  final String email;
  final String? countryCode;
  final String? mobileNumber;
  final String? twitterHandle;
  final String? discordHandle;
  final bool optedIn;
  final String walletAddress;

  const ResultPage({
    super.key,
    required this.statusCode,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.countryCode,
    required this.mobileNumber,
    required this.twitterHandle,
    required this.discordHandle,
    required this.optedIn,
    required this.walletAddress,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Status Code: $statusCode',
            ),
            Text(
              'First Name: $firstName',
            ),
            Text(
              'Last Name: $lastName',
            ),
            Text(
              'Email: $email',
            ),
            Text(
              'Country Code: ${countryCode ?? 'Not provided'}',
            ),
            Text(
              'Mobile Number: ${mobileNumber ?? 'Not provided'}',
            ),
            Text(
              'Twitter Handle: ${twitterHandle ?? 'Not provided'}',
            ),
            Text(
              'Discord Handle: ${discordHandle ?? 'Not provided'}',
            ),
            Text(
              'Wallet Address: $walletAddress',
            ),
            CheckboxListTile(
              title: const Text("Opted in for updates"),
              value: optedIn,
              onChanged: null,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LandingPage()),
                );
              },
              child: const Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}
