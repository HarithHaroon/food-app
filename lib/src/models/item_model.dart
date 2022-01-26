class ItemModel {
  String price;
  double rating;
  String id;
  int reviews;
  String name;
  String imageURL;

  ItemModel({
    this.id,
    this.price,
    this.imageURL,
    this.name,
    this.rating,
    this.reviews,
  });

  ItemModel.fromModel(Map<String, dynamic> value) {
    price = value['price'];
    rating = value['rating'];
    id = value['id'];
    reviews = value['review_count'];
    name = value['name'];
    imageURL = value['image_url'];
  }
}
