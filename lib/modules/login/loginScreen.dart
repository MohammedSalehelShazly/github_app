import 'package:flutter/material.dart';
import 'package:github_app/logic/providers/loginProvider.dart';
import 'package:github_app/logic/providers/mainProvider.dart';
import 'package:github_app/shared/components/appButton.dart';
import 'package:github_app/shared/components/appTextField.dart';
import 'package:github_app/shared/network/remote/urlLauncherHelper.dart';
import 'package:github_app/shared/styles/responsive.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  UrlLauncherHelper urlLauncherHelper = UrlLauncherHelper();

  bool first = true;
  @override
  void didChangeDependencies() {
    first = false;
    Provider.of<LoginProvider>(context, listen: false).setCtrl();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: Consumer<LoginProvider>(
      builder:(context, prov, _)=> Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, ),
        child: Column(

          children: [
            responsive.smallSizedBox(context),
            Text('Email'),
            responsive.smallSizedBox(context),
            AppTextField(
                controller: prov.emailCtrl,
                focusNode: prov.emailFocusNode,
                onFieldSubmitted: (v)=> prov.tokenFocusNode.requestFocus(),
                textInputType: TextInputType.emailAddress,
                validator: (val){
                  return val.trim().isEmpty
                      ? 'Please enter your email'
                      : null;
                },
            ),
            responsive.smallSizedBox(context),

            Text('Access Token'),
            responsive.smallSizedBox(context),
            AppTextField(
              controller: prov.tokenCtrl,
              focusNode: prov.tokenFocusNode,
              textInputType: TextInputType.emailAddress,
              validator: (val){
                return val.trim().isEmpty
                    ? 'Please enter your access token'
                    : null;
              },
            ),
            const SizedBox(height: 5,),
            Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                  onTap: () async{
                    await urlLauncherHelper.website(context, 'https://github.com/settings/tokens');
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        'How can i get token access ?', style: TextStyle(color: Colors.blue),),
                  )),
            ),
            responsive.smallSizedBox(context),
            responsive.smallSizedBox(context),

            Consumer<MainProvider>(
              builder:(context, mainProv, _)=>  AppButton(
                  content: Text('LOGIN'),
                  onPressed:() async{
                    await prov.login(context);

                  }),
            )
          ],

        ),
      ),
    )));
  }
}
