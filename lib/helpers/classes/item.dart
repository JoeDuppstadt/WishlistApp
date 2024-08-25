class Item {
  final String pid;
  final String title;
  final String description;
  final String brand;
  final String url;
  final String imageurl1;
  final String imageurl2;
  final String imageurl3;
  final String? imageurl4;
  final String? imageurl5;
  final String? imageurl6;
  final String? imageurl7;
  final String price;
  final String? contentRating;

  Item(
        this.pid,
        this.title,
        this.description,
        this.brand,
        this.url,
        this.imageurl1,
        this.imageurl2,
        this.imageurl3,
        this.imageurl4,
        this.imageurl5,
        this.imageurl6,
        this.imageurl7,
        this.price,
        this.contentRating
      );

  Item.fromJson(Map<String, dynamic> json)
      : pid = json['pid'] as String,
        title = json['title'] as String,
        description = json['description'] as String,
        brand = json['brand'] as String,
        url = json['url'] as String,
        imageurl1 = json['imageurl1'] as String,
        imageurl2 = json['imageurl2'] as String,
        imageurl3 = json['imageurl3'] as String,
        imageurl4 = json['imageurl4'] as String,
        imageurl5 = json['imageurl5'] as String,
        imageurl6 = json['imageurl6'] as String,
        imageurl7 = json['imageurl7'] as String,
        price = json['price'] as String,
        contentRating = json['contentRating'] as String;

    Map<String, dynamic> toJson() => {
      'pid': pid,
      'title': title,
      'description': description,
      'brand': brand,
      'url': url,
      'imageurl1': imageurl1,
      'imageurl2': imageurl2,
      'imageurl3': imageurl3,
      'imageurl4': imageurl4,
      'imageurl5': imageurl5,
      'imageurl6': imageurl6,
      'imageurl7': imageurl7,
      'price': price,
      'contentRating': contentRating
    };
}