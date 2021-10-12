import '/api/api.dart';
import '/utils/const.dart';
import 'widgets/football_card.dart';
import '/model/football_model.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(matchName),
      ),
      body: FutureBuilder<List<FootBallModel>>(
        future: Api.getFootballMatch(),
        builder: (context, AsyncSnapshot<List<FootBallModel>> snapshot) {
          if (snapshot.hasData) {
            List<FootBallModel> matchList = snapshot.data!;

            return ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(10),
                itemCount: matchList.length,
                itemBuilder: (context, index) =>
                    FootBallCard(footBallModel: matchList[index]));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
