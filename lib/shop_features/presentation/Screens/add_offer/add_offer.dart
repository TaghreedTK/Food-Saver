import 'dart:io';

import 'package:flutter/material.dart';

import 'package:food_saver/data/shop_network/products/add_product_request.dart';
import 'package:food_saver/features/authentications/widgets/my_button.dart';
import 'package:food_saver/shop_features/presentation/Screens/products%20screen/All_products.dart';

import 'package:food_saver/utils/helpers/helper_functions.dart';

import 'package:image_picker/image_picker.dart';

class AddOffer extends StatefulWidget {
  const AddOffer({super.key});

  @override
  State<AddOffer> createState() => _AddOffer();
}

class _AddOffer extends State<AddOffer> {
  final List<String> fooditems = [
    'Bakeries:1',
    'Deserts:3',
    'Meals:4',
    'Grocery:2'
  ];
  String? value;
  Widget? hint = Text('Select Category');
// Map food items to their corresponding category IDs

  int? selectedCategoryId;
  GlobalKey<FormState> productFormKey = GlobalKey<FormState>();

  TextEditingController itemNameController = TextEditingController();
  TextEditingController itemPriceController = TextEditingController();
  TextEditingController itemDetailsController = TextEditingController();
  TextEditingController itemEXDateController = TextEditingController();
  TextEditingController itemCategoryiController = TextEditingController();
  AddProductRequest _addProduct = AddProductRequest();
  void _uploadpic() async {
    setState(() {
      ImagePicker().pickImage(source: ImageSource.camera).then((value) {
        _addProduct.uploadofferPic(value!);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Color(0xFF373866),
            )),
        centerTitle: true,
        title: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Add',
                style: TextStyle(
                  color: darkMode ? Colors.white : Colors.black,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                ' Offer',
                style: TextStyle(
                  color: Color(
                    0xFFCF5051,
                  ),
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(
              left: 20.0, right: 20.0, top: 20.0, bottom: 50.0),
          child: Form(
            key: productFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Upload the Item Picture",
                    style: TextStyle(
                      color: darkMode ? Colors.white : Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                    )),
                const SizedBox(
                  height: 20.0,
                ),
                Center(
                  child: _addProduct.offerPic == null
                      ? Material(
                          elevation: 4.0,
                          borderRadius: BorderRadius.circular(20),
                          child: GestureDetector(
                            onTap: () {
                              ImagePicker()
                                  .pickImage(source: ImageSource.gallery)
                                  .then((value) {
                                _addProduct.uploadofferPic(value!);
                              });
                            },
                            child: Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color:
                                        darkMode ? Colors.amber : Colors.amber,
                                    width: 1.5),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Icon(
                                Icons.camera_alt_outlined,
                                color: darkMode
                                    ? const Color(
                                        0xFFCF5051,
                                      )
                                    : const Color(
                                        0xFFCF5051,
                                      ),
                              ),
                            ),
                          ),
                        )
                      : Material(
                          elevation: 4.0,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: darkMode ? Colors.amber : Colors.amber,
                                  width: 1.5),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: _addProduct.offerPic != null
                                ? Image(
                                    image: FileImage(
                                        File(_addProduct.offerPic!.path)))
                                : Icon(Icons.camera_alt_outlined),
                          ),
                        ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Text("Item Name",
                    style: TextStyle(
                      color: darkMode ? Colors.white : Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                    )),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: darkMode ? Colors.black : Color(0xFFececf8),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: itemNameController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter Item Name",
                        hintStyle: TextStyle(
                          color: darkMode ? Colors.white : Colors.black,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                        )),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Text("Item Price",
                    style: TextStyle(
                      color: darkMode ? Colors.white : Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                    )),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: darkMode ? Colors.black : Color(0xFFececf8),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: itemPriceController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter Item Price",
                        hintStyle: TextStyle(
                          color: darkMode ? Colors.white : Colors.black,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                        )),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Text("Item Detail",
                    style: TextStyle(
                      color: darkMode ? Colors.white : Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                    )),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: darkMode ? Colors.black : Color(0xFFececf8),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: itemDetailsController,
                    maxLines: 6,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter Item Detail",
                        hintStyle: TextStyle(
                          color: darkMode ? Colors.white : Colors.black,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                        )),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text("Expired Date",
                    style: TextStyle(
                      color: darkMode ? Colors.white : Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                    )),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: darkMode ? Colors.black : Color(0xFFececf8),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: itemEXDateController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter Expired Date",
                        hintStyle: TextStyle(
                          color: darkMode ? Colors.white : Colors.black,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                        )),
                  ),
                ),
                Text("Select Category",
                    style: TextStyle(
                      color: darkMode ? Colors.white : Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                    )),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: darkMode ? Colors.black : Color(0xFFececf8),
                      borderRadius: BorderRadius.circular(10)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      items: fooditems
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: darkMode
                                        ? Colors.black
                                        : Color(0xFFececf8),
                                  ),
                                ),
                              ))
                          .toList(),
                      onChanged: (value) => setState(() {
                        this.value = value; // Update selected item
                      }),
                      dropdownColor:
                          darkMode ? Color(0xFFececf8) : Colors.black,
                      // Set hint text only if no item is selected (value is null)
                      hint: value == null ? hint : null,
                      iconSize: 36,
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: darkMode ? Color(0xFFececf8) : Colors.black,
                      ),
                      value: value, // Display selected item
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Text("What's your category number ?",
                    style: TextStyle(
                      color: darkMode ? Colors.white : Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                    )),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  controller: itemCategoryiController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Category Number",
                      hintStyle: TextStyle(
                        color: darkMode ? Colors.white : Colors.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500,
                      )),
                ),
                SizedBox(
                  height: 30.0,
                ),
                SizedBox(
                    width: double.infinity,
                    child: My_Button(
                      onPressed: () {
                        _addProduct.addProduct(
                            name: itemNameController.text,
                            price: itemPriceController.text,
                            description: itemDetailsController.text,
                            expire_time: itemEXDateController.text,
                            category: itemCategoryiController.text);
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return allProductScreen();
                            },
                          ),
                        );
                      },
                      label: 'Add',
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
