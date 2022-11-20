import 'package:coustomer/HomeScreen/view/scrren_product.dart';
import 'package:flutter/material.dart';

import '../../HomeCatagiresScreen/catagries.dart';
import '../../dawerScreen/naviationbar.dart';
import '../../models/product_models.dart';
import 'card_tail.dart';

class HomeSceen extends StatefulWidget {
  const HomeSceen({
    super.key,
  });
  @override
  State<HomeSceen> createState() => _HomeSceenState();
}

class _HomeSceenState extends State<HomeSceen> {
  List<ProductPage> product = [
    ProductPage(
      image:
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcTcq1afbtaU3OgdPaJKcp0FtH4eyYXCJ-msvNZgxsI3OUPR13eqHaUyPuP4b0C1W5iQghpQIbcOTw&usqp=CAc",
      title: "Apple iPhone 14 Pro Max",
      discrption: "The Apple iPhone 14 Pro Max 5G comes with a 6.7-inch",
      offer: "10% Off",
      price: "\$139,900",
    ),
    ProductPage(
      image:
          "https://rukminim1.flixcart.com/image/832/832/xif0q/t-shirt/w/t/2/-original-imagg26aa3gz5yym.jpeg?q=70",
      title: "T-Shirt",
      discrption: "Printed Men Round Neck Blue T-Shirt",
      offer: "20% Off",
      price: "\$1,600",
    ),
    ProductPage(
        image:
            "https://images.meesho.com/images/products/99760635/9zthf_512.webp",
        title: "shoe",
        discrption: "Black Solid Running Shoes For Men.",
        offer: "5% Off",
        price: "\$375"),
    ProductPage(
        image:
            "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcSAS7nlJOh4U9b7j1qzbgLHJw85eQsUtA6OBfYkv99HsQXWqHCB2ZBRfGGfani0iEQ1xFOKzsnB6g&usqp=CAE",
        title: "Wireless Headset",
        discrption: "Boult Audio",
        offer: "10% Off",
        price: "\$1,299"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff363636),
      //Creates a widget that has a preferred size that the parent can query.
      drawer: const NavigationScreen(),
      // appBar: const PreferredSize(child: AppbrScreen(), preferredSize: Size.fromHeight(50)),//Creates a [Size] with the given [height] and an infinite [width].
      body: //tabs[_currentIndex],
          Column(
        children: [
          Container(
            height: 80,
            child: Expanded(
              child: CategoriesScreen(),
            ),
          ),
          // Image.asset("assets/images/slide.jpeg"),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  mainAxisExtent: 480,
                  childAspectRatio: .05),
              itemCount: product.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ScreenProduct(
                                productAxis: product[index],
                              ))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        CardTill(
                          product1: product[index],
                        )
                        //Image.network("${grad_map}"),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),

      // bottomNavigationBar: ,
    );
  }
}
