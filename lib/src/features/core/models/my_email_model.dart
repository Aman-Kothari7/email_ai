class MyEmailModel {
  int? id;
  final String title;
  final String description;
  final String addedDate;

  MyEmailModel({this.id, required this.title, required this.description, required this.addedDate});

  MyEmailModel.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        title = res["title"],
        description = res["description"],
        addedDate = res["addedDate"];

  //when add data to sql we send map not dart obj
  Map<String, Object?> toMap() {
    return {'id': id, 'title': title, 'description': description, 'addedDate': addedDate};
  }
}
