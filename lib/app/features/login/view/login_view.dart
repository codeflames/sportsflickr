import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sportsflickr/app/core/general_widgets/sportsflickr_form_fields.dart';
import 'package:sportsflickr/app/core/general_widgets/sportsflickr_formatter.dart';
import 'package:sportsflickr/app/core/theme/theme.dart';
import 'package:sportsflickr/app/features/profile/view/profile_view.dart';
import 'package:sportsflickr/app/features/register/view/register_view.dart';
import 'package:sportsflickr/gen/assets.gen.dart';

final showEmailFieldProvider = StateProvider<bool>((ref) => true);

class LoginView extends ConsumerWidget {
  const LoginView({Key? key}) : super(key: key);

  static const routeName = '/login';

  static final TextEditingController _emailController = TextEditingController();
  static final TextEditingController _passwordController =
      TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showEmailField = ref.watch(showEmailFieldProvider);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: sportsflickrScreenHeight(context),
          padding: paddingH24,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(Assets.images.logoSportsflickrSvg,
                  width: 100.h, height: 100.h),
              Text(
                'SportsFlickr',
                style: redHatDisplayBold20,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 32.h),
              Row(
                children: [
                  Expanded(
                    child: showEmailField
                        ? SportsflickrEmailField(
                            controller: _emailController,
                          )
                        : SportsflickrTextFormField(
                            labelText: 'Phone Number',
                            controller: _emailController,
                            keyboardType: TextInputType.phone,
                          ),
                  ),
                  SizedBox(width: 16.w),
                  GestureDetector(
                    onTap: () {
                      _emailController.clear();
                      ref.read(showEmailFieldProvider.notifier).state =
                          !showEmailField;
                    },
                    child: Icon(
                        showEmailField == true
                            ? Icons.phone_android
                            : Icons.email_rounded,
                        size: 24.w,
                        color: five36BE5),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              SportsflickrPasswordField(
                controller: _passwordController,
              ),
              SizedBox(height: 16.h),
              Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      style: textButtonStyle.copyWith(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            const EdgeInsets.symmetric(
                                horizontal: 4, vertical: 0)),
                      ),
                      onPressed: () {},
                      child: const Text('Forgot Password?'))),
              SizedBox(height: 16.h),
              ElevatedButton(
                style: primaryButtonStyle,
                onPressed: () {
                  context.goNamed(ProfileView.routeName);
                },
                child: const Text('Login'),
              ),
              SizedBox(height: 48.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\'t have an account?',
                      style: redHatDisplayRegular14),
                  TextButton(
                      style: textButtonStyle.copyWith(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            const EdgeInsets.symmetric(
                                horizontal: 4, vertical: 0)),
                      ),
                      onPressed: () {
                        context.goNamed(RegisterView.routeName);
                      },
                      child: const Text('Register'))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   bool _showEmailField = true;
//   TextEditingController _emailController = TextEditingController();
//   TextEditingController _phoneController = TextEditingController();
//   TextEditingController _passwordController = TextEditingController();

//   void _toggleField() {
//     setState(() {
//       _showEmailField = !_showEmailField;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Container(
//           padding: EdgeInsets.all(32.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               SizedBox(height: 50.0),
//               Text(
//                 'Login',
//                 style: TextStyle(
//                   fontSize: 32.0,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(height: 50.0),
//               _showEmailField
//                   ? TextFormField(
//                       controller: _emailController,
//                       keyboardType: TextInputType.emailAddress,
//                       decoration: InputDecoration(
//                         hintText: 'Email',
//                         border: OutlineInputBorder(),
//                       ),
//                     )
//                   : TextFormField(
//                       controller: _phoneController,
//                       keyboardType: TextInputType.phone,
//                       decoration: InputDecoration(
//                         hintText: 'Phone',
//                         border: OutlineInputBorder(),
//                       ),
//                     ),
//               SizedBox(height: 20.0),
//               TextFormField(
//                 controller: _passwordController,
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   hintText: 'Password',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(height: 20.0),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: <Widget>[
//                   GestureDetector(
//                     onTap: _toggleField,
//                     child: Text(
//                       _showEmailField ? 'Use Phone' : 'Use Email',
//                       style: TextStyle(
//                         color: Colors.blue,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 20.0),
//               ElevatedButton(
//                 onPressed: () {
//                   // Handle login button press here
//                 },
//                 child: Text('Login'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
