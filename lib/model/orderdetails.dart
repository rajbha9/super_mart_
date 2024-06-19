class Orders {
  String company;
  String address;
  String image;
  String time;
  bool accept;

  Orders(
      {required this.accept,
      required this.address,
      required this.company,
      required this.image,
      required this.time});
}
