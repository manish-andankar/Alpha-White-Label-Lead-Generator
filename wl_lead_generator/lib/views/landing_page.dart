// import 'dart:html';
// import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:solana_wallet_adapter/solana_wallet_adapter.dart';
import 'result_page.dart';
import 'package:phone_form_field/phone_form_field.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  LandingPageState createState() => LandingPageState();
}

class LandingPageState extends State<LandingPage> {
  final _formKey = GlobalKey<FormState>();
  AuthorizeResult? _output;
  String? _capturedAddress;

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
    cluster: Cluster.devnet,
  );

  bool _optIn = false;
  String? _firstName;
  String? _lastName;
  String? _email;
  String? _countryCode;
  String? _mobileNumber;
  String? _twitterHandle;
  String? _discordHandle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lead Generator Application'),
        flexibleSpace: Align(
          alignment: Alignment.center,
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
        padding: const EdgeInsets.all(8.0),
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
                    }
                  },
                ),
                PhoneFormField(
                    key: const Key('phone-field'),
                    defaultCountry: IsoCode.US,
                    showDialCode: true,
                    onChanged: (phone) => {
                          _mobileNumber = phone?.countryCode,
                          debugPrint('debug:$phone')
                        }
                    //  decoration: const InputDecoration(
                    //     labelText: 'Mobile Number',          // default to null
                    //     border: OutlineInputBorder(), // default to UnderlineInputBorder(),
                    //   ),
                    ),
                // TextFormField(
                //   decoration: const InputDecoration(labelText: 'Country Code'),
                //   onChanged: (value) {
                //     _countryCode = value;
                //   },
                //   validator: (value) {
                //     if (_mobileNumber!.isNotEmpty &&
                //         (value == null || value.isEmpty)) {
                //       return 'Please enter your country code';
                //     }
                //     return null;
                //   },
                // ),
                // TextFormField(
                //   decoration: const InputDecoration(labelText: 'Mobile Number'),
                //   onChanged: (value) {
                //     _mobileNumber = value;
                //   },
                //   validator: (value) {
                //     if (_countryCode!.isNotEmpty &&
                //         (value == null || value.isEmpty)) {
                //       return 'Please enter your mobile number';
                //     }
                //     return null;
                //   },
                // ),
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
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => ResultPage(
                      //       walletConnected: true, // replace with actual value
                      //       firstName: _firstName!,
                      //       lastName: _lastName!, // replace with actual value
                      //       email: _email!,
                      //       countryCode: _countryCode!,
                      //       mobileNumber: _mobileNumber!,
                      //       twitterHandle: _twitterHandle,
                      //       discordHandle: _discordHandle,
                      //       optedIn: _optIn,
                      //     ),
                      //   ),
                      // );
                      // SolanaWalletAdapter.initialize();
                      // adapter.setProvider(),

                      adapter
                          .authorize()
                          .then((result) => setState(() {
                                _output = result;
                                _capturedAddress = _output
                                    ?.accounts.first.addressBase58 as String;
                              }))
                          .catchError(
                              (error) => setState(() => _output = error));
                      debugPrint('debug:$_output');
                    }
                  },
                  child: const Text('Wallet Connect'),
                ),
                if (_output != null) Text('Address: $_capturedAddress'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
