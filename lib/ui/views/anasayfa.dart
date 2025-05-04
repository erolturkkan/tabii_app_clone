import 'package:flutter/material.dart';
import 'package:tabii_app/core/theme/renkler.dart';
import 'package:tabii_app/data/entity/film.dart';
import 'package:tabii_app/data/repository/filmler_data.dart';
import 'package:tabii_app/data/repository/kategori.dart';
import 'package:tabii_app/ui/views/detay_sayfa.dart';
import 'package:tabii_app/ui/views/icerik_listele.dart';
import 'package:tabii_app/ui/views/yatay_icerik_listele.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  int _selectedIndex = 0;
  final List<String> _menuItems = ['Tümü', 'Dizi', 'Film', 'Çocuk', 'Belgesel', 'Tekrar İzle'];

  final PageController _bannerController = PageController(viewportFraction: 1.0);
  int _currentBanner = 0;

  Future<List<Film>> filmleriYukle() async{
    return tumFilmler;
  }

  Future<List<Film>> bannerFilmleriYukle() async{
    return bannerFilmer;
  }


  @override
  Widget build(BuildContext context) {
    var cihaz = MediaQuery.of(context);
    var ekranGenisligi = cihaz.size.width;
    var ekranYuksekligi = cihaz.size.height;
    print(ekranGenisligi);
    print(ekranYuksekligi);

    return Scaffold(
      appBar: AppBar(
        title: Image.asset("images/tabii_logo.png", height: ekranYuksekligi/33,width: ekranYuksekligi/33*2.715,),
        actions: [
          Icon(Icons.search, color: yaziRenk, size: 30,)
        ],
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
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48),
          child: Container(
            color: anaRenk.withAlpha(128),
            height: 48,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,           // ← Yatay kaydırma
              itemCount: _menuItems.length,
              itemBuilder: (context, i) {
                final isSelected = i == _selectedIndex;
                return GestureDetector(
                  onTap: (){
                    setState(() {
                      _selectedIndex = i;
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      _menuItems[i],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                        color: isSelected
                            ? yaziRenk
                            : yaziRenk.withAlpha(128),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),

      ),
      backgroundColor: anaRenk,
      body: FutureBuilder(future: bannerFilmleriYukle(),
          builder: (context, snapshot) {
            if(!snapshot.hasData) return const Center(child: CircularProgressIndicator(),);
            final filmler = snapshot.data!;

            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: ekranYuksekligi/2.1,
                    child: PageView.builder(
                      controller: _bannerController,
                      itemCount: bannerFilmer.length,
                      onPageChanged: (index) {
                        setState(() {
                          _currentBanner = index;
                        });
                      },
                      itemBuilder: (context, index){
                        final film = bannerFilmer[index];
                        return GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => DetaySayfa(film: film),));
                          },
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Image.asset(film.resim, fit: BoxFit.cover,),
                              Container(color: Colors.black26,),
                              Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(height: ekranYuksekligi/5.5),
                                    if (film.tabiiOrjinal) Row(mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                      Text("tabii ", style: TextStyle(color: Colors.greenAccent, fontWeight: FontWeight.bold, fontSize: ekranYuksekligi/60),),
                                      Text("orjinal dizisi", style: TextStyle(color: yaziRenk, fontWeight: FontWeight.bold, fontSize: ekranYuksekligi/60),)
                                    ],
                                    ) else Container(),
                                    SizedBox(
                                      height: ekranYuksekligi/10,
                                        child: Text(film.ad.toUpperCase(), style: TextStyle(color: yaziRenk, fontSize: ekranYuksekligi/14, fontWeight: FontWeight.bold), textAlign: TextAlign.center,)
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        if (film.premiumMu)...[
                                          Text("tabii premium ", style: TextStyle(color: Colors.greenAccent, fontWeight: FontWeight.bold, fontSize: ekranYuksekligi/60),),
                                          Icon(Icons.circle, color: yaziRenk, size: ekranYuksekligi/120,),
                                          Text(" ")
                                        ]
                                        else Text(""),
                                        if (film.yeniMi && film.kategori!.contains(Kategori.Film))...[
                                          Text("Yeni Film ", style: TextStyle(color: Colors.greenAccent, fontWeight: FontWeight.bold, fontSize: ekranYuksekligi/60),),
                                          Icon(Icons.circle, color: yaziRenk, size: ekranYuksekligi/120,),
                                        ]
                                        else if (film.yeniMi && film.kategori!.contains(Kategori.Dizi))...[
                                          Text("Yeni Dizi ", style: TextStyle(color: Colors.greenAccent, fontWeight: FontWeight.bold, fontSize: ekranYuksekligi/60),),
                                          Icon(Icons.circle, color: yaziRenk, size: ekranYuksekligi/120,),
                                        ]
                                        else Text(""),
                                        if (film.kategori!.length == 1) Text(film.kategori![0].toString(), style: TextStyle(color: yaziRenk, fontWeight: FontWeight.bold, fontSize: ekranYuksekligi/60),)
                                        else ...[
                                          Text(" ${film.kategori![0].toString().split(".")[1]} ", style: TextStyle(color: yaziRenk, fontWeight: FontWeight.bold, fontSize: ekranYuksekligi/60),),
                                          Icon(Icons.circle, color: yaziRenk, size: ekranYuksekligi/120,),
                                          Text(" ${film.kategori![1].toString().split(".")[1]} ", style: TextStyle(color: yaziRenk, fontWeight: FontWeight.bold, fontSize: ekranYuksekligi/60),),
                                        ]
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => DetaySayfa(film: film),));
                                      },
                                      child: Container(
                                        child: Text("Oynat", style: TextStyle(color: anaRenk, fontWeight: FontWeight.bold, fontSize: ekranYuksekligi/50),),
                                        decoration: BoxDecoration(color: yaziRenk, borderRadius: BorderRadius.circular(2)),
                                        height: ekranYuksekligi/20,
                                        width: ekranGenisligi/2.5,
                                        alignment: Alignment.center,

                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(ekranYuksekligi/50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(bannerFilmer.length, (i){
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 4),
                          width: ekranGenisligi / 50,
                          height: ekranGenisligi / 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: _currentBanner == i ? Colors.greenAccent : Colors.white,
                          ),
                        );
                      }),
                    ),
                  ),
                  YatayIcerikListele(baslik: "Haftanın Öne Çıkanları", filmler: bannerFilmer),
                  YatayIcerikListele(baslik: "Dizi", filmler: bannerFilmer),
                  YatayIcerikListele(baslik: "Film", filmler: bannerFilmer),
                ],
              ),
            );
          },
      ),
    );
  }
}
