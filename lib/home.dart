import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart_provider/models/cart.dart';
import 'package:shopping_cart_provider/models/products.dart';
import 'display_cart.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Products> products = [
    Products(
      id: "1",
      name: "shoes 1",
      price: 50,
      Imguri: "assets/shoes1.jpg",
    ),
    Products(
      id: "2",
      name: "shoes 2",
      price: 40,
      Imguri: "assets/shoes2.jpg",
    ),
    Products(
      id: "3",
      name: "shoes 3",
      price: 70,
      Imguri: "assets/shoes3.jpg",
    ),
    Products(
      id: "4",
      name: "shoes 4",
      price: 65,
      Imguri: "assets/shoes4.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Colors.white54,
        actions: <Widget>[
          Row(
            children: [
              IconButton(onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DisplayCart()));
              }, icon: Icon(Icons.shopping_cart)),
              Padding(
                padding: EdgeInsets.only(right: 7),
                child: Consumer<Cart>(
                  builder: (context, cart, child) {
                    return Text("${cart.prodCount}");
                  },
                ),
              ),
            ],
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Card(
            child: Consumer<Cart>(
              builder: (context, cart, child) {
                return ListTile(
                  leading: Image.asset(
                    "${products[index].Imguri}",
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(Icons.error);
                    },
                  ),
                  title: Text("${products[index].name}"),
                  subtitle: Text("\$${products[index].price}"),
                  trailing: InkWell(
                    onTap: () {
                 
                      cart.addProd(products[index]);
                    },
                    child: Icon(Icons.add),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
