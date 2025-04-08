import 'package:flutter/material.dart';
import 'package:shopping_cart_provider/models/products.dart';

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
      Imguri: "assets/images/shoes1.jpg",
    ),
    Products(
      id: "2",
      name: "shoes 2",
      price: 40,
      Imguri: "assets/images/shoes2.jpg",
    ),
    Products(
      id: "3",
      name: "shoes 3",
      price: 70,
      Imguri: "assets/images/shoes3.jpg",
    ),
    Products(
      id: "4",
      name: "shoes 4",
      price: 65,
      Imguri: "assets/images/shoes4.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Colors.white54,
        actions: <Widget>[Icon(Icons.shopping_cart)], 
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
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
              trailing: Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }
}
