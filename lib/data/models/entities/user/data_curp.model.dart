/*
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/
class DataCurpModel {
  bool? synchronized;
  String? curp;
  String? name;
  String? firstsurname;
  String? secondsurname;
  String? birthday;
  String? cvestate;
  String? state;
  String? sex;
  bool? active;
  int? age;
  String? curptutor;

  DataCurpModel({this.synchronized, this.curp, this.name, this.firstsurname, this.secondsurname, this.birthday, this.cvestate, this.state, this.sex, this.active, this.age, this.curptutor});

  DataCurpModel.fromJson(Map<String, dynamic> json) {
    synchronized = json['synchronized'];
    curp = json['curp'];
    name = json['name'];
    firstsurname = json['first_surname'];
    secondsurname = json['second_surname'];
    birthday = json['birthday'];
    cvestate = json['cve_state'];
    state = json['state'];
    sex = json['sex'];
    active = json['active'];
    age = json['age'];
    curptutor = json['curp_tutor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['synchronized'] = synchronized;
    data['curp'] = curp;
    data['name'] = name;
    data['first_surname'] = firstsurname;
    data['second_surname'] = secondsurname;
    data['birthday'] = birthday;
    data['cve_state'] = cvestate;
    data['state'] = state;
    data['sex'] = sex;
    data['active'] = active;
    data['age'] = age;
    data['curp_tutor'] = curptutor;
    return data;
  }
}
