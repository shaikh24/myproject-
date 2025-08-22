class Category {
  final String id;
  final String name;
  final String icon;
  final bool active;
  final int order;

  Category({required this.id, required this.name, required this.icon, required this.active, required this.order});

  factory Category.fromJson(Map<String, dynamic> j) => Category(
    id: j['id'], name: j['name'], icon: j['icon'] ?? 'category', active: j['active'] ?? true, order: j['order'] ?? 0
  );
}
