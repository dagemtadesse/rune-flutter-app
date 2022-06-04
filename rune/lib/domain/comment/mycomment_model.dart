

class MyComment {
  final String profileName, image, description, dateCommented;
  int upvoteCount,downvoteCount;
  MyComment(
      {required this.profileName,
      required this.image,
      required this.dateCommented,
      required this.description,
      required this.upvoteCount,
      required this.downvoteCount
      });
}

List<MyComment> mycomments = [
  MyComment(
      profileName: "Moaraine Sedi",
      image: "assets/images/img_avatar1.png",
      description: dummyText,
      dateCommented: "Jan 20, 2022", 
      downvoteCount: 70, 
      upvoteCount: 170,
      ),
      
  MyComment(
      profileName: "Moaraine Sedi",
      image: "assets/images/img_avatar1.png",
      description: dummyText,
      dateCommented: "Sep 18, 2022",
      downvoteCount: 55, 
      upvoteCount: 121,
      ),
  MyComment(
      profileName: "Moaraine Sedi",
      image: "assets/images/img_avatar1.png",
      description: dummyText,
      dateCommented: "Jun 20, 2022",
      downvoteCount: 69, 
      upvoteCount: 133,
      ),
  MyComment(
      profileName: "Moaraine Sedi",
      image: "assets/images/img_avatar1.png",
      description: dummyText,
      dateCommented: "Jan 20, 2021",
      downvoteCount: 10, 
      upvoteCount: 150,
      ),
  MyComment(
      profileName: "Moaraine Sedi",
      image: "assets/images/img_avatar1.png",
      description: dummyText,
      dateCommented: "Jul 22, 2021",
      downvoteCount: 30, 
      upvoteCount: 110,
      )
];

String dummyText =
    "Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum";
