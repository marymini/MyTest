class Child {
  int id;
  String age, month, child;
  Child(this.id, this.age, this.month, this.child);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      "id": id,
      "age": age,
      "month": month,
      "child": child
    };
    return map;
  }

  Child.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    age = map['age'];
    month = map['month'];
    child = map['child'];
  }
}
