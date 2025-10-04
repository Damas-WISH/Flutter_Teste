class Product {
final int id;
final String name;
final double price;


Product({required this.id, required this.name, required this.price});


factory Product.fromMap(Map<String, dynamic> map) => Product(
id: map['id'] as int,
name: map['name'] ?? '—',
price: (map['price'] as num).toDouble(),
);


Map<String, dynamic> toMap() => {
'id': id,
'name': name,
'price': price,
};
}