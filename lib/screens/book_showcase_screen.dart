import 'package:flutter/material.dart';
import 'package:omdat_alhadeth/models/book_model.dart';
import 'package:omdat_alhadeth/screens/purchase_invoice_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_screen.dart'; // Main app screen

class BookShowcaseScreen extends StatefulWidget {
  @override
  State<BookShowcaseScreen> createState() => _BookShowcaseScreenState();
}

class _BookShowcaseScreenState extends State<BookShowcaseScreen> {
  int currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10),

            // Title
            Text(
              '📚 مجموعة كتب اسلامية',
              style: TextStyle(
                fontFamily: 'Reem Kufi',
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.teal[800],
              ),
            ),
            const SizedBox(height: 10),

            // PageView for Books
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: islamicBooks.length,
                onPageChanged: (index) {
                  setState(() => currentIndex = index);
                },
                itemBuilder: (context, index) {
                  final book = islamicBooks[index];
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Card(
                      elevation: 6,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.asset(book.image, fit: BoxFit.cover),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                Text(
                                  book.title,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  'الكاتب : ${book.author}',
                                  style: TextStyle(
                                    fontFamily: 'Reem Kufi',
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.teal[800],
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  '\$${book.price.toStringAsFixed(2)}',
                                  style: TextStyle(
                                    fontFamily: 'Reem Kufi',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.teal[700],
                                  ),
                                ),
                                const SizedBox(height: 10),
                                ElevatedButton.icon(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => PurchaseInvoiceScreen(
                                          title: book.title,
                                          author: book.author,
                                          image: book.image,
                                          price: book.price,
                                        ),
                                      ),
                                    );
                                  },
                                  icon: const Icon(Icons.shopping_cart),
                                  label: const Text('اشترِ الآن'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.teal,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            // Dots Indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                islamicBooks.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  height: 10,
                  width: currentIndex == index ? 25 : 10,
                  decoration: BoxDecoration(
                    color: currentIndex == index ? Colors.teal : Colors.grey,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Enter App Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ElevatedButton(
                onPressed: () async {
                  await _setSeenBookShowcase();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => HomeScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal[800],
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'الدخول إلى التطبيق',
                    style: TextStyle(
                      fontFamily: 'Reem Kufi',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Future<void> _setSeenBookShowcase() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('seenBookShowcase', true);
  }
}
