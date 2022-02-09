part of 'models.dart';

class Comments extends Equatable{
  final UserAPI userc;
  final String comment;
  final String createdAt;
  Comments({required this.userc, required this.comment,required this.createdAt});

  factory Comments.fromJson(Map<String,dynamic> json) => Comments(
    comment: json['text'],
    userc: UserAPI.fromJson(json['user']),
    createdAt: json['created_at']);

  @override
  // TODO: implement props
  List<Object?> get props => [comment,userc];

}