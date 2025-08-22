import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../services/data_service.dart';

class SubcategoriesPage extends StatelessWidget {
  final String categoryId;
  const SubcategoriesPage({super.key, required this.categoryId});

  @override
  Widget build(BuildContext context) {
    final ds = Provider.of<DataService>(context);
    final subs = ds.subcategories.where((s) => s.categoryId == categoryId && s.active).toList();
    return Scaffold(
      appBar: AppBar(title: const Text('Subcategories')),
      body: ListView.separated(
        itemCount: subs.length,
        separatorBuilder: (_, __) => const Divider(height: 1),
        itemBuilder: (context, i) {
          final s = subs[i];
          return ListTile(
            leading: const Icon(Icons.label),
            title: Text(s.name),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.pushNamed(context, '/product_list', arguments: s.id),
          );
        },
      ),
    );
  }
}
