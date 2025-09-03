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

  Door({required this.hadeths});
}

class Book {
  final List<Door> doors;

  Book({required this.doors});
}