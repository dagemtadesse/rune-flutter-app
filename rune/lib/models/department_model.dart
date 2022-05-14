class Departments {
  String departmentName;
  String departmentDescription;
  List<DepartmentImages> images;

  Departments(this.departmentName, this.departmentDescription, this.images);

  static List<Departments> department = [
    Departments(
        "Mechanical Engineering",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit,\nsed do eiusmod tempor incididu",
        [
          DepartmentImages("assets/mechanical.jpg"),
          DepartmentImages("assets/mechanical.jpg"),
          DepartmentImages("assets/mechanical.jpg"),
        ])
  ];
}

class DepartmentImages {
  String imgUrl;
  DepartmentImages(this.imgUrl);
}
