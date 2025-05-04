import '../repository/kategori.dart';

class Film {
  final int id;
  final String ad;
  final String resim;
  final List<Kategori>? kategori;
  final bool tabiiOrjinal;
  final bool yeniMi;
  final bool premiumMu;

  Film({required this.id, required this.ad, required this.resim, required this.kategori, this.tabiiOrjinal = false, this.yeniMi = false, this.premiumMu = false});
}