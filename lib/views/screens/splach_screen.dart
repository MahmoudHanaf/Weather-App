import 'package:flutter/material.dart';

import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart';
import 'package:weather_app/services/config_service.dart';
import 'package:weather_app/views/screens/Home.dart';
import 'package:weather_app/views/screens/login_screen.dart';

class SplachScreen extends StatefulWidget {
  const SplachScreen({Key? key}) : super(key: key);

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  @override
  void initState() {
    Future.delayed(
      Duration(seconds: 2),
      () => init(),
    );
    super.initState();
  }

  void init() {
    if (ConfigurationService.prefs?.getString('email') != null) {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (_) => HomeScreen()), (route) => false);
    } else {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (_) => LoginScreen()), (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/weather.png',
              height: 180,
              width: 180,
            ),
            const SizedBox(
              height: 20,
            ),
            CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
