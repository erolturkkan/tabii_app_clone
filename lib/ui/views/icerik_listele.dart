import 'package:flutter/material.dart';

import '../../data/entity/film.dart';
import '../../data/repository/filmler_data.dart';
import 'detay_sayfa.dart';

class IcerikListele extends StatefulWidget {
  List<Film> icerik;
  String baslik;

  IcerikListele({required this.icerik, required this.baslik});

  @override
  State<IcerikListele> createState() => _IcerikListele();
}

class _IcerikListele extends State<IcerikListele> {

  Future<List<Film>> icerikYukle() async{
    return widget.icerik;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.baslik),),
      body: FutureBuilder(
        future: icerikYukle(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            var icerikListesi = snapshot.data;
            return GridView.builder(
                itemCount: icerikListesi!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 1 / 1.25
                ),
                itemBuilder: (context, indeks){
                  var icerik = icerikListesi[indeks];
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DetaySayfa(film: icerik,)));
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        children: [Image.asset(icerik.resim)],
                      ),
                    ),
                  );
                }
            );
          }else{
            return Center();
          }
        },
      ),
    );
  }
}
