import 'package:flutter/material.dart';
import 'package:food_saver/features/presentation/screens/category_screen/category_screen.dart';
import 'package:food_saver/features/presentation/screens/home%20screen/models/catergory_model.dart';
import 'package:food_saver/utils/constants/colors.dart';
import 'package:food_saver/utils/constants/sizes.dart';
import 'package:food_saver/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category});

  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return categoryScreen(
                categoryId: category.id,
                categoryName: category.categoryName,
              );
            },
          ),
        );
      },
      //{

      // Navigator.of(context).push(
      //MaterialPageRoute(
      //  builder: (context) {
      //   return CategoryView(
      //  category: category.categoryName,
      //  );
      //   },
      // ),
      //  );
      //  },
      child: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: Container(
            decoration: ShapeDecoration(
                color:
                    dark ? TColors.primary.withOpacity(1.0) : Color(0xFFd3d3d3),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0))),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 8, right: 8, top: 0, bottom: 0),
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: dark ? Colors.grey.shade500 : Colors.white,
                    child: CircleAvatar(
                      radius: 23,
                      backgroundImage: AssetImage(category.image),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    category.categoryName,
                    style: TextStyle(color: Colors.black),
                  ),
                )
              ],
            )),
        /*child: Container(
          
          height: 85,
          width: 160,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
                image: AssetImage(category.image), fit: BoxFit.fill),
          ),
          child: Center(
            child: Text(
              category.categoryName,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),*/
      ),
    );
  }
}
