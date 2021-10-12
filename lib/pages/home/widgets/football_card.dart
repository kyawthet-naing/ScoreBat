import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '/model/football_model.dart';
import '/pages/detail/detail.dart';

class FootBallCard extends StatelessWidget {
  final FootBallModel footBallModel;

  const FootBallCard({Key? key, required this.footBallModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Detail(footBallModel: footBallModel))),
      child: Container(
        padding: const EdgeInsets.only(bottom: 10),
        margin: const EdgeInsets.only(bottom: 10),
        clipBehavior: Clip.antiAlias,
        height: 200,
        decoration: BoxDecoration(
            color: Colors.indigo, borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: '${footBallModel.thumb}',
                placeholder: (_, __) => const Center(
                  child: SizedBox(
                    width: 40,
                    height: 40,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  ),
                ),
                errorWidget: (_, __, ___) =>
                    const Icon(Icons.error, color: Colors.redAccent),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const SizedBox(width: 10),
                Text(
                  '${footBallModel.title}',
                  style: const TextStyle(color: Colors.white),
                ),
                const Spacer(),
                Text(footBallModel.date!.split('T')[0],
                    style: const TextStyle(color: Colors.white)),
                const SizedBox(width: 10),
              ],
            )
          ],
        ),
      ),
    );
  }
}
