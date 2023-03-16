import 'package:ar_edu/constants%20/constants.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
   ///initTimer();
  }

  void initTimer() async {
    ///if internet conn is true open app else load
    if (await checkInternetConn()) {
      Future.delayed(const Duration(seconds: 5), () {
        Navigator.pushReplacementNamed(context, '/onBoarding');
      });
    }
  }

  ///connection check
  Future<bool> checkInternetConn() async {
    var connResult = await (Connectivity().checkConnectivity());

    ///wifi or mobile conn check
    if (connResult == ConnectivityResult.mobile ||
        connResult == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }

  ///show dialog
  showDialogBox() => showDialog<String>(
    context: context,
    builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text("Ooops No Connection!"),
        content: const Text(
            'Please make sure you have a valid internet connection through your WIFI'
                'or cellular network.'),
        actions: <Widget>[
          TextButton(onPressed: () {}, child: const Text("Ok"))
        ]),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundPrimary,
        body: FutureBuilder(builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          future: checkInternetConn();

          ///check network status
          if (snapshot.connectionState == ConnectionState.waiting) {
            return splashIcon();
          } else if (snapshot.hasError) {
            return showDialogBox();
          } else {
            if(snapshot.data == true){
              return showDialogBox();
            } else{
              initTimer();
            }
            return splashIcon();
          }
        }),
      ),
    );
  }

  Widget splashIcon() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/icon.png',
            width: 210.0,
          ),
        ],
      ),
    );
  }
}

