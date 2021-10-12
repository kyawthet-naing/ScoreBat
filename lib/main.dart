import 'package:flutter/material.dart';
import 'pages/home/home.dart';

void main() => runApp(const MYAPP());

class MYAPP extends StatelessWidget {
  const MYAPP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const MaterialApp(
        home: Home(),
        title: 'ScoreBat',
        debugShowCheckedModeBanner: false,
      );
}
