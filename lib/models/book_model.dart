class IslamicBook {
  final String title;
  final String author;
  final String image;
  final double price;

  IslamicBook({
    required this.title,
    required this.author,
    required this.image,
    required this.price,
  });
}

final List<IslamicBook> islamicBooks = [
  IslamicBook(
    title: 'رسائل من القران',
    author: 'ادهم الشرقاوي',
    image: 'assets/images/msegsfromquran.png',
    price: 15.99,
  ),
  IslamicBook(
    title: 'رسائل من النبي',
    author: 'ادهم الشرقاوي',
    image: 'assets/images/dark_background_image.png',
    price: 19.50,
  ),
  IslamicBook(
    title: 'رسائل من الصحابة',
    author: 'ادهم الشرقاوي',
    image: 'assets/images/dark_background_image.png',
    price: 8.99,
  ),
];
