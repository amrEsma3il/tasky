class AddTaskModel {
  String image;
  String title;
  String desc;
  String priority;
  String dueDate;

  // Constructor
  AddTaskModel({
    required this.image,
    required this.title,
    required this.desc,
    required this.priority,
    required this.dueDate,
  });

  // Factory constructor for creating a new AddTaskModel instance from a JSON map
  factory AddTaskModel.fromJson(Map<String, dynamic> json) {
    return AddTaskModel(
      image: json['image'],
      title: json['title'],
      desc: json['desc'],
      priority: json['priority'],
      dueDate: json['dueDate'],
    );
  }

  // Method to convert a AddTaskModel instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'title': title,
      'desc': desc,
      'priority': priority,
      'dueDate': dueDate,
    };
  }
}
