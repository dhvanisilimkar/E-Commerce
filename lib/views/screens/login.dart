// import 'package:animated_login/animated_login.dart';
// import 'package:flutter/material.dart';
//
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);
//
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   @override
//   Widget build(BuildContext context) {
//
//     List<SocialLogin> _socialLogins(BuildContext context) => <SocialLogin>[
//       SocialLogin(
//           callback: () async => _socialCallback('Google'),
//           iconPath: 'assets/images/google.png'),
//       SocialLogin(
//           callback: () async => _socialCallback('Facebook'),
//           iconPath: 'assets/images/facebook.png'),
//       SocialLogin(
//           callback: () async => _socialCallback('LinkedIn'),
//           iconPath: 'assets/images/linkedin.png'),
//     ];
//
//     Future<String?> _socialCallback(String type) async {
//       await _operation?.cancel();
//       _operation = CancelableOperation.fromFuture(
//           LoginFunctions(context).socialLogin(type));
//       final String? res = await _operation?.valueOrCancellation();
//       if (_operation?.isCompleted == true && res == null) {
//         DialogBuilder(context)
//             .showResultDialog('Successfully logged in with $type.');
//       }
//       return res;
//     }
//
//     LanguageOption languageOption = _languageOptions[1];
//     AuthMode currentMode = AuthMode.login;
//     CancelableOperation _operation;
//
//     return AnimatedLogin(
//       onLogin: (LoginData data) =>
//           _authOperation(LoginFunctions(context).onLogin(data)),
//     );
//   }
// }
