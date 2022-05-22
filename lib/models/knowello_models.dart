import 'dart:convert';


KnowelloGramModel knowelloGramModelFromJson(String str) =>
    KnowelloGramModel.fromJson(json.decode(str));

String knowelloGramModelToJson(KnowelloGramModel data) =>
    json.encode(data.toJson());

class KnowelloGramModel {
  KnowelloGramModel({
    required this.posts,
  });

  List<Post>? posts;

  factory KnowelloGramModel.fromJson(Map<String, dynamic> json) =>
      KnowelloGramModel(
        posts: List<Post>.from(json["posts"].map((x) => Post.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "posts": List<dynamic>.from(posts!.map((x) => x.toJson())),
      };
}

class Post {
  Post({
    required this.images,
    required this.description,
    required this.interactions,
    required this.postedBy,
    required this.profileImage,
  });

  List images;
  String? description;
  Interactions? interactions;
  String? postedBy;
  String? profileImage;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        images: List<String>.from(json["images"].map((x) => x)),
        description: json["description"],
        interactions: Interactions.fromJson(json["interactions"]),
        postedBy: json["postedBy"],
        profileImage: json["profileImage"],
      );

  Map<String, dynamic> toJson() => {
        "images": List<dynamic>.from(images.map((x) => x)),
        "description": description,
        "interactions": interactions!.toJson(),
        "postedBy": postedBy,
        "profileImage": profileImage,
      };
}

class Interactions {
  Interactions({
    required this.likes,
    required this.comments,
    required this.bookmarked,
  });

  int? likes;
  int? comments;
  bool? bookmarked;

  factory Interactions.fromJson(Map<String, dynamic> json) => Interactions(
        likes: json["likes"],
        comments: json["comments"],
        bookmarked: json["bookmarked"],
      );

  Map<String, dynamic> toJson() => {
        "likes": likes,
        "comments": comments,
        "bookmarked": bookmarked,
      };
}
