import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kangleiphotographers/constant/customapi.dart';

import 'package:kangleiphotographers/controller/tapcontroller.dart';
import 'package:kangleiphotographers/pages/categorypage.dart';
import 'package:kangleiphotographers/router/router.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    GetxTapController controller = Get.put(GetxTapController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<GetxTapController>(builder: (_) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 25),
            child: Column(
              children: [
                Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                    color: Color.fromARGB(255, 45, 158, 154),
                                    Icons.location_city),
                                Text(
                                  'Your City',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Imphal',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Icon(
                          Icons.notifications,
                          size: 25,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[100]),
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          const Icon(
                            FontAwesomeIcons.magnifyingGlass,
                            size: 17,
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              // controller: phoneController,
                              decoration: InputDecoration.collapsed(
                                hintStyle: TextStyle(
                                    color: Colors.grey.withOpacity(0.5),
                                    fontSize: 17),
                                hintText: 'search category here',
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Image.asset(
                      'assets/images/photographer.jpg',
                      height: 120,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Category',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                            onPressed: () {
                             Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const CategoryPage()),
  );
                            }, child: const Text('View All'))
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: 150,
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                            itemCount: allcategory.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Expanded(
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  color: const Color.fromARGB(
                                                          255, 254, 216, 156)
                                                      .withOpacity(0.7),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  20),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  20))),
                                              height: 30,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 15),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      allcategory[index]
                                                          ['categoryname'],
                                                      style: const TextStyle(
                                                          decorationColor:
                                                              Colors.blue,
                                                          letterSpacing: 1.2,
                                                          fontWeight:
                                                              FontWeight.bold),
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
                )
                // ElevatedButton(
                //     onPressed: () {
                //       log('logout');
                //       showDialog(
                //         context: context,
                //         barrierDismissible: false,
                //         builder: (BuildContext context) {
                //           Future.delayed(const Duration(seconds: 2), () {
                //             Navigator.of(context).pop(true);
                //           });
                //           return alertbox('Logging Out..');
                //         },
                //       ).whenComplete(() {
                //         controller.signout().whenComplete(() {
                //           controller.Googlesignout();

                //           context.router.push(const AuthFlowRoute());
                //         });
                //       });
                //     },
                //     child: const Text('LogOut'))
              ],
            ),
          ),
        );
      }),
    );
  }
}
