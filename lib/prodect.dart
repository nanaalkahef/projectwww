class convert {
  Data? data;
  String? message;

  convert({this.data, this.message});

  convert.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  int? id;
  String? commercialName;
  String? scientificName;
  String? manufactureCompany;
  int? quantity;
  String? price;
  String? image;
  int? categoryId;
  String? categoryName;
  List<StatusMedicines>? statusMedicines;
  Category? category;

  Data(
      {this.id,
      this.commercialName,
      this.scientificName,
      this.manufactureCompany,
      this.quantity,
      this.price,
      this.image,
      this.categoryId,
      this.categoryName,
      this.statusMedicines,
      this.category});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    commercialName = json['commercial_name'];
    scientificName = json['scientific_name'];
    manufactureCompany = json['manufacture_company'];
    quantity = json['quantity'];
    price = json['price'];
    image = json['image'];
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    if (json['status_medicines'] != null) {
      statusMedicines = <StatusMedicines>[];
      json['status_medicines'].forEach((v) {
        statusMedicines!.add(new StatusMedicines.fromJson(v));
      });
    }
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['commercial_name'] = this.commercialName;
    data['scientific_name'] = this.scientificName;
    data['manufacture_company'] = this.manufactureCompany;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['image'] = this.image;
    data['category_id'] = this.categoryId;
    data['category_name'] = this.categoryName;
    if (this.statusMedicines != null) {
      data['status_medicines'] =
          this.statusMedicines!.map((v) => v.toJson()).toList();
    }
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    return data;
  }
}

class StatusMedicines {
  int? id;
  int? quantity;
  String? expirationDate;
  int? medicineId;

  StatusMedicines(
      {this.id, this.quantity, this.expirationDate, this.medicineId});

  StatusMedicines.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    expirationDate = json['expiration_date'];
    medicineId = json['medicine_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['quantity'] = this.quantity;
    data['expiration_date'] = this.expirationDate;
    data['medicine_id'] = this.medicineId;
    return data;
  }
}

class Category {
  int? id;
  String? name;
  String? photo;

  Category({this.id, this.name, this.photo});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['photo'] = this.photo;
    return data;
  }
}