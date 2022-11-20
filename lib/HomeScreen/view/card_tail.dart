import 'package:flutter/material.dart';

import '../../models/product_models.dart';

class CardTill extends StatelessWidget {
  const CardTill({
    Key? key,
    required this.product1,
  }) : super(key: key);
  final ProductPage product1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        // color: Color(0xff63594d),
        child: Column(
          children: [
            ListTile(
              //  onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ScreenProduct(),)),
              title: Image.network(
                "${product1.image}",
                height: 170,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              subtitle: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text("${(product1.title)}"),
                    const SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Text("${(product1.discrption)}"),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 66),
                      child: Text(
                        "${(product1.price)}",
                        style: const TextStyle(color: Colors.green),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 65,
                      ),
                      child: Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          color: Colors.greenAccent,
                          child: Text("${(product1.offer)}")),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 100),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.favorite),
                        color: Colors.red,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
