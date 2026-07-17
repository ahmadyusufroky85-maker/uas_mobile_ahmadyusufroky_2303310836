import 'package:flutter/material.dart';
import 'models/product_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Logika Filter: Ambil produk dengan harga < 200rb, lalu ambil maksimal 5 item
    final filteredProducts = dummyProducts
        .where((product) => product.price < 200000)
        .take(5)
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home (Produk < 200rb)"),
        backgroundColor: Colors.blueAccent,
      ),
      body: filteredProducts.isEmpty
          ? const Center(child: Text("Tidak ada produk di bawah 200rb."))
          : ListView.separated(
              padding: const EdgeInsets.all(10),
              itemCount: filteredProducts.length,
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                final product = filteredProducts[index];
                return Card(
                  elevation: 3,
                  child: ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: Colors.blueAccent,
                      child: Icon(Icons.shopping_bag, color: Colors.white),
                    ),
                    title: Text(
                      product.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(product.description),
                    trailing: Text(
                      "Rp ${product.price.toStringAsFixed(0)}",
                      style: const TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
