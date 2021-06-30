import 'package:youtube_clone_app2/src/models/video.dart';

class YoutubeVideoResult {
  int totalResults;
  int resultPerPage;
  String nextPageToken;
  List<Video> items;

  YoutubeVideoResult(
      {this.totalResults, this.resultPerPage, this.nextPageToken, this.items});

  factory YoutubeVideoResult.fromJson(Map<String, dynamic> json) =>
      YoutubeVideoResult(
        totalResults: json['pageInfo']['totalResults'],
        resultPerPage: json['pageInfo']['resultsPerPage'],
        nextPageToken: json['nextPageToken'] ?? "",
        items: List<Video>.from(json['items'].map((data)=>Video.fromJson(data))) //맵 돌멶서 파싱
      );
}
