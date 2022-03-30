
/**
 * 豆瓣api关闭了，只能模拟json假数据
 * */
class MovieItem {
  String? rank;
  String? imageUrl;
  String? title;
  String? playDate;
  double? rating;
  String? subTitle;
  String? desc;

  MovieItem.fromMap(Map<String, dynamic> json) {
    this.rank = json["rank"];
    this.imageUrl = json["imageUrl"];
    this.title = json["title"];
    this.playDate = json["playDate"];
    this.rating = json["rating"];
    this.subTitle = json["subTitle"];
    this.desc = json["desc"];
  }

  @override
  String toString() {
    return 'MovieItem{rank: $rank, title: $title, imageUrl: $imageUrl, playDate: $playDate, rating: $rating}';
  }
}

