import 'package:flutter/material.dart';

// ---------- Shared colors ----------
const Color kBlue = Color(0xFF1F5FE0);
const Color kLightBlue = Color(0xFFDCE8FF);
const Color kNavy = Color(0xFF0B1B4D);
const Color kGrayText = Color(0xFF4B5563);
const Color kPageBg = Color(0xFFF1F2F5);
const Color kBorder = Color(0xFFD9DCE3);

// ---------- Main Page ----------
class ShoppingCartPage extends StatelessWidget {
  const ShoppingCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPageBg,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: kNavy),
          onPressed: () => debugPrint('Back clicked'),
        ),
        title: const Text(
          'My Cart',
          style: TextStyle(
            color: kNavy,
            fontSize: 22,
            fontWeight: FontWeight.w800,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => debugPrint('Cart clicked'),
            icon: Stack(
              clipBehavior: Clip.none,
              children: [
                const Icon(Icons.shopping_bag_outlined,
                    color: kNavy, size: 30),
                Positioned(
                  right: -6,
                  top: -6,
                  child: Container(
                    width: 18,
                    height: 18,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: kBlue,
                      shape: BoxShape.circle,
                    ),
                    child: const Text(
                      '3',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ----- Introduction -----
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: kLightBlue,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'CAMPUS STORE',
                  style: TextStyle(
                    color: kBlue,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Ready for checkout',
                style: TextStyle(
                  color: kNavy,
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Review your items before placing your order.',
                style: TextStyle(color: kGrayText, fontSize: 15),
              ),
              const SizedBox(height: 20),

              // ----- Delivery card -----
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 14),
                decoration: _cardDecoration(),
                child: Row(
                  children: [
                    const Icon(Icons.location_on, color: kBlue, size: 30),
                    const SizedBox(width: 12),
                    Container(width: 1, height: 40, color: kBorder),
                    const SizedBox(width: 14),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Deliver to Glenn Oliva',
                            style: TextStyle(
                              color: kNavy,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'Matina, Davao City',
                            style: TextStyle(color: kGrayText, fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () =>
                          debugPrint('Change delivery address clicked'),
                      child: const Text(
                        'Change',
                        style: TextStyle(
                          color: kBlue,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 22),

              // ----- Order Items heading -----
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Order Items',
                    style: TextStyle(
                      color: kNavy,
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    '3 items',
                    style: TextStyle(color: kGrayText, fontSize: 15),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // ----- Product cards (reusable widget) -----
              const CartItemCard(
                name: 'Wireless Mouse',
                price: 'PHP 450.00',
                quantity: 1,
                icon: Icons.mouse_outlined,
              ),
              const SizedBox(height: 12),
              const CartItemCard(
                name: 'USB-C Hub',
                price: 'PHP 850.00',
                quantity: 1,
                icon: Icons.usb,
              ),
              const SizedBox(height: 12),
              const CartItemCard(
                name: 'Laptop Stand',
                price: 'PHP 700.00',
                quantity: 1,
                icon: Icons.laptop_mac,
              ),
              const SizedBox(height: 16),

              // ----- Discount banner -----
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 14),
                decoration: BoxDecoration(
                  color: kLightBlue,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.local_offer_outlined,
                        color: kBlue, size: 30),
                    const SizedBox(width: 12),
                    Container(width: 1, height: 36, color: kBorder),
                    const SizedBox(width: 14),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'STUDENT10 applied',
                            style: TextStyle(
                              color: kBlue,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '10% discount on items',
                            style: TextStyle(color: kGrayText, fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.check_circle, color: kBlue, size: 32),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // ----- Payment summary -----
              Container(
                padding: const EdgeInsets.all(16),
                decoration: _cardDecoration(),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Payment Summary',
                      style: TextStyle(
                        color: kNavy,
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(height: 10),
                    SummaryRow(label: 'Subtotal', amount: 'PHP 2,000.00'),
                    SummaryRow(
                        label: 'Discount (10%)', amount: '− PHP 200.00'),
                    SummaryRow(label: 'Delivery Fee', amount: 'PHP 50.00'),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Divider(color: kBorder, thickness: 1, height: 1),
                    ),
                    SummaryRow(
                      label: 'Total',
                      amount: 'PHP 1,850.00',
                      isTotal: true,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // ----- Place Order button -----
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton.icon(
                  onPressed: () =>
                      debugPrint('Place order clicked! Total: PHP 1850.00'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kBlue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  icon: const Icon(Icons.lock, size: 24),
                  label: const Text(
                    'Place Order',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }

  static BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14),
      border: Border.all(color: kBorder),
    );
  }
}

// ---------- Reusable product card ----------
class CartItemCard extends StatelessWidget {
  final String name;
  final String price;
  final int quantity;
  final IconData icon;

  const CartItemCard({
    super.key,
    required this.name,
    required this.price,
    required this.quantity,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: kBorder),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon box
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: kLightBlue,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: kNavy, size: 42),
          ),
          const SizedBox(width: 14),

          // Name, price, quantity controls
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: kNavy,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  price,
                  style: const TextStyle(
                    color: kBlue,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    _QtyButton(
                      icon: Icons.remove,
                      onTap: () => debugPrint('Decrease quantity: $name'),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      width: 48,
                      height: 34,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: kBorder),
                      ),
                      child: Text(
                        '$quantity',
                        style: const TextStyle(
                          color: kNavy,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    _QtyButton(
                      icon: Icons.add,
                      onTap: () => debugPrint('Increase quantity: $name'),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Delete button
          IconButton(
            icon: const Icon(Icons.delete_outline, color: kGrayText),
            onPressed: () => debugPrint('Remove item: $name'),
          ),
        ],
      ),
    );
  }
}

// ---------- Small helper: plus/minus button ----------
class _QtyButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _QtyButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: 38,
        height: 34,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: kBlue, width: 1.8),
        ),
        child: Icon(icon, color: kBlue, size: 20),
      ),
    );
  }
}

// ---------- Small helper: payment summary row ----------
class SummaryRow extends StatelessWidget {
  final String label;
  final String amount;
  final bool isTotal;

  const SummaryRow({
    super.key,
    required this.label,
    required this.amount,
    this.isTotal = false,
  });

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      color: kNavy,
      fontSize: isTotal ? 22 : 16,
      fontWeight: isTotal ? FontWeight.w900 : FontWeight.normal,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: style),
          Text(amount, style: style),
        ],
      ),
    );
  }
}