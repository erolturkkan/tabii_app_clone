import 'package:flutter/material.dart';

import '../../core/theme/renkler.dart';
import '../../data/entity/film.dart';
import 'detay_sayfa.dart';
import 'icerik_listele.dart';

class YatayIcerikListele extends StatelessWidget {
  final String baslik;
  final List<Film> filmler;
  const YatayIcerikListele({ required this.baslik, required this.filmler, super.key });

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => IcerikListele(
                    icerik: filmler,
                    baslik: baslik,
                  ),
                ),
              );
            },
            child: Row(
              children: [
                Text(
                  baslik,
                  style: TextStyle(
                    color: yaziRenk,
                    fontWeight: FontWeight.bold,
                    fontSize: h / 50,
                  ),
                ),
                SizedBox(width: w / 40),
                Icon(Icons.arrow_forward_ios, color: yaziRenk, size: h / 50),
              ],
            ),
          ),
        ),
        SizedBox(
          height: w * 0.45 * 1.25,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: filmler.length,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemBuilder: (c, i) {
              final film = filmler[i];
              return Container(
                width: w * 0.45,
                margin: const EdgeInsets.only(right: 12),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => DetaySayfa(film: film)),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(film.resim, fit: BoxFit.cover),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
