import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kangleiphotographers/constant/customapi.dart';

@RoutePage()
class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Category'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 70,),
          Expanded(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(mainAxisSpacing: 2,crossAxisSpacing: 3,
                    crossAxisCount: 2),
                itemCount: allcategory.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Container(
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                allcategory[index]['categoryimage'],
                              )),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(255, 254, 216, 156)
                                          .withOpacity(0.7),
                                      borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(20),
                                          bottomRight: Radius.circular(20))),
                                  height: 30,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.symmetric(horizontal: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          allcategory[index]['categoryname'],
                                          style: const TextStyle(
                                              decorationColor: Colors.blue,
                                              letterSpacing: 1.2,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Image.asset(
                                          'assets/images/arrow.png',
                                          height: 20,
                                        )
                                      ],
                                    ),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
