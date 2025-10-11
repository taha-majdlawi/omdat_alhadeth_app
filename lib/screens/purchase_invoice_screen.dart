import 'package:flutter/material.dart';

class PurchaseInvoiceScreen extends StatefulWidget {
  final String title;
  final String author;
  final String image;
  final double price;

  const PurchaseInvoiceScreen({
    super.key,
    required this.title,
    required this.author,
    required this.image,
    required this.price,
  });

  @override
  State<PurchaseInvoiceScreen> createState() => _PurchaseInvoiceScreenState();
}

class _PurchaseInvoiceScreenState extends State<PurchaseInvoiceScreen> {
  bool isPDF = true;
  bool useCoupon = false;
  double discount = 0.0;

  @override
  Widget build(BuildContext context) {
    double totalPrice = widget.price;
    if (useCoupon) totalPrice *= 0.9; // 10% discount

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'فاتورة الشراء',
          style: TextStyle(fontFamily: 'Reem Kufi'),
        ),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Book Card
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                    child: Image.asset(
                      widget.image,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'المؤلف: ${widget.author}',
                          style: const TextStyle(
                            fontFamily: 'Reem Kufi',
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'السعر: \$${widget.price.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontFamily: 'Reem Kufi',
                            fontSize: 18,
                            color: Colors.teal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Type Selection
            Container(
              decoration: BoxDecoration(
                color: Colors.teal.withOpacity(0.05),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  const Text(
                    'اختر طريقة الشراء:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Reem Kufi',
                    ),
                  ),
                  const SizedBox(height: 8),
                  RadioListTile<bool>(
                    title: const Text(
                      style: TextStyle(fontFamily: 'Reem Kufi'),
                      '📄 نسخة إلكترونية (PDF)',
                      textAlign: TextAlign.right,
                    ),
                    value: true,
                    groupValue: isPDF,
                    onChanged: (value) => setState(() => isPDF = value!),
                  ),
                  RadioListTile<bool>(
                    title: const Text(
                      style: TextStyle(fontFamily: 'Reem Kufi'),
                      '📘 نسخة ورقية',
                      textAlign: TextAlign.right,
                    ),
                    value: false,
                    groupValue: isPDF,
                    onChanged: (value) => setState(() => isPDF = value!),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Coupon Section
            Container(
              decoration: BoxDecoration(
                color: Colors.orange.withOpacity(0.05),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CheckboxListTile(
                    title: const Text(
                      textAlign: TextAlign.right,
                      'استخدام كوبون خصم 10٪',
                      style: TextStyle(fontFamily: 'Reem Kufi'),
                    ),
                    value: useCoupon,
                    activeColor: Colors.teal,
                    onChanged: (val) => setState(() => useCoupon = val!),
                  ),
                  if (useCoupon)
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        textAlign: TextAlign.right,
                        'تم تطبيق الخصم بنجاح 🎉',
                        style: TextStyle(
                          color: Colors.teal,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Reem Kufi',
                        ),
                      ),
                    ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Invoice Summary
            Card(
              color: Colors.teal.shade50,
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${totalPrice.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          'اجمالي السعر',
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Reem Kufi',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          isPDF ? 'دفع إلكتروني (PDF)' : 'توصيل ودفع نقدي',
                          style: const TextStyle(
                            fontSize: 16,
                            fontFamily: 'Reem Kufi',
                          ),
                        ),
                        const Text(
                          "طريقة الدفع",
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Reem Kufi',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Confirm Button
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              icon: const Icon(Icons.check_circle_outline, color: Colors.white),
              label: const Text(
                'تأكيد الشراء',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontFamily: 'Reem Kufi',
                ),
              ),
              onPressed: () {
                // Here you can integrate your payment/store link
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Book purchase link coming soon!')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
