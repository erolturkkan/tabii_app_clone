import 'package:tabii_app/data/entity/film.dart';

import 'kategori.dart';

final List<Film> tumFilmler = [
  Film(id: 1, ad: "Gassal", resim: "images/gassal.jpg", kategori: [Kategori.Dizi, Kategori.Dram, Kategori.Komedi], tabiiOrjinal: true, yeniMi: true, premiumMu: true),
  Film(id: 2, ad: "Mehmed Fetihler Sultanı", resim: "images/mehmed.jpg", kategori: [Kategori.Film, Kategori.Gizem], tabiiOrjinal: false, yeniMi: false, premiumMu: false),
  Film(id: 3, ad: "Şeytan Adası'nda Esir Türk Polis Cemil", resim: "images/polis_cemil.jpg", kategori: [Kategori.Film, Kategori.Belgesel], tabiiOrjinal: true, yeniMi: false, premiumMu: true),
  Film(id: 4, ad: "Mevlana Celalledin-i Rumi", resim: "images/rumi.jpg", kategori: [Kategori.Film, Kategori.Dram], tabiiOrjinal: false, yeniMi: true, premiumMu: false),
  Film(id: 5, ad: "SICA", resim: "images/sica.jpg", kategori: [Kategori.Film, Kategori.Gizem], tabiiOrjinal: true, yeniMi: false, premiumMu: true),
  Film(id: 6, ad: "Sürgünler", resim: "images/surgunler.jpg", kategori: [Kategori.Film, Kategori.Belgesel], tabiiOrjinal: false, yeniMi: true, premiumMu: false),
  Film(id: 7, ad: "Yankı Görünmez El", resim: "images/yanki.jpg", kategori: [Kategori.Film, Kategori.Belgesel], tabiiOrjinal: true, yeniMi: false, premiumMu: true),
  Film(id: 8, ad: "Derin Mor", resim: "images/derin_mor.jpg", kategori: [Kategori.Film, Kategori.Gizem], tabiiOrjinal: false, yeniMi: true, premiumMu: false),
];

final List<Film> bannerFilmer = [
  Film(id: 1, ad: "Gassal", resim: "images/gassal.jpg", kategori: [Kategori.Dizi, Kategori.Dram, Kategori.Komedi], tabiiOrjinal: true, yeniMi: true, premiumMu: true),
  Film(id: 2, ad: "Mehmed Fetihler Sultanı", resim: "images/mehmed.jpg", kategori: [Kategori.Film, Kategori.Gizem], tabiiOrjinal: false, yeniMi: false, premiumMu: false),
  Film(id: 3, ad: "POLİS CEMİL", resim: "images/polis_cemil.jpg", kategori: [Kategori.Film, Kategori.Belgesel], tabiiOrjinal: true, yeniMi: false, premiumMu: true),
  Film(id: 4, ad: "Mevlana Celalledin-i Rumi", resim: "images/rumi.jpg", kategori: [Kategori.Film, Kategori.Dram], tabiiOrjinal: false, yeniMi: true, premiumMu: false),
  Film(id: 5, ad: "SICA", resim: "images/sica.jpg", kategori: [Kategori.Film, Kategori.Gizem], tabiiOrjinal: true, yeniMi: false, premiumMu: true),
  Film(id: 6, ad: "Sürgünler", resim: "images/surgunler.jpg", kategori: [Kategori.Film, Kategori.Belgesel], tabiiOrjinal: false, yeniMi: true, premiumMu: false),

];