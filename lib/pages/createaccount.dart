import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kangleiphotographers/constant/alertbox.dart';
import 'package:kangleiphotographers/constant/constant.dart';
import 'package:kangleiphotographers/controller/tapcontroller.dart';
import 'package:kangleiphotographers/router/router.dart';

@RoutePage()
class CreateAccountPage extends StatelessWidget {
  CreateAccountPage({super.key});

  var format = DateFormat("dd-MM-yyyy");

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final TextEditingController firstnamecontroller = TextEditingController();
  final TextEditingController lastnamecontroller = TextEditingController();

  final TextEditingController citycontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    GetxTapController controller = Get.put(GetxTapController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<GetxTapController>(builder: (_) {
        return SingleChildScrollView(
          child: SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Create an Account !!',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Enter your details to register your account',
                  style: TextStyle(fontSize: 17),
                ),
                const SizedBox(
                  height: 12,
                ),
                GestureDetector(
                  onTap: () {
                    controller.selectprofilephoto(context);
                  },
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                        bottomLeft: Radius.circular(8)),
                    child: controller.image != null
                        ? Image.file(
                            controller.image,
                            height: 60,
                            width: 60,
                            fit: BoxFit.cover,
                          )
                        : Image.asset(
                            'assets/images/profile.jpg',
                            height: 60,
                          ),
                  ),
                ),
                Form(
                    key: _formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 12,
                        ),
                        const Text(
                          'First Name',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[100]),
                          height: 45,
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'First Name Can\'t be Empty';
                                  }
                                  return null;
                                },
                                controller: firstnamecontroller,
                                keyboardType: TextInputType.name,
                                // controller: phoneController,
                                decoration: InputDecoration.collapsed(
                                  hintStyle: TextStyle(
                                      color: Colors.grey.withOpacity(0.5),
                                      fontSize: 17),
                                  hintText: 'Enter Your First Name',
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        const Text(
                          'Last Name',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[100]),
                          height: 45,
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Last Name Can\'t be Empty';
                                  }
                                  return null;
                                },
                                controller: lastnamecontroller,
                                keyboardType: TextInputType.name,
                                // controller: phoneController,
                                decoration: InputDecoration.collapsed(
                                  hintStyle: TextStyle(
                                      color: Colors.grey.withOpacity(0.5),
                                      fontSize: 17),
                                  hintText: 'Enter Your Last Name',
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        const Text(
                          'Email',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[100]),
                          height: 45,
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                            child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      controller.gmail,
                                      style: const TextStyle(fontSize: 17),
                                    ))),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        const Text(
                          'City',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[100]),
                          height: 45,
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'City Can\'t be Empty';
                                  }
                                  return null;
                                },
                                controller: citycontroller,
                                keyboardType: TextInputType.name,
                                // controller: phoneController,
                                decoration: InputDecoration.collapsed(
                                  hintStyle: TextStyle(
                                      color: Colors.grey.withOpacity(0.5),
                                      fontSize: 17),
                                  hintText: 'Enter Your City',
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        const Text(
                          'Select Birth Date',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[100]),
                          height: 45,
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      controller.initialdateformat,
                                      style: TextStyle(
                                          color: controller.initialdateformat ==
                                                  'dd/mm/yyyy'
                                              ? Colors.grey.withOpacity(0.5)
                                              : Colors.black,
                                          fontSize: 17),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      controller.selectdob(context);
                                    },
                                    child: const Icon(
                                      Icons.calendar_month,
                                      color: Colors.orange,
                                    ),
                                  )
                                ],
                              )),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        const Text(
                          'Select Gender',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: ListTileTheme(
                                horizontalTitleGap: 2,
                                child: RadioListTile(
                                    activeColor:
                                        const Color.fromARGB(255, 247, 175, 75),
                                    contentPadding: EdgeInsets.zero,
                                    toggleable: true,
                                    title: const Text(
                                      "Male",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    value: genderok.male,
                                    groupValue: controller.character,
                                    onChanged: (value) {
                                      controller
                                          .selectgender(value as genderok);
                                    }),
                              ),
                            ),
                            Expanded(
                              child: ListTileTheme(
                                horizontalTitleGap: 2,
                                child: RadioListTile(
                                    activeColor:
                                        const Color.fromARGB(255, 247, 175, 75),
                                    contentPadding: EdgeInsets.zero,
                                    title: const Text(
                                      "Female",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    value: genderok.female,
                                    groupValue: controller.character,
                                    onChanged: (value) {
                                      controller
                                          .selectgender(value as genderok);
                                    }),
                              ),
                            ),
                            Expanded(
                              child: ListTileTheme(
                                horizontalTitleGap: 2,
                                child: RadioListTile(
                                    activeColor:
                                        const Color.fromARGB(255, 247, 175, 75),
                                    contentPadding: EdgeInsets.zero,
                                    title: const Text(
                                      "Other",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    value: genderok.other,
                                    groupValue: controller.character,
                                    onChanged: (value) {
                                      controller
                                          .selectgender(value as genderok);
                                    }),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            if (_formkey.currentState!.validate()) {
                              if (controller.image != null &&
                                  controller.initialdateformat !=
                                      'dd/mm/yyyy') {
                                showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (BuildContext context) {
                                    return alertbox('Please Wait...');
                                  },
                                );
                                controller
                                    .saveuserdata(
                                        firstname: firstnamecontroller.text,
                                        lastname: lastnamecontroller.text,
                                        cityname: citycontroller.text)
                                    .whenComplete(() {
                                  context.router.pop();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        elevation: 10,
                                        duration: Duration(seconds: 2),
                                        backgroundColor: Colors.green,
                                        content: Text(
                                            'Account Created Successfully')),
                                  );
                                  context.router.replaceNamed('/homepage');
                                });
                              } else if (controller.image == null &&
                                  controller.initialdateformat !=
                                      'dd/mm/yyyy') {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      elevation: 10,
                                      duration: Duration(seconds: 2),
                                      backgroundColor: Colors.red,
                                      content: Text('Pleas Upload Your Photo')),
                                );
                              } else if (controller.initialdateformat ==
                                      'dd/mm/yyyy' &&
                                  controller.image != null) {
                                const SnackBar(
                                    elevation: 10,
                                    duration: Duration(seconds: 2),
                                    backgroundColor: Colors.red,
                                    content:
                                        Text('Birth Date can\'t be Empty'));
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      elevation: 10,
                                      duration: Duration(seconds: 2),
                                      backgroundColor: Colors.red,
                                      content: Text(
                                          'Not uploaded Photo and Birth Date can\'t be Empty')),
                                );
                              }
                              // If the form is valid, display a snackbar. In the real world,
                              // you'd often call a server or save the information in a database.
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    elevation: 10,
                                    duration: Duration(seconds: 2),
                                    backgroundColor: Colors.red,
                                    content: Text('All Field Are Mandatory')),
                              );
                            }
                          },
                          child: Material(
                            borderRadius: BorderRadius.circular(10),
                            elevation: 10,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 45,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color:
                                      const Color.fromARGB(255, 247, 175, 75)),
                              child: const Center(
                                  child: Text(
                                'Continue',
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              )),
                            ),
                          ),
                        )
                      ],
                    )),
              ],
            ),
          )),
        );
      }),
    );
  }
}
