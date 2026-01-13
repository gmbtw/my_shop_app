import 'package:flutter/material.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final List<String> allProducts = [
    'Ноутбук',
    'Смартфон',
    'Наушники',
    'Клавиатура',
    'Мышь',
    'Монитор',
    'Принтер',
    'Фотоаппарат',
    'Колонка',
    'Чехол',
  ];

  List<String> displayedProducts = [];
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    displayedProducts = List.from(allProducts);
  }

  void _filterProducts(String query) {
    setState(() {
      searchQuery = query;
      displayedProducts = allProducts
          .where((product) => product.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Товары'),
        backgroundColor: Colors.deepOrange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Поиск товаров',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: _filterProducts,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: displayedProducts.isEmpty
                  ? const Center(child: Text('Ничего не найдено'))
                  : ListView.builder(
                itemCount: displayedProducts.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(displayedProducts[index]),
                      trailing: const Icon(Icons.shopping_cart),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
