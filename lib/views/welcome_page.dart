import 'package:flutter/material.dart';

import 'mockito_example.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text('Muslimov Dinmukhammed',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black38,
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold)),
          ),
          Image.asset(
            'assets/images/welcome.jpg',
            width: MediaQuery.of(context).size.width,
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text('Примерное приложения для демонстрации',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text('"Testing Mobile apps"',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.blue[500],
                    fontSize: 24,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: TextButton(
                key: const Key('GoToMockito'),
                onPressed: () {
                  Navigator.pushAndRemoveUntil<dynamic>(
                      context,
                      MaterialPageRoute<dynamic>(
                        builder: (BuildContext context) => MockitoExamplePage(),
                      ),
                      (route) => false);
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => WelcomePage()));
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 10),
                  child: Text('Погнали!', style: TextStyle(fontSize: 18)),
                ),
                style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.blue[500],
                    elevation: 5)),
          )
        ],
      ),
    );
  }
}
