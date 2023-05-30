# TPR: Phantom Wallet Connect for White Label Lead Generator to capture Sol Address for the User authentication.
## Solution Description: Alpha White Label Lead Generator
### Industry: Fin-Tech

This is *The Phoenix's Rebirth*, that contains working and deployable code for White Label Lead Generator to perform Phantom Wallet Connect, capture Sol Address of the User and authenticates the user by creating a user session.

### Tech Stack
- Tech Stack of [TLS](https://github.com/manish-andankar/Alpha-White-Label-Lead-Generator/blob/TLS/README.md)
- Phantom Wallet: Phantom is a crypto wallet that can be used to manage digital assets and access decentralized applications on Solana, Polygon, and Ethereum. Phantom is     currently available as:
  - A browser extension
  - An iOS app
  - An Android app.
  Visit https://phantom.app/ and https://docs.phantom.app/introduction/readme to learn more.
- Solana: Solana is a blockchain built for mass adoption. It's a high performance network that is utilized for a range of use cases, including finance, NFTs, payments, and gaming. Solana operates as a single global state machine, and is open, interoperable and decentralized. Visit https://solana.com/ to learn more.

### Requirement Specifications:
- Integrate [TLS](https://github.com/manish-andankar/Alpha-White-Label-Lead-Generator/blob/TLS/README.md) with Phantom Wallet through "Wallet Connect" button on the screen, to capture Sol Address of the User and authenticate the user by creating a user session on establishing the wallet connection successfully.

1. For Mobile Apps (iOS and Android): 
    - App detects installed Phantom Wallet app on the device, presents the Phantom Wallet app at the bottom of the screen.
    - User selects Phantom Wallet.
    - In case it is not installed, the app presents option to install it from resepective app store (Google Play or App Store) and set it up.
    - User Sign-in to the Phantom Wallet, Provides consent to connect the wallet with the mobile app, the mobile app fetches the SOL Account address and temporarily persisits it in-memory as long as the app is running.
2. For Web App: (Browser):
    - Broswer detects installed Phantom Wallet browser extension.
    - If the extension is already installed in the browser, then it pops up.
    - In case it is not installed, the app presents option to install it and set it up.
    - User Sign-in to the Phantom Wallet through the Phantom Wallet extension, Provides consent to connect the wallet with the Web app, the web app fetches the SOL Account address and temporarily persisits it in the broswer session as long as the browser is running.

*Error Handling:*
If the user does not provide consent to connect to the Phantom wallet, or the application is unable to connect to the Phantom wallet, then an appropriate error message is displayed on the result screen. As an illustration see the screenshot below:
<img width="694" alt="image" src="https://github.com/manish-andankar/Alpha-White-Label-Lead-Generator/assets/128000185/fb977ba1-b430-4981-8a22-3d6c6830c96a">


### Solution Constraints:
- The Sol Address and UserInfo (along with OptIn) is not sent to the server upon successful Wallet Connect.

### Tools to use/avoid
As described in [TLS](https://github.com/manish-andankar/Alpha-White-Label-Lead-Generator/blob/TLS/README.md). Additional tools related to Wallet Connection with Phantom Wallet, may also be used.

### Test Cases - Applicable for Web, Android and iOS App.
| Test No | Test Name | Test Description | Test Data |  Test Steps | Expected Results |
| ----------- | ----------- |----------- | ----------- | ----------- | ----------- |
| 1 | Access app (Web, Android, iOS) and Wallet SignIn | Access the app and Wallet SignIn  | UserInfo Provided & Opt-In Checked | Landing Screen is presented to the user, User provides information and Opts-In for Updates, User clicks Wallet Connect  | User is redirected to Phantom Wallet, Provides necessary information such as Password to prove their identity, Authorizes Lead Generator app to access Sol Address (optionally balance), App captures the Sol Address, App Authenticates the User by creating their User Session. In case of Web the Phantom Wallet Browser Extension is used, whereas in case of Android or iOS App, the Phantom Wallet App installed in the phone is autodetected and can be selected by the user to authorise the app and connect their wallet to sign in. |

The sample application url https://solana-labs.github.io/wallet-adapter/example/ can be accessed on the Web Browser or the Browser in the Android/iOS device to understand the requirements clearly.

*Illustrations (For reference only):*

1. Mobile Apps(iOS and Android): [Watch an illustrative video for Mobile Apps.](https://github.com/manish-andankar/Alpha-White-Label-Lead-Generator/assets/128000185/606f63b9-3583-457c-a715-a31d797997c5)

2. Web App - Browsers: [Watch an illustrative video for Web App.](https://github.com/manish-andankar/Alpha-White-Label-Lead-Generator/assets/128000185/ae345485-8e43-4d85-a3a5-82f8644c045d)






### Deliverables
- Same as [TLS](https://github.com/manish-andankar/Alpha-White-Label-Lead-Generator/blob/TLS/README.md), with an additional feature to allow users to connect their Phantom Wallet on all three platforms (Web, Android and iOS), as demonstrated by the sample application at https://solana-labs.github.io/wallet-adapter/example/.
