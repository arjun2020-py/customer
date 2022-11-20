import 'package:flutter/material.dart';
import '../../models/product_models.dart';

class ScreenProduct extends StatelessWidget {
  ScreenProduct({Key? key, required this.productAxis}) : super(key: key);
  ProductPage productAxis;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xfffefefe),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.black45,
        ),
        actions: const [
          Icon(
            Icons.search_rounded,
            color: Colors.black45,
          ),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.favorite_border_rounded,
            color: Colors.black45,
          ),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.shopping_cart,
            color: Colors.black45,
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: ListView(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: const Color(0xfffefefe),
                  child: Image.network(productAxis.image!)),
              Padding(
                padding: const EdgeInsets.only(right: 280),
                child: Text(
                  productAxis.title!,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 210),
                child: Text(
                  productAxis.discrption!,
                  style: const TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 310),
                child: Text(
                  productAxis.price!,
                  style: const TextStyle(color: Colors.black45, fontSize: 20),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ''',
                ),
              ),
              Padding(
                //1
                padding: const EdgeInsets.all(10),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: const Color(0xfff2f2f2),
                  child: Column(
                    children: [
                      ListTile(
                        leading: TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Delivery Details",
                              style: TextStyle(color: Colors.black),
                            )),
                        trailing: TextButton(
                            onPressed: () {},
                            child: const Text("Check deliver dare")),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                //2
                padding: const EdgeInsets.all(10),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: const Color(0xfff2f2f2),
                  child: Column(
                    children: [
                      ListTile(
                        leading: TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Bank Offers",
                              style: TextStyle(color: Colors.black),
                            )),
                        trailing: TextButton(
                            onPressed: () {}, child: const Text("more")),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                //3
                padding: const EdgeInsets.all(10),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: const Color(0xfff2f2f2),
                  child: Column(
                    children: [
                      ListTile(
                        leading: TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Product Details",
                              style: TextStyle(color: Colors.black),
                            )),
                        trailing: TextButton(
                            onPressed: () {}, child: const Text("more")),
                      )
                    ],
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(right: 135),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          color: const Color(0xfff2f2f2),
                          child: Column(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.share))
                            ],
                          ),
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: const Color(0xfff2f2f2),
                        child: Column(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.favorite_border_rounded))
                          ],
                        ),
                      ),
                      Card(
                        //width: 200,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: const Color(0xff5f7d89),
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.shopping_bag_outlined,
                                  color: Colors.white,
                                )),
                            const Text("Add to bag")
                          ],
                        ),
                      )
                      // Card(
                      //   elevation: 10,
                      //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      //   color: const Color(0xff5f7d89),
                      //   child: Column(
                      //     children: [
                      //       Row(

                      //         children: [
                      //           IconButton(onPressed:
                      //           () {}, icon: const Icon(Icons.shopping_bag,color: Colors.white,),),

                      //         ],
                      //       )
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
