import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../services/data_service.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ds = Provider.of<DataService>(context);
    final cats = ds.categories.where((c) => c.active).toList();
    return Scaffold(
      appBar: AppBar(title: const Text('Categories')),
      body: ListView.separated(
        itemCount: cats.length,
        separatorBuilder: (_, __) => const Divider(height: 1),
        itemBuilder: (context, i) {
          final c = cats[i];
          return ListTile(
            leading: const Icon(Icons.category),
            title: Text(c.name),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.pushNamed(context, '/subcategories', arguments: c.id),
          );
        },
      ),
    );
  }
}
