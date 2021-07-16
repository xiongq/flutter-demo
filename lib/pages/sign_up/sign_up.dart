import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/utils/utils.dart';
import 'package:flutter_application_1/common/values/values.dart';
import 'package:flutter_application_1/common/widget/widgets.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  Widget _buildLogo() {
    return Container(
      margin: EdgeInsets.only(top: duSetWidth(50)),
      child: Text(
        'Sign up',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.primaryText,
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w600,
          fontSize: duSetFontSize(24),
          height: 1,
        ),
      ),
    );
  }

  Widget _buildInputForm() {
    return Container(
      width: duSetWidth(295),
      margin: EdgeInsets.only(top: duSetWidth(45)),
      child: Column(
        children: [
          inputTextEdit(
            controller: _fullnameController,
            hintText: 'Full name',
            marginTop: 0,
            keyboardType: TextInputType.name,
          ),
          inputTextEdit(
            controller: _emailController,
            hintText: 'Email',
            keyboardType: TextInputType.emailAddress,
          ),
          inputTextEdit(
            controller: _passController,
            hintText: 'Password',
            keyboardType: TextInputType.visiblePassword,
            isPassword: true,
          ),
          Container(
            width: duSetWidth(295),
            height: 44,
            margin: EdgeInsets.only(top: duSetWidth(15)),
            child: btnFlatButtonWidget(
              onPressed: () {
                if (!duCheckStringLength(_fullnameController.value.text, 5)) {
                  toastInfo(msg: '用户名不能小于5位');
                  return;
                }
                if (!duIsEmail(_emailController.value.text)) {
                  toastInfo(msg: '请正确输入邮件');
                  return;
                }
                if (!duCheckStringLength(_passController.value.text, 6)) {
                  toastInfo(msg: '密码不能小于6位');
                  return;
                }
                Navigator.pop(context);
              },
              title: 'Create an account',
              fontWeight: FontWeight.w600,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: duSetWidth(20)),
            padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'By signing up you agree to our',
                    style: TextStyle(
                      color: AppColors.primaryText,
                      fontFamily: "Avenir",
                      fontWeight: FontWeight.w400,
                      fontSize: duSetFontSize(16),
                      height: 1.2,
                    ),
                  ),
                  TextSpan(
                    text: ' Terms ',
                    style: TextStyle(
                      color: AppColors.primaryElement,
                      fontFamily: "Avenir",
                      fontWeight: FontWeight.w400,
                      fontSize: duSetFontSize(16),
                      height: 1.2,
                    ),
                  ),
                  TextSpan(
                    text: 'and',
                    style: TextStyle(
                      color: AppColors.primaryText,
                      fontFamily: "Avenir",
                      fontWeight: FontWeight.w400,
                      fontSize: duSetFontSize(16),
                      height: 1,
                    ),
                  ),
                  TextSpan(
                    text: ' Conditions of Use',
                    style: TextStyle(
                      color: AppColors.primaryElement,
                      fontFamily: "Avenir",
                      fontWeight: FontWeight.w400,
                      fontSize: duSetFontSize(16),
                      height: 1,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildThirdPartyLogin() {
    return Container(
      width: duSetWidth(295),
      // margin: EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          // title
          Text(
            "Or sign in with social networks",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.primaryText,
              fontFamily: "Avenir",
              fontWeight: FontWeight.w400,
              fontSize: duSetFontSize(16),
            ),
          ),
          SizedBox(height: duSetHeight(15)),
          Container(
            height: duSetWidth(44),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: btnImageButtonWidget(
                    onPressed: () {},
                    iconFileName: 'twitter',
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: btnImageButtonWidget(
                    onPressed: () {},
                    iconFileName: 'google',
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: btnImageButtonWidget(
                    onPressed: () {},
                    iconFileName: 'facebook',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHaveAccountButton() {
    return Container(
      width: duSetWidth(295),
      height: duSetWidth(44),
      margin: EdgeInsets.only(top: duSetHeight(40)),
      child: btnFlatButtonWidget(
        onPressed: () {
          Navigator.pop(context);
        },
        gbColor: AppColors.secondaryElement,
        fontColor: AppColors.primaryText,
        title: "I have an account",
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: taransparentAppBar(
        context: context,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.info_outline,
              color: AppColors.primaryText,
            ),
            onPressed: () {
              toastInfo(msg: '这是注册界面');
            },
          )
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Divider(height: 1),
              _buildLogo(),
              _buildInputForm(),
              Spacer(),
              _buildThirdPartyLogin(),
              _buildHaveAccountButton(),
            ],
          ),
        ),
      ),
    );
  }
}
