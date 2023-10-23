class DataFilm {
  String? id;
  String? title;
  String? slug;
  String? description;
  String? content;
  String? videoUrl;
  String? thumbnail;
  String? thumbnailMobile;
  String? category;
  String? director;
  String? actor;
  String? language;
  String? startTime;
  String? endTime;
  int? heartTotal;
  int? price;
  String? status;
  String? createdAt;

  DataFilm(
      {this.id,
      this.title,
      this.slug,
      this.description,
      this.content,
      this.videoUrl,
      this.thumbnail,
      this.thumbnailMobile,
      this.category,
      this.director,
      this.actor,
      this.language,
      this.startTime,
      this.endTime,
      this.heartTotal,
      this.price,
      this.status,
      this.createdAt});

  DataFilm.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    content = json['content'];
    videoUrl = json['videoUrl'];
    thumbnail = json['thumbnail'];
    thumbnailMobile = json['thumbnailMobile'];
    category = json['category'];
    director = json['director'];
    actor = json['actor'];
    language = json['language'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    heartTotal = json['heartTotal'];
    price = json['price'];
    status = json['status'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['description'] = this.description;
    data['content'] = this.content;
    data['videoUrl'] = this.videoUrl;
    data['thumbnail'] = this.thumbnail;
    data['thumbnailMobile'] = this.thumbnailMobile;
    data['category'] = this.category;
    data['director'] = this.director;
    data['actor'] = this.actor;
    data['language'] = this.language;
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    data['heartTotal'] = this.heartTotal;
    data['price'] = this.price;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    return data;
  }
}
