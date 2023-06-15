// import 'dart:html';
// import 'dart:js_interop';

import 'dart:convert';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:solana_wallet_adapter/solana_wallet_adapter.dart';
import 'package:wl_lead_generator/widgets/countdown.dart';
import 'package:wl_lead_generator/widgets/error_box.dart';
import 'result_page.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:phone_form_field/phone_form_field.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({
    Key? key,
    required this.title,
    required this.analytics,
    required this.observer,
  }) : super(key: key);

  final String title;
  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;

  @override
  LandingPageState createState() => LandingPageState();
}

class LandingPageState extends State<LandingPage> {
  final _formKey = GlobalKey<FormState>();
  AuthorizeResult? _output;
  String? _capturedAddress;
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  // final AppInfo appInfo = AppInfo(
  //   name: 'My App',
  //   // icon: 'https://my-app.com/icon.png',
  // );

  // 1. Create instance of [SolanaWalletAdapter].
  final adapter = SolanaWalletAdapter(
    const AppIdentity(),
    // uri: Uri.https('merigo.com'),
    // icon: Uri.parse('favicon.png'),
    // name: 'Example App',
    //),
    // NOTE: CONNECT THE WALLET APPLICATION
    // TO THE SAME NETWORK.
    cluster: Cluster.mainnet,
  );

  bool _optIn = false;
  String? _firstName;
  String? _lastName;
  String? _email;
  String? _countryCode;
  String? _mobileNumber;
  String? _twitterHandle;
  String? _discordHandle;
  String? walletAddress;

  // Wallet not found modal
  Future<void> _showPhantomModal() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Phantom Wallet not found'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                    'Phantom Wallet was not detected on this system. Would you like to go to the install page?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Yes'),
              onPressed: () {
                Navigator.of(context).pop();
                final appId =
                    Theme.of(context).platform == TargetPlatform.android
                        ? AppInfo.phantom.androidId
                        : AppInfo.phantom.iosId;
                if (Theme.of(context).platform == TargetPlatform.iOS) {
                  launchUrlString('https://apps.apple.com/app/$appId');
                } else if (Theme.of(context).platform ==
                    TargetPlatform.android) {
                  launchUrlString('market://details?id=$appId');
                } else {
                  launchUrlString('https://phantom.app/');
                }
              },
            ),
          ],
        );
      },
    );
  }

  // submit data
  Future<int> submitData() async {
    const url =
        'https://us-west2-continual-mind-388823.cloudfunctions.net/user'; // Replace with your API endpoint
    // const url = "http://localhost:8080/user";
    // Create a map of the data to be sent
    final data = {
      'firstName': _firstName,
      'lastName': _lastName,
      'email': _email,
      'countryCode': _countryCode,
      'mobileNumber': _mobileNumber,
      'twitterHandle': _twitterHandle,
      'discordHandle': _discordHandle,
      'optIn': _optIn,
      'solAddress': walletAddress,
    };

    final headers = {
      'Content-Type': 'application/json',
    };

    final jsonData = json.encode(data);

    // Send a POST request to the server
    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: jsonData,
    );

    // Check the response status
    if (response.statusCode == 200) {
      // Data submitted successfully
      print('Data submitted successfully');
    } else {
      // Error occurred while submitting data
      print('Error submitting data. Status code: ${response.statusCode}');
    }
    return response.statusCode;
  }

  Object? output;
  dynamic capturedError;
  bool switchValue = true;

  @override
  Widget build(BuildContext context) {
    TextEditingController txtController = TextEditingController(
        text: walletAddress ?? "No Wallet Address Captured");

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lead Generator Application'),
        flexibleSpace: Align(
          alignment: Alignment.centerLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: Image.asset(
                  'assets/logo/logo.png', // Replace with your own logo asset
                  height: 40.0,
                  width: 40.0,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(labelText: 'First Name'),
                  onSaved: (value) {
                    _firstName = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your first name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Last Name'),
                  onSaved: (value) {
                    _lastName = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your last name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Email'),
                  onChanged: (value) {
                    _email = value;
                  },
                  validator: (value) {
                    // Add email validation using regex
                    RegExp emailRegex = RegExp(
                        r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$');

                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    } else if (!emailRegex.hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                  onFieldSubmitted: (value) {
                    // This callback is triggered when the user submits or finishes editing the field
                    // You can perform additional validation or other actions here
                    if (_formKey.currentState!.validate()) {
                      // Field is valid, proceed with the desired action
                      // json post
                    }
                  },
                ),
                PhoneFormField(
                    key: const Key('phone-field'),
                    decoration:
                        const InputDecoration(labelText: 'Mobile Number'),
                    defaultCountry: IsoCode.US,
                    showDialCode: true,
                    onChanged: (phone) => {
                          _mobileNumber = phone?.countryCode,
                          debugPrint('debug:$phone')
                        }),
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: 'Twitter Handle'),
                  onChanged: (value) {
                    _twitterHandle = value;
                  },
                  validator: (value) {
                    if (_optIn == true && (value == null || value.isEmpty)) {
                      return 'Please enter your twitter handle';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Discord ID'),
                  onChanged: (value) {
                    _discordHandle = value;
                  },
                  validator: (value) {
                    if (_optIn == true && (value == null || value.isEmpty)) {
                      return 'Please enter your discord ID';
                    }
                    return null;
                  },
                ),
                CheckboxListTile(
                  title: const Text("Opt-in for updates."),
                  value: _optIn,
                  onChanged: (bool? value) {
                    setState(() {
                      _optIn = value ?? false;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: 'Wallet Address'),
                  controller: txtController,
                  enabled: false,
                ),
                if (walletAddress == null)
                  ElevatedButton(
                    onPressed: () async {
                      adapter.authorize().then((result) {
                        setState(() {
                          setState(() {
                            output = result;
                          });
                          setState(() {
                            walletAddress =
                                result.accounts.first.addressBase58.toString();
                          });
                          setState(() {
                            capturedError = null;
                          });
                        });
                      }).catchError((error) {
                        debugPrint('Error: ${error.toString()}');

                        if (error.toString() ==
                                'Assertion failed: "Desktop implementations must call setProvider() first."' ||
                            error.toString() ==
                                "[SolanaException<SolanaWalletAdapterExceptionCode>] SolanaWalletAdapterExceptionCode.walletNotFound : The wallet application could not be opened.") {
                          debugPrint('Launching Phantom Wallet Connect');
                          _showPhantomModal();
                        }
                      });
                    },
                    child: const Text('Connect Wallet'),
                  ),
                if (walletAddress != null)
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        submitData().then((value) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ResultPage(
                                statusCode: value,
                                firstName: _firstName!,
                                lastName:
                                    _lastName!, // replace with actual value
                                email: _email!,
                                countryCode: _countryCode,
                                mobileNumber: _mobileNumber,
                                twitterHandle: _twitterHandle,
                                discordHandle: _discordHandle,
                                optedIn: _optIn,
                                walletAddress: walletAddress!,
                                analytics: analytics, observer: observer,
                                title: '',
                              ),
                            ),
                          );
                        }).catchError((error) {
                          debugPrint('Error: ${error.toString()}');
                          setState(() {
                            capturedError = error.toString();
                          });
                        });
                      }
                    },
                    child: const Text('Submit Lead'),
                  ),
                if (_output != null) Text('Address: $_capturedAddress'),
                const CountDown(),
                if (capturedError != null)
                  ErrorBox(
                      errorMessage: capturedError,
                      onClose: () {
                        setState(() {
                          capturedError = null;
                        });
                      })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
