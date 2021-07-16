import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/utils/utils.dart';
import 'package:flutter_application_1/common/values/values.dart';
import 'package:flutter_application_1/common/widget/widgets.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  //密码的控制器
  final TextEditingController _passController = TextEditingController();

  // logo
  Widget _buildLogo() {
    return Container(
      width: duSetWidth(110),
      margin: EdgeInsets.only(top: duSetHeight(88)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: duSetWidth(76),
            height: duSetWidth(76),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  right: 0,
                  child: Container(
                    height: duSetWidth(76),
                    decoration: BoxDecoration(
                        color: AppColors.primaryBackground,
                        boxShadow: [
                          Shadows.primaryShadow,
                        ],
                        borderRadius: BorderRadius.all(
                            Radius.circular(duSetWidth(76 * 0.5)))),
                  ),
                ),
                Positioned(
                  top: duSetWidth(13),
                  child: Image.asset(
                    "assets/images/logo.png",
                    fit: BoxFit.none,
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: duSetHeight(15)),
            child: Text(
              'SECTOR',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.primaryText,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w600,
                fontSize: duSetFontSize(24),
                height: 1,
              ),
            ),
          ),
          Text(
            "news",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.primaryText,
              fontFamily: "Avenir",
              fontWeight: FontWeight.w400,
              fontSize: duSetFontSize(16),
              height: 1,
            ),
          ),
        ],
      ),
    );
  }

  // 登录表单
  Widget _buildInputForm() {
    return Container(
      width: duSetWidth(295),
      margin: EdgeInsets.only(top: duSetHeight(49)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          inputTextEdit(
            controller: _emailController,
            hintText: 'Email',
            marginTop: 0,
            keyboardType: TextInputType.emailAddress,
          ),
          inputTextEdit(
            controller: _passController,
            hintText: 'Password',
            marginTop: 15,
            keyboardType: TextInputType.visiblePassword,
            isPassword: true,
          ),
          Container(
            height: duSetWidth(44),
            margin: EdgeInsets.only(top: duSetHeight(15)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: btnFlatButtonWidget(
                    onPressed: () {
                      Navigator.pushNamed(context, '/sign-up');
                    },
                    title: 'Sign up',
                    gbColor: AppColors.thirdElement,
                  ),
                ),
                SizedBox(width: duSetWidth(15)),
                Expanded(
                  child: btnFlatButtonWidget(
                    onPressed: () {
                      // Navigator.pushNamed(context, '/sign-in');
                      if (!duIsEmail(_emailController.value.text)) {
                        toastInfo(msg: '请输入正确邮件地址');

                        return;
                      }
                      if (!duCheckStringLength(_passController.value.text, 6)) {
                        toastInfo(msg: '密码不能小于6位');
                        return;
                      }
                    },
                    title: 'Sign in',
                  ),
                ),
              ],
            ),
          ),
          // SizedBox(height: duSetHeight(15)),
          TextButton(
            onPressed: () {},
            child: Text(
              'Fogot password?',
              style: TextStyle(
                color: AppColors.secondaryElementText,
                fontFamily: "Avenir",
                fontWeight: FontWeight.w400,
                fontSize: duSetFontSize(16),
                height: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 第三方登录
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
          )
        ],
      ),
    );
  }

  // 注册按钮
  Widget _buildSignupButton() {
    return Container(
      width: duSetWidth(295),
      height: duSetWidth(44),
      margin: EdgeInsets.only(bottom: duSetHeight(20)),
      child: btnFlatButtonWidget(
        onPressed: () {
          Navigator.pushNamed(context, '/sign-up');
        },
        gbColor: AppColors.secondaryElement,
        fontColor: AppColors.primaryText,
        title: "Sign up",
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            _buildLogo(),
            _buildInputForm(),
            Spacer(),
            _buildThirdPartyLogin(),
            Spacer(),
            _buildSignupButton(),
          ],
        ),
      ),
    );
  }
}
