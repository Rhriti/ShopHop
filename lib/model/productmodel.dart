class Product {
  final String id;
  String title;
  String description;
  double price;
  String imageUrl;
  bool isfav;

  Product({required this.id,required this.title,required this.description,required this.price,required this.imageUrl,this.isfav=false});
}
