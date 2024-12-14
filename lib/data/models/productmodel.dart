class productModel {
  int? id;
  String? name;
  int? price;
  String? description;
  String? expireTime;
  String? image;
  String? shopName;
  String? shopAddress;
  String? expireTimeHumified;

  productModel(
      {this.id,
      this.name,
      this.price,
      this.description,
      this.expireTime,
      this.image,
      this.shopName,
      this.shopAddress,
      this.expireTimeHumified});

  /* productModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    description = json['description'];
    expireTime = json['expire_time'];
    image = json['image'];
    shopName = json['shop_name'];
    shopAddress = json['shop_address'];
    expireTimeHumified = json['expire_time_humified'];
  }

  Map<String, dynamic> product toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['description'] = this.description;
    data['expire_time'] = this.expireTime;
    data['image'] = this.image;
    data['shop_name'] = this.shopName;
    data['shop_address'] = this.shopAddress;
    data['expire_time_humified'] = this.expireTimeHumified;
    return data;
  }*/
}
