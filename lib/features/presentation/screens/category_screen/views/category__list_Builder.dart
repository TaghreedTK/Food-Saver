import 'package:flutter/material.dart';
import 'package:food_saver/features/presentation/screens/category_screen/views/categoryProduct_view.dart';

class CategoryListBilder extends StatefulWidget {
  CategoryListBilder(
      {super.key, required this.categoryId, required this.future});
  final int categoryId;
  var future;
  @override
  State<CategoryListBilder> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryListBilder> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.future,
      builder: (context, AsyncSnapshot<dynamic>? snapshot) {
        if (snapshot!.hasError) {
          print(snapshot.error);
          return SliverToBoxAdapter(
            child: Center(
              child: Text("Error while getting data"),
            ),
          );
        } else {
          if (snapshot.hasData) {
            if (snapshot.data.length > 0) {
              print('taghreed ${snapshot.data.length}');
              return ProductListView(
                data: snapshot.data!,
              );
              //
            } else {
              return SliverToBoxAdapter(
                child: Center(
                  child: Text("No Data"),
                ),
              );
            }
          } else {
            return SliverToBoxAdapter(
                child: Center(child: CircularProgressIndicator()));
          }
        }
      },
    );
  }
}


