import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart%20';

class CarTypesScreen extends StatelessWidget {
  final List<CarType> carTypes = [
    CarType(
      name: 'Sports Car',
      imageUrl: 'https://example.com/.........',
      description: 'A fast and stylish sports car.',
      price: '\$60,000',
    ),
    CarType(
      name: 'SUV',
      imageUrl: 'https://example.com/.........',
      description: 'A spacious and comfortable SUV.',
      price: '\$50,000',
    ),
    CarType(
      name: 'Sedan',
      imageUrl: 'https://example.com/.........',
      description: 'A sleek and efficient sedan.',
      price: '\$40,000',
    ),
    CarType(
      name: 'Convertible',
      imageUrl: 'https://example.com/.........',
      description: 'A fun and stylish convertible.',
      price: '\$70,000',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Types of Cars'),
      ),
      body: ListView.builder(
        itemCount: carTypes.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              contentPadding: EdgeInsets.all(10.0),
              leading: Image.network(
                carTypes[index].imageUrl,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
              title: Text(
                carTypes[index].name,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    carTypes[index].description,
                    style: TextStyle(fontSize: 14.0),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    carTypes[index].price,
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class CarType {
  final String name;
  final String imageUrl;
  final String description;
  final String price;

  CarType({
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.price,
  });
}
