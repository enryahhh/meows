part of 'models.dart';

class Cats extends Equatable {
  final int id;
  final String namaKucing;
  final String jk;
  final String? birth;
  final String? ras;
  final String? photo;

  Cats(
      {required this.id,
      required this.namaKucing,
      required this.jk,
      this.birth,
      this.ras,
      this.photo});

  factory Cats.fromJson(Map<String, dynamic> json) => Cats(
      id: json['id'],
      namaKucing: json['nama_kucing'],
      jk: json['jk'],
      birth: json['birth'],
      ras: json['ras'],
      photo: json['photo']);
      
  @override
  // TODO: implement props
  List<Object?> get props => [id, namaKucing, birth, ras, photo];

}
