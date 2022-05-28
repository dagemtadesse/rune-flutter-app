class Posts {
  String name;
  String date;
  String title;
  String postText;
  String imgUrl;
  String upCount;
  String downCount;

  Posts(this.name, this.date, this.title, this.postText, this.imgUrl,
      this.upCount, this.downCount);

  static List<Posts> post = [
    Posts(
        "Publisher 1",
        "Jan 20 2021",
        "Post Title",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit,\nsed do eiusmod tempor incididu",
        "assets/test.jpg",
        "125",
        "34"),
    Posts(
        "Publisher 2",
        "Jan 20 2021",
        "Post Title",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit,\nsed do eiusmod tempor incididu",
        "assets/test.jpg",
        "123",
        "89"),
  ];
}
