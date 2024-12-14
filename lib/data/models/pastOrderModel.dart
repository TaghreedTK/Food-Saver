class PreviousOrdersModel {
  final String? image;
  final String name;
  final String shop_name;
  final String? product_description;
   final String? price;
   final String? date;

  PreviousOrdersModel(
      {required this.image, required this.name, required this.product_description,required this.date,required this.price,required this.shop_name});
}