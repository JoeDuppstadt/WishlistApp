class Item {
  String pid;
  String title;
  String description;
  String brand;
  String url;
  String imageurl1;
  String imageurl2;
  String imageurl3;
  String? imageurl4;
  String? imageurl5;
  String? imageurl6;
  String? imageurl7;
  String price;

  Item({required this.pid, required this.title, required this.description, required this.brand, required this.url, required this.imageurl1, required this.imageurl2,
    required this.imageurl3, this.imageurl4, this.imageurl5, this.imageurl6, this.imageurl7, required this.price});

  Item.fromJson


}