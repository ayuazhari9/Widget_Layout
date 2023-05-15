import 'package:flutter/material.dart';

void main() => runApp(SalesApp());

class SalesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sales App',
      theme: ThemeData(
        primarySwatch: Colors.red,
        fontFamily: 'Montserrat',
      ),
      home: SalesPage(),
    );
  }
}

class SalesPage extends StatefulWidget {
  @override
  _SalesPageState createState() => _SalesPageState();
}

class _SalesPageState extends State<SalesPage> {
  List<Product> products = [
    Product('Kemeja H&M', 310.000),
    Product('Celana Jeans', 195.000),
    Product('Totebag', 85.000),
    Product('Sepatu nice', 350.000),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sales App'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Card(
            color: Color.fromARGB(255, 255, 162, 0),
            elevation: 2.0,
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              title: Text(
                products[index].name,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                '\$${products[index].price.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 16.0),
              ),
              trailing: IconButton(
                icon: Icon(Icons.add_shopping_cart),
                color: Colors.blue,
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Added to Cart'),
                        content: Text('Product ${products[index].name} added to cart.'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class Product {
  final String name;
  final double price;

  Product(this.name, this.price);
}