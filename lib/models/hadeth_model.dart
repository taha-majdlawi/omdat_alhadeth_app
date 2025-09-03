class Hadeth {
  final String hadethText;
  final int hadethNumber;
  final String soundUrl;
  final String explainUrl;

  Hadeth({
    required this.hadethText,
    required this.hadethNumber,
    required this.soundUrl,
    required this.explainUrl,
  });
}

class Door {
  final List<Hadeth> hadeths;
  final String doorName;
  Door({required this.hadeths, required this.doorName});
}

class Book {
  final List<Door> doors;
  final String bookName;
  Book({required this.doors, required this.bookName});
}
