class NewsData {
  final String claim;
  final String title;
  final String url;
  final String score;

  NewsData(
      {required this.claim,
      required this.title,
      required this.url,
      required this.score});

  factory NewsData.fromJson(Map<String, dynamic> json) {
    return NewsData(
      claim: (json['text'] ?? "").replaceAll(RegExp(r'\n+'), '\n'),
      title: (json['claimReview'][0]['title'] ?? "")
          .replaceAll(RegExp(r'\n+'), '\n'),
      url: (json['claimReview'][0]['url'] ?? "")
          .replaceAll(RegExp(r'\n+'), '\n'),
      score: (json['claimReview'][0]['textualRating'] ?? "")
          .replaceAll(RegExp(r'\n+'), '\n'),
    );
  }
}
