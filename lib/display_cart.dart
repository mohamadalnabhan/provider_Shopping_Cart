import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/cart.dart';
import 'models/products.dart';

class DisplayCart extends StatefulWidget {
  const DisplayCart({super.key});

  @override
  State<DisplayCart> createState() => _DisplayCartState();
}

class _DisplayCartState extends State<DisplayCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cart content")),
      body: Consumer<Cart>(
        builder: (context, cart, child) {
          if (cart.getProdConet.isEmpty) {
            return Center(
              child: Text(
                "Your cart is empty ",
                style: TextStyle(fontSize: 18),
              ),
            );
          }

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cart.getProdConet.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Image.asset(
                        cart.getProdConet[index].Imguri,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(Icons.error);
                        },
                      ),
                      title: Text(cart.getProdConet[index].name),
                      subtitle: Text("\$${cart.getProdConet[index].price}"),
                      trailing: InkWell(
                        onTap: () {
                          cart.deletePro(cart.getProdConet[index]);
                        },
                        child: Icon(Icons.remove_circle),
                      ),
                    );
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                color: Colors.grey[200],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total:",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "\$${cart.totalPrice.toStringAsFixed(2)}",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
