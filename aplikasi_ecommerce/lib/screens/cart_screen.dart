import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final List<Map<String, dynamic>> cartItems = [
    {
      'brand': 'Skintific',
      'name': 'Acne Facial Wash Saliclyid Acid',
      'price': 129000,
      'discountedPrice': 99000,
      'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8ov0PyDbBxYoYcHinAd2J_37zfwmXib4KdA&s',
      'quantity': 1,
    },
  ];

  int calculateSubtotal() {
  return cartItems.fold(0, (sum, item) {
    return sum + (item['discountedPrice'] as int) * (item['quantity'] as int);
  });
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Bag'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Product Image
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            item['imageUrl'],
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 16),

                        // Product Details
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['brand'],
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                item['name'],
                                style: const TextStyle(fontSize: 14),
                              ),
                              const SizedBox(height: 4),
                              // Text(
                              //   'Shade: ${item['shade']}',
                              //   style: const TextStyle(color: Colors.grey),
                              // ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Text(
                                    'Rp ${item['price']}',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      decoration: TextDecoration.lineThrough,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    'Rp ${item['discountedPrice']}',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        // Quantity and Actions
                        Column(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                setState(() {
                                  cartItems.removeAt(index);
                                });
                              },
                            ),
                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.remove),
                                  onPressed: () {
                                    setState(() {
                                      if (item['quantity'] > 1) {
                                        item['quantity']--;
                                      }
                                    });
                                  },
                                ),
                                Text('${item['quantity']}'),
                                IconButton(
                                  icon: const Icon(Icons.add),
                                  onPressed: () {
                                    setState(() {
                                      item['quantity']++;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // Rewards and Checkout Section
          Container(
            color: Colors.grey[100],
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Redeem Rewards Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Redeem Your Rewards'),
                    ElevatedButton(
                      onPressed: () {
                        // Handle redeem action
                      },
                      child: const Text('REDEEM NOW'),
                    ),
                  ],
                ),
                const Divider(height: 32),

                // Subtotal
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Subtotal', style: TextStyle(fontSize: 16)),
                    Text(
                      'Rp ${calculateSubtotal()}',
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Checkout Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle checkout action
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Proceeding to checkout!')),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: Colors.red,
                    ),
                    child: const Text(
                      'CHECKOUT',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
