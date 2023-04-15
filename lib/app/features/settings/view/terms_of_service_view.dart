import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sportsflickr/app/core/general_widgets/sportsflickr_appbar.dart';
import 'package:sportsflickr/app/core/theme/theme.dart';
import 'package:sportsflickr/app/features/settings/view/settings_view.dart';

class TermsOfServiceView extends ConsumerWidget {
  const TermsOfServiceView({super.key});

  static const routeName = '/settings/terms-of-service';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WillPopScope(
      onWillPop: () async {
        if (Navigator.canPop(context)) {
          context.pop();
        } else {
          context.goNamed(SettingsView.routeName);
        }
        return false;
      },
      child: Scaffold(
        appBar: SportsflickrAppBar(
          title: Text('Terms of Service', style: redHatDisplayBold14),
          onPressed: () {
            if (Navigator.canPop(context)) {
              context.pop();
            } else {
              context.goNamed(SettingsView.routeName);
            }
          },
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: paddingH24,
              child: Column(
                children: [
                  const Center(
                      child: Text(
                    ''' Terms of Service for Interviewer-Exclusive App(Sportsflickr)
    
    Thank you for using the Interviewer-Exclusive App(Sportsflickr) (the "App"), which was created for the purpose of this interview. By using the App, you agree to be bound by these Terms of Service ("Terms"). If you do not agree to these Terms, please do not use the App.
    
    Ownership of App
    The App, including all intellectual property rights, is the property of the developer, and all rights not expressly granted herein are reserved by the developer. These Terms do not grant you any right, title, or interest in the App or any of its components.
    
    Restrictions on Use
    You may use the App solely for the purpose of evaluating the developer's skills during the interview process. You may not modify, distribute, reproduce, or create derivative works based on the App or any portion thereof. You may not use the App for any commercial purpose, including but not limited to selling, licensing, or distributing the App or any portion thereof.
    
    Confidentiality
    The App and all information related to its development, design, and functionality are confidential and proprietary to the developer. You agree to maintain the confidentiality of the App and all related information, and not to disclose any such information to any third party without the prior written consent of the developer.
    
    Disclaimer of Warranties
    THE APP IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE DEVELOPER DOES NOT WARRANT THAT THE APP WILL MEET YOUR REQUIREMENTS OR THAT THE OPERATION OF THE APP WILL BE UNINTERRUPTED OR ERROR-FREE.
    
    Limitation of Liability
    THE DEVELOPER SHALL NOT BE LIABLE FOR ANY INDIRECT, SPECIAL, INCIDENTAL, CONSEQUENTIAL, OR EXEMPLARY DAMAGES ARISING OUT OF OR IN ANY WAY RELATED TO THE USE OR INABILITY TO USE THE APP, INCLUDING WITHOUT LIMITATION DAMAGES FOR LOSS OF PROFITS, LOSS OF GOODWILL, OR LOSS OF DATA, EVEN IF THE DEVELOPER HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.
    
    Governing Law and Jurisdiction
    These Terms shall be governed by and construed in accordance with the laws of the state in which the developer is located, without giving effect to any principles of conflicts of law. Any legal action or proceeding arising out of or in connection with these Terms shall be brought in the state or federal courts located in that state, and each party hereby consents to the jurisdiction and venue of such courts.
    
    Modifications to Terms
    The developer reserves the right to modify these Terms at any time without prior notice. Your continued use of the App following any such modification constitutes your agreement to be bound by the modified Terms.
    
    Entire Agreement
    These Terms constitute the entire agreement between you and the developer with respect to the use of the App, and supersede all prior or contemporaneous communications and proposals, whether oral or written, between you and the developer.
    
    If you have any questions about these Terms, please contact the developer before using the App. By using the App, you acknowledge that you have read, understood, and agreed to these Terms.
    ''',
                    textAlign: TextAlign.justify,
                  )),
                  Text(
                    ' Sportsflickr Team',
                    style: redHatDisplayBold14,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
