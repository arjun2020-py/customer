import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key});
  //create a list for catagires.
  // ignore: non_constant_identifier_names
  final category = [
    {"catagires": "All", "image": "assets/images/all.webp"},
    {"catagires": "Women", "image": "assets/images/women.jpeg"},
    {"catagires": "Men", "image": "assets/images/men.jpeg"},
    {"catagires": "Footwear", "image": "assets/images/footwear.jpeg"},
    {"catagires": "Accessories", "image": "assets/images/acessies.jpeg"},
    {"catagires": "Gadgets", "image": "assets/images/gadates.jpeg"},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection:
          Axis.horizontal, //catagry list is placed in hrozontal manner
      itemCount: category.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              ClipOval(
                child: Image.asset(
                  category[index]
                      .values
                      .last, //it point the last index of catgery list it is image
                  width: 50,
                  height: 50,
                  fit: BoxFit.fill,
                ),
              ),
              Expanded(
                  child: Text(
                category[index].values.first,
                style: TextStyle(color: Colors.white),
              ) //it point first index of catagery list it is a name
                  ),
            ],
          ),
        );
      },
    );
  }
}
