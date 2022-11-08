import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int id;
  final String name;
  final String category;
  final String description;
  final String? imageUrl;
  final bool? isRecommended;
  final bool? isPopular;
  final bool? isTopRated;
  double? price;
  int? quantity;

  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.imageUrl,
    required this.isRecommended,
    required this.isPopular,
    required this.isTopRated,
    this.price = 0,
    this.quantity = 0,
  });

  @override
  List<Object> get props {
    return [
      id,
      name,
      category,
      description,
      imageUrl!,
      isRecommended!,
      isPopular!,
      isTopRated!,
      price!,
      quantity!,
    ];
  }

  Product copyWith({
    int? id,
    String? name,
    String? category,
    String? description,
    String? imageUrl,
    bool? isRecommended,
    bool? isPopular,
    bool? isTopRated,
    double? price,
    int? quantity,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      isRecommended: isRecommended ?? this.isRecommended,
      isPopular: isPopular ?? this.isPopular,
      price: price ?? this.price,
      isTopRated: isTopRated ?? this.isTopRated,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'description': description,
      'imageurl': imageUrl,
      'isRecommended': isRecommended,
      'isPopular': isPopular,
      'isTopRated': isTopRated,
      'price': price,
      'quantity': quantity,
    };
  }

  factory Product.fromSnapshot(DocumentSnapshot snap) {
    return Product(
      id: snap['id'],
      name: snap['name'],
      category: snap['category'],
      description: snap['description'],
      imageUrl: snap['imageUrl'],
      isRecommended: snap['isRecommended'],
      isPopular: snap['isPopular'],
      isTopRated: snap['isTopRated'],
      price: snap['price'],
      quantity: snap['quantity'],
    );
  }

  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  static List<Product> products = [
    Product(
      id: 1,
      name: 'Soft Drink #1',
      category: 'Soft Drink',
      description:
          'The official home of Pepsi®. Stay up to date with the latest products, promotions, news and more at www.pepsi.com.',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3QTRo0vUiYrSLMtASfVlvMljfw2GyIYk13g&usqp=CAU',
      isRecommended: true,
      isPopular: false,
      isTopRated: true,
      price: 25,
      quantity: 10,
    ),
    Product(
      id: 2,
      name: 'Soft Drink #2',
      category: 'Soft Drink',
      description:
          'Get inspired to mix it up a little with 7UP! Crisp and refreshing, it mixes into all kinds of drinks, cocktails, punches, baked goods, and more, ...',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFvgRtukXAyMrUQe2vF-6kRsrS1QamdSmF0Q&usqp=CAU',
      isRecommended: true,
      isPopular: true,
      isTopRated: false,
      price: 30,
      quantity: 15,
    ),
    Product(
      id: 3,
      name: 'Biriyani #1',
      category: 'Biriyani',
      description:
          'Biryani is a mixed rice dish originating among the Muslims of the Indian subcontinent.',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDCXcK4WTnGbUUZzZLxmNr6kK7nhbl4-HEDA&usqp=CAU',
      isRecommended: true,
      isPopular: true,
      isTopRated: false,
      price: 110,
      quantity: 20,
    ),
    Product(
      id: 3,
      name: 'Biriyani #2',
      category: 'Biriyani',
      description:
          'Mutton biryani is a delicious dish made of meat, spices, herbs & yogurt. Learn to make the best at home with step by step photos.',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvXuYtWf0fgEj1qBQ6b-zuGM3ZE_ayWBk4YA&usqp=CAU',
      isRecommended: true,
      isPopular: true,
      isTopRated: true,
      price: 110,
      quantity: 20,
    ),
    Product(
      id: 4,
      name: 'KFC #1',
      category: 'KFC',
      description:
          'Get the latest KFC menu prices, deal offers and exclusive KFC products. Sign up for offers and order KFC online now!',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2g5Y9dV_ggH6kX7Ibi7jYJG8dDmw-rH2P0w&usqp=CAU',
      isRecommended: true,
      isPopular: true,
      isTopRated: true,
      price: 299,
      quantity: 20,
    ),
  ];
}
