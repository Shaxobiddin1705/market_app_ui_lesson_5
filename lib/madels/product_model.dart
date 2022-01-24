class Product{
  String name;
  String type;
  double cost;
  String image;
  bool isLike = false;
  String category;

  Product({required this.name, required this.type, required this.cost, required this.image, required this.category});

  @override
  String toString() {
    // TODO: implement toString
    return category.toString();
  }

}