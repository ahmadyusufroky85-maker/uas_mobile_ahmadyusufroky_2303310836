class Product {
  final int id;
  final String name;
  final double price;
  final String description;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
  });
}

// Data dummy untuk simulasi (karena tidak ada API produk)
List<Product> dummyProducts = [
  Product(
    id: 1,
    name: 'Kemeja Flanel',
    price: 175000,
    description: 'Nyaman dan stylish.',
  ),
  Product(
    id: 2,
    name: 'Kaos Polos Premium',
    price: 95000,
    description: 'Bahan katun adem.',
  ),
  Product(
    id: 3,
    name: 'Celana Chino',
    price: 190000,
    description: 'Cocok untuk kasual dan formal.',
  ),
  Product(
    id: 4,
    name: 'Jam Tangan Sport',
    price: 250000,
    description: 'Water resistant (Tidak akan muncul di Home).',
  ),
  Product(
    id: 5,
    name: 'Tas Ransel Mini',
    price: 150000,
    description: 'Kompak untuk harian.',
  ),
  Product(
    id: 6,
    name: 'Sepatu Sneakers',
    price: 350000,
    description: 'Lari pagi makin semangat (Tidak akan muncul di Home).',
  ),
  Product(
    id: 7,
    name: 'Topi Baseball',
    price: 80000,
    description: 'Aksesori pelengkap gaya.',
  ),
];
