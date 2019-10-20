import 'dart:math';
import 'dart:ui';

class Shoes {
  final List<String> images = [
    "assets/shoes/bitmap-5.png",
    "assets/shoes/bitmap-4.png",
    "assets/shoes/bitmap-3.png",
    "assets/shoes/bitmap-2.png",
    "assets/shoes/bitmap.png"
  ]..shuffle();
  final double price = ([67.99, 85.99, 45.89]..shuffle()).first;
  final String description = "Men’s casual runner";
  final List<Color> colors = [
    Color.fromARGB(255, 57, 55, 56),
    Color.fromARGB(255, 233, 51, 69),
    Color.fromARGB(255, 144, 166, 201),
    Color.fromARGB(255, 250, 191, 110),
    Color.fromARGB(255, 5, 153, 154)
  ];
}

class ShoesSection {
  final String title =
      (["Casual", "Sporty", "Sleek", "Funky"]..shuffle()).first;
  List<Shoes> shoes = new List();

  ShoesSection(this.shoes);

  ShoesSection.generate() {
    final int min = 5;
    final int max = 80;

    final count  = min + new Random().nextInt(max - min);

    for (int i = 0; i < count; i++) {
      this.shoes.add(new Shoes());
    }
  }
}
