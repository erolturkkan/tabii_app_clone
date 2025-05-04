import 'package:flutter/material.dart';
import 'package:tabii_app/core/theme/renkler.dart';
import 'package:tabii_app/data/entity/film.dart';

class DetaySayfa extends StatefulWidget {
  Film film;
  DetaySayfa({required this.film});

  @override
  State<DetaySayfa> createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {
  @override
  Widget build(BuildContext context) {
    var ekranGenisligi = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.film.ad),
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    anaRenk.withValues(alpha: 0.8),
                    anaRenk.withValues(alpha: 0.0),
                  ]
              )
          ),
        ),
      ),
      backgroundColor: anaRenk,
      body: Center(
        child: Column(
          children: [
            Container(
              width: ekranGenisligi,
              child: Image.asset(widget.film.resim),
            ),
          ],
        ),
      ),
    );
  }
}
