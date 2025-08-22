class Subcategory {
  final String id;
  final String categoryId;
  final String name;
  final bool active;
  final int order;

  Subcategory({required this.id, required this.categoryId, required this.name, required this.active, required this.order});

  factory Subcategory.fromJson(Map<String, dynamic> j) => Subcategory(
    id: j['id'], categoryId: j['categoryId'], name: j['name'], active: j['active'] ?? true, order: j['order'] ?? 0
  );
}
