class ShoeList {
  final String name;
  final double price;
  final String image;
  final String des;

  ShoeList({
    required this.name,
    required this.price,
    required this.image,
    required this.des,
  });

  factory ShoeList.fromMap(Map<String, dynamic> map) {
    return ShoeList(
        name: map['name'],
        price: double.tryParse(map['price']) ?? 0.0,
        image: map['image'],
        des: map['des']);
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price.toString(),
      'image': image,
      'des': des
    };
  }
}
