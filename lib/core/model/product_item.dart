class ProductItem {
  final String imagePath;
  final String productName;
  final String price;
  final String rating;
  final String category;
  final bool isFavorite;

  ProductItem({
    required this.imagePath,
    required this.productName,
    required this.price,
    required this.rating,
    required this.category,
    this.isFavorite = false,
  });
}