class Prov {
  String? id;
  String? name;

  Prov({this.id, this.name});

  Prov.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Kab {
  String? id;
  String? provinceId;
  String? name;

  Kab({this.id, this.provinceId, this.name});

  Kab.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    provinceId = json['province_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['province_id'] = this.provinceId;
    data['name'] = this.name;
    return data;
  }
}

class Kec {
  String? id;
  String? regencyId;
  String? name;

  Kec({this.id, this.regencyId, this.name});

  Kec.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    regencyId = json['regency_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['regency_id'] = this.regencyId;
    data['name'] = this.name;
    return data;
  }
}

class Kel {
  String? id;
  String? districtId;
  String? name;

  Kel({this.id, this.districtId, this.name});

  Kel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    districtId = json['district_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['district_id'] = this.districtId;
    data['name'] = this.name;
    return data;
  }
}


