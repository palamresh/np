import 'package:flutter/material.dart';
import 'package:np/the_tech/res/components/color.dart';
import 'package:np/the_tech/utils/service/splash_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashService service = SplashService();
  @override
  void initState() {
    service.checkAuthentication(context);

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "SpalshScreen",
                style: TextStyle(color: AppColor.blackColor, fontSize: 34),
              ),
            )
          ],
        ),
      ),
    );
  }
}
