part of 'models.dart';

class Comments extends Equatable{
  final UserAPI userc;
  final String comment;

  Comments({required this.userc, required this.comment});

  factory Comments.fromJson(Map<String,dynamic> json) => Comments(
    comment: json['text'],
    userc: UserAPI.fromJson(json['user']));

  @override
  // TODO: implement props
  List<Object?> get props => [comment,userc];

}