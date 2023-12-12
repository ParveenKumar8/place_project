import 'package:place_project/models/post_model.dart';

class PostResponse {
  final int? total;
  final int? skip;
  final int? limit;
  final List<PostModel>? postList;

  PostResponse(
    this.total,
    this.skip,
    this.limit,
    this.postList,
  );

  factory PostResponse.fromJson(Map<String, dynamic> json) {
    // final list = json['posts']
    //     .map(
    //       (post) => PostModel.fromJson(post),
    //     )
    //     .toList();
    final List tempList = json['posts'];
    final postList = tempList
        .map(
          (post) => PostModel.fromJson(post),
        )
        .toList();
    // final postList = List.generate(
    //   json['posts'].length,
    //   (index) => PostModel.fromJson(
    //     json['posts'][index],
    //   ),
    // );
    print('*********');
    //print(list);
    return PostResponse(
      json['total'],
      json['skip'],
      json['limit'],
      postList,

      // List.generate(
      //   json['posts'].length,
      //   (index) => PostModel.fromJson(
      //     json['posts'][index],
      //   ),
      // ),
    );
  }
}
