import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '/model/football_model.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart' as url;

class Detail extends StatelessWidget {
  final FootBallModel footBallModel;

  const Detail({Key? key, required this.footBallModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${footBallModel.title}'),
        centerTitle: true,
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(10),
          physics: const BouncingScrollPhysics(),
          itemCount: footBallModel.videoList!.length,
          itemBuilder: (context, index) => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                      alignment: Alignment.center,
                      child: Html(
                        data: footBallModel.videoList![index].emb,
                        shrinkWrap: true,
                      )),
                  const SizedBox(height: 5),
                  Text('${footBallModel.competitionName}'),
                  const SizedBox(height: 5),
                  RichText(
                      text: TextSpan(
                          style: const TextStyle(color: Colors.black),
                          text: '${footBallModel.videoList![index].vidTitle}  ',
                          children: [
                        TextSpan(
                          text: 'Read More',
                          style: const TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {
                              String link = '${footBallModel.competitionUrl}';
                              if (await url.canLaunch(link)) {
                                url.launch(link);
                              } else {
                                throw ('Can\'t launch this url.');
                              }
                            },
                        )
                      ])),
                  const SizedBox(height: 10),
                ],
              )),
    );
  }
}
