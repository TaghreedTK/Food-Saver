import 'package:flutter/material.dart';
import 'package:food_saver/features/presentation/screens/home screen/models/catergory_model.dart';

import 'package:food_saver/features/presentation/screens/home screen/widgets/category_card.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({
    super.key,
  });

  final List<CategoryModel> categories = const [
    CategoryModel(
      image: 'assets/categories/Bakery.jpg',
      categoryName: 'Bakeries',
      id: 1,
    ),
    CategoryModel(
      image: 'assets/categories/Deserts.jpg',
      categoryName: 'Deserts',
      id: 3,
    ),
    CategoryModel(
        image: 'assets/categories/meals.jpg', categoryName: 'Meals', id: 4),
    CategoryModel(
        image: 'assets/categories/Grocery.jpg', categoryName: 'Grocery', id: 2),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return CategoryCard(
              category: categories[index],
            );
          }),
    );
  }
}
