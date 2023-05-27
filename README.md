# THJ1: Front-End Cross-Platform Flutter Application
## Solution Description: Alpha White Label Lead Generator
### Industry: Fin-Tech

This is **Part-1** of *The Hobbit's Journey*, that contains working and deployable code and final software package for Front-End Cross-Platform application, built using Flutter.

### Tech Stack
The Alpha White Label Lead Generation Flutter App utilizes the following technologies and frameworks:
- Flutter: A UI toolkit for building natively compiled applications for mobile, web, and desktop from a single codebase. Visit https://docs.flutter.dev/ to learn more.
- Dart: The programming language used by Flutter to build applications.
- GitHub: A web-based platform for version control and collaboration that allows developers to host and review code, manage projects, and build software alongside millions of other developers.

### Requirement Specifications:
- [ ] Landing/Home Page:
  - *User Info:*User Provides Following Information
    - First name... (Input)
    - Last name... (Input)
    - Email... (Input)
    - Country Code... (Dropdown of Country)
    - Mobile Number... (Input)
    - Twitter handle... (Input)
    - Discord handle... (Input)
    - Checkbox 
    - [ ] Opt in for updates. 
    *Note: If yes, Twitter and Discord are mandatory.*
  - Button
    - CTA (Button Text): Wallet Connect 
- [ ] Result Page: 
    - Upon clicking 'Wallet Connect' button, show the following,
    - *Success Message:* Congratulations {{FirstName}} {{LastName}} !! You are now connected to New Sacred. 
    *Note: In case of Success, & User did not Opt in for updates on Landing/Home Page, there is another chance to do it*
    - *Opt-in CTA Message:* Are you sure you do not want to miss out on those awesome updates that gives you access to exclusive New Sacred merchandise and opportunities to participate in events that benefits you?
      - Checkbox 
      - [ ] Opt in for updates. 
    - *Failure Message:* Could not connect to the wallet. Give it another try!
    - *Naviage to Home Button:* [Back to Home]

### Solution Constraints:
  - Deployable on three platformes - Web, Android and iOS Application.
  - Performance: Response time, Load Time, Resource Utilization, Application File/Build Size, No Errors, Warnings or Crashes.
  - Passes all test cases in the test suite on all three plarforms.
  - Passes all the automated unit test cases

### Tools to use/avoid
  - Use: Flutter
  - Use: Any of the Integrated Development Environment like Visual Studio Code recommended by Flutter. See https://docs.flutter.dev/get-started/editor to learn more.
  - use: Dart, DartPad
  - use: Best practices and Recommendations from Flutter 
  - use: Vercel to deploy the applicaiton on Web. See https://vercel.com/. You may use a platform of your choice.

### Test Cases - Applicable for Web, Android and iOS App.
| Test No | Test Name | Test Description | Test Data |  Test Steps | Expected Results |
| ----------- | ----------- |----------- | ----------- | ----------- | ----------- |
| 1 | Access the application | Access the applocation  | None | Web: Access the URL, Mobile: Install and Open the App | Application loads the landing page successfully. |
| 2 | Provide user information | User provides information on the landing page | User Info | Provide User Info | The user input is validated as per the requirements. |
| 3 | Opt-In Checkbox | Opt-In for Updates Checkbox | None | Click or Tap Opt-In for Updates checkbox | Opt-In checkbox toggles. |
| 4 | Wallet Connect Success Opt-In| Wallet Connect is successful | User Info, Opt-In | Provide User Info, Opt-In is Checked, Click Wallet Connect Button | User Navigates to Result Page, with a *Success Message*. |
| 4 | Wallet Connect Success Opt-Out| Wallet Connect is successful | User Info, Opt-Out | Provide User Info, Opt-In is Checked, Click Wallet Connect Button | User Navigates to Result Page, with a *Success Message*, followed by *Opt-in CTA Message* and Checkbox to Opt-In. |
| 5 | Wallet Connect Failure | Wallet Connect fails | User Info, Opt-Out | Provide User Info with email *a@a.com*, Opt-In is *UNCHECKED*, Click Wallet Connect Button | User Navigates to Result Page, with a *Failure Message*, and page shows *Naviage to Home Button*|

### Deliverable
  - Completed Code is checked in to the repository with a *unique folder name* that indicates your contribution.
  - Web application deployed on Vercel and link shared in a text file checked in with the name *web_app_url* under the folder *deliverables* within your *unique folder*.
  - Mobile application files for iOS and Android that are installable on an Apple or Android device and runs successfully on those devices.  
  - Documentation & Video Demo under the folder *documentation* within your *unique folder*. 




