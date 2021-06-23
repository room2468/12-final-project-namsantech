class Resep {
  int id;
  String name;
  String category;
  String imageUrl;

  Resep({this.id, this.name, this.category, this.imageUrl});

  Resep.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    category = json['category'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['category'] = this.category;
    data['imageUrl'] = this.imageUrl;
    return data;
  }
}
