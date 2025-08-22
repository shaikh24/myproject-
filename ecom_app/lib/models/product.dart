class Product {
  final String id;
  final String title;
  final String image;
  final int price;
  final int? salePrice;
  final String currency;
  final String categoryId;
  final String subcategoryId;
  final String brand;
  final double rating;
  final int ratingsCount;
  final int stock;
  final List<String> sizes;
  final List<String> colors;

  Product({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    this.salePrice,
    required this.currency,
    required this.categoryId,
    required this.subcategoryId,
    required this.brand,
    required this.rating,
    required this.ratingsCount,
    required this.stock,
    required this.sizes,
    required this.colors,
  });

  int get effectivePrice => salePrice ?? price;

  factory Product.fromJson(Map<String, dynamic> j) => Product(
    id: j['id'],
    title: j['title'],
    image: j['image'],
    price: j['price'],
    salePrice: j['salePrice'],
    currency: j['currency'] ?? 'PKR',
    categoryId: j['categoryId'],
    subcategoryId: j['subcategoryId'],
    brand: j['brand'] ?? 'Brand',
    rating: (j['rating'] ?? 4.5).toDouble(),
    ratingsCount: j['ratingsCount'] ?? 0,
    stock: j['stock'] ?? 0,
    sizes: (j['sizes'] as List?)?.map((e) => e.toString()).toList() ?? const [],
    colors: (j['colors'] as List?)?.map((e) => e.toString()).toList() ?? const [],
  );
}
