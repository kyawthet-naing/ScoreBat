class FootBallModel {
  String? title, date, competitionName, competitionUrl, thumb;
  List<VidModel>? videoList;

  FootBallModel(
      {this.title,
      this.date,
      this.competitionName,
      this.competitionUrl,
      this.thumb,
      this.videoList});

  FootBallModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> vList = json['videos'];
    List<VidModel> vModelList = vList.map((e) => VidModel.fromJson(e)).toList();

    title = json['title'];
    date = json['date'];
    competitionName = json['competition'];
    competitionUrl = json['competitionUrl'];
    thumb = json['thumbnail'];
    videoList = vModelList;
  }
}

class VidModel {
  String? vidTitle, emb;

  VidModel({this.vidTitle, this.emb});

  VidModel.fromJson(Map<String, dynamic> data) {
    vidTitle = data['title'];
    emb = data['embed'];
  }
}
