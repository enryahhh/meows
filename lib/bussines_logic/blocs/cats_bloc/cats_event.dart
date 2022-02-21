part of 'cats_bloc.dart';

abstract class CatsEvent extends Equatable {
  const CatsEvent();

  @override
  List<Object?> get props => [];
}

class GetCat extends CatsEvent{
}

class AddCat extends CatsEvent{
    final String namaKucing;
    final String jk;
    final String? birth;
    final String? ras;
    final String? photo;

  AddCat(this.namaKucing, this.jk, this.birth, this.ras, this.photo);

  @override
  List<Object?> get props => [namaKucing, birth, ras, photo];
}