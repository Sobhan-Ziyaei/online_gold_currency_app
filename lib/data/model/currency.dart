class Currency {
  String id;
  String title;
  String price;
  String changes;
  String status;

  Currency(this.id, this.title, this.price, this.changes, this.status);

  factory Currency.fromMapJson(Map<String, dynamic> jsonObjcet) {
    return Currency(
      jsonObjcet['id'],
      jsonObjcet['title'],
      jsonObjcet['price'],
      jsonObjcet['changes'],
      jsonObjcet['status'],
    );
  }
}
