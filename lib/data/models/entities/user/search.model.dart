class SearchModel {
  SearchModel({
      this.typeSearch, 
      this.curp,});

  SearchModel.fromJson(dynamic json) {
    typeSearch = json['type_search'];
    curp = json['curp'];
  }
  String? typeSearch;
  String? curp;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type_search'] = typeSearch;
    map['curp'] = curp;
    return map;
  }

}