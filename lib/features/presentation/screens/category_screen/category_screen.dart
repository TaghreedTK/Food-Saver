import 'package:flutter/material.dart';
import 'package:food_saver/data/network/category_request.dart';
import 'package:food_saver/utils/constants/colors.dart';
import 'package:food_saver/utils/helpers/helper_functions.dart';
import 'package:food_saver/features/presentation/screens/category_screen/views/category__list_Builder.dart';

class categoryScreen extends StatefulWidget {
  const categoryScreen(
      {super.key, required this.categoryId, required this.categoryName});
  final int categoryId;
  final String categoryName;

  @override
  State<categoryScreen> createState() => _categoryScreenState();
}

class _categoryScreenState extends State<categoryScreen> {
  CategoryRequest _CategoryData = CategoryRequest();
  var future;
  @override
  void initState() {
    super.initState();
    future = _CategoryData.getCategoryData(id: widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: darkMode ? TColors.light : TColors.primary,
          onPressed: () {
            Navigator.pop(context);

            // Navigate back to the previous screen
          },
        ),
        toolbarHeight: 70,
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          widget.categoryName,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: darkMode ? Colors.white : Colors.black),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 1));
          setState(() {
            future = _CategoryData.getCategoryData(id: widget.categoryId);
            ;
          });
        },
        child: CustomScrollView(slivers: [
          CategoryListBilder(
            future: future,
            categoryId: widget.categoryId,
          )
        ]),
      ),
    );
  }
}
