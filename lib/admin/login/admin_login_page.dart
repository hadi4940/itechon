import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:itechone/admin/events/admin_event_page.dart';
import 'package:itechone/components/drawer.dart';
import 'package:itechone/components/footer.dart';
import 'package:itechone/components/navbar.dart';
import 'package:itechone/constants/constants.dart';
import 'package:itechone/responsive/responsive_widget.dart';
import 'package:itechone/services/auth/firebase_auth.dart';
import 'package:itechone/widgets/custom_textfield.dart';
import 'package:itechone/widgets/main_button.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class AdminLoginPage extends StatefulWidget {
  static const String route = '/admin_login';

  const AdminLoginPage({
    super.key,
  });

  @override
  State<AdminLoginPage> createState() => _AdminLoginPageState();
}

class _AdminLoginPageState extends State<AdminLoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isLoading = false;
  void _loginUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await FirebaseAuthMethods().loginUser(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
    if (res == 'success') {
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, AdminEventsPage.route);
    } else {
      Fluttertoast.showToast(msg: res, timeInSecForIosWeb: 3);
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: !ResponsiveWidget.isLargeScreen(context)
          ? AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              iconTheme: const IconThemeData(color: Colors.white),
            )
          : null,
      drawer: !ResponsiveWidget.isLargeScreen(context)
          ? const DrawerForMobile()
          : null,
      body: ResponsiveWidget(
        largeScreen: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset(
                    "assets/images/admin_banner.png",
                    fit: BoxFit.cover,
                    height: screenHeight * 0.85,
                    width: screenWidth,
                  ),
                  const NavBar(
                    color: Color(0x600E356B),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: 35,
                    horizontal: screenWidth > 714
                        ? screenWidth * 0.3
                        : screenWidth * 0.1),
                child: Column(
                  children: [
                    const Text(
                      "Admin Login",
                      style: kMainHeadingStyle,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 35,
                      ),
                      decoration: BoxDecoration(
                        boxShadow: const [kBoxShadow],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          CustomTextField(
                            hintText: "Email address",
                            textEditingController: emailController,
                            isRichInput: false,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextField(
                            hintText: "Password",
                            textEditingController: passwordController,
                            isRichInput: false,
                            obscureText: true,
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: TextButton(
                                onPressed: () {
                                  Fluttertoast.showToast(
                                      msg:
                                          "Change from firebase console directly");
                                },
                                child: const Text("Forget Password")),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          _isLoading
                              ? Center(
                                  child:
                                      LoadingAnimationWidget.staggeredDotsWave(
                                    color: kPrimaryColor,
                                    size: 38,
                                  ),
                                )
                              : SizedBox(
                                  width: double.infinity,
                                  child: MainButton(
                                    text: "LOGIN",
                                    onPress: _loginUser,
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Footer()
            ],
          ),
        ),
      ),
    );
  }
}
