import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:page_transition/page_transition.dart';
import 'package:spofityclone/paginas/detalleCanciones.dart';
import 'package:spofityclone/paginas/home.dart';
import '../constantes/const.dart';

class AlbumPagina extends StatefulWidget {
  final dynamic song;

  const AlbumPagina({Key? key, this.song}) : super(key: key);

  @override
  State<AlbumPagina> createState() => _AlbumPaginaState();
}

class _AlbumPaginaState extends State<AlbumPagina> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      /* appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        actions: [
          IconButton(
              icon: Icon(
                Feather.more_vertical,
                color: Colors.white,
              ),
              onPressed: null)
        ],
      ),*/
      body: Reproductor(),
    );
  }

  Widget Reproductor() {
    var tamanio = MediaQuery.of(context).size;
    List songAlbums = widget.song['songs'];
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: 70,
              ),
              Container(
                width: tamanio.width,
                height: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    image: DecorationImage(
                        image: AssetImage(widget.song['img']),
                        fit: BoxFit.scaleDown)),
              ),
              SizedBox(
                height: 9,
              ),
              Container(
                decoration: BoxDecoration(
                    //color: Colors.grey,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 12, right: 12, top: 8, bottom: 8),
                  child: Text(
                    "Seguir",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 100,
                ),
                Text(
                  widget.song['title'],
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 500,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(left: 30, top: 200),
              child: Row(
                children: List.generate(animals.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 30, top: 200),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  child: CancionesDetalle(
                                    title: animals[index]['title'],
                                    description: animals[index]['description'],
                                    img: animals[index]['img'],
                                    songUrl: animals[index]['song_url'],
                                  ),
                                  type: PageTransitionType.scale));
                        },
                        child: Column(children: [
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: tamanio.width - 210,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [],
                            ),
                          )
                        ])),
                  );
                }),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 400),
            child: Column(
                children: List.generate(songAlbums.length, (index) {
              return Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, bottom: 10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            alignment: Alignment.bottomCenter,
                            child: CancionesDetalle(
                              title: widget.song['title'],
                              description: widget.song['description'],
                              img: widget.song['img'],
                              songUrl: widget.song['song_url'],
                            ),
                            type: PageTransitionType.scale));
                  },
                  child: Row(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: (tamanio.width - 60),
                          padding: EdgeInsets.only(left: 2, right: 2, top: 20),
                          child: Text(
                            "${index + 1}  " + songAlbums[index]['title'],
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            })),
          ),
          SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                IconButton(
                    icon: Icon(
                      Feather.more_vertical,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    })
              ],
            ),
          )
        ],
      ),
//safearea
    );
  }
}
