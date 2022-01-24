import 'package:flutter/material.dart';
import 'package:testing_application_example/models/album.dart';
import 'package:testing_application_example/services/api_provider.dart';
import 'package:http/http.dart' as http;

import 'integration_test_example.dart';

class MockitoExamplePage extends StatefulWidget {
  const MockitoExamplePage({Key? key}) : super(key: key);

  @override
  _MockitoExamplePageState createState() => _MockitoExamplePageState();
}

class _MockitoExamplePageState extends State<MockitoExamplePage> {
  late final Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = ApiProvider().fetchAlbum(http.Client());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: const Text('Пример Fetch Data'),
        ),
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.65,
              child: Center(
                child: FutureBuilder<Album>(
                  future: futureAlbum,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(
                        'Title: ' + snapshot.data!.title,
                        style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black87,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold),
                      );
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }

                    // By default, show a loading spinner.
                    return const CircularProgressIndicator();
                  },
                ),
              ),
            ),
            SizedBox(
                child: Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: TextButton(
                  key: const Key('GoToIntegration'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                IntegrationTestExamplePage()));
                  },
                  child: const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 40.0, vertical: 10),
                    child: Text('Идем дальше!', style: TextStyle(fontSize: 18)),
                  ),
                  style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Colors.blue[500],
                      elevation: 5)),
            ))
          ],
        ),
      ),
    );
  }
}
