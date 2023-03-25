import 'package:flutter/material.dart';
import 'package:kuispraktikum/pokemon_data.dart';
import 'pokemon_data.dart';


class PokemonDetailPage extends StatefulWidget {
  final PokemonData pokemon;

  const PokemonDetailPage({Key? key, required this.pokemon}) : super(key: key);

  @override
  _PokemonDetailPageState createState() => _PokemonDetailPageState();
}

class _PokemonDetailPageState extends State<PokemonDetailPage> {

  void _toggleFavorite() {
    setState(() {
      widget.pokemon.isFavorite = !widget.pokemon.isFavorite;
    });
    final message = widget.pokemon.isFavorite ? 'Berhasil Menambahkan ke Favorit' : 'Berhasil Menghapus dari Favorit';
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pokemon.name),
        actions: [
          IconButton(
            icon: Icon(
              widget.pokemon.isFavorite ? Icons.favorite : Icons.favorite_border,
              color: Colors.white,
            ),
            onPressed: _toggleFavorite,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

          // Add your onPressed code here!
        },
        backgroundColor: Colors.red,
        child: const Icon(Icons.search),
      ),
      body: ListView(children: [
        Column(
          children: [
            Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Image.network(
                      widget.pokemon.image,
                      width: 300,
                    ),
                  ),
                  Text(
                    widget.pokemon.name,
                    style:
                    TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  Center(
                      child: Column(children: <Widget>[
                        Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          margin: EdgeInsets.all(20),
                          child: Table(
                            columnWidths: {
                              0: FlexColumnWidth(50),
                              1: FlexColumnWidth(300),
                            },
                            children: [
                              TableRow(children: [
                                Column(
                                  children: [Text("Type", style: TextStyle(fontWeight: FontWeight.bold))],
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                ),
                              ]),
                              TableRow(children: [
                                Column(
                                  children: [Text( "[ " + widget.pokemon.type.join(", ") + " ]")],
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                ),
                              ]),
                              TableRow(children: [
                                Column(
                                  children: [Text(" ")],
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                ),
                              ]),
                              TableRow(children: [
                                Column(
                                  children: [Text("Weakness", style: TextStyle(fontWeight: FontWeight.bold))],
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                ),
                              ]),
                              TableRow(children: [
                                Column(
                                  children: [Text("[ " +widget.pokemon.weakness.join(", ")+ " ]")],
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                ),
                              ]),
                              TableRow(children: [
                                Column(
                                  children: [Text(" ")],
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                ),
                              ]),
                            TableRow(children: [
                              Column(
                                children: [Text("Previous Evolution", style: TextStyle(fontWeight: FontWeight.bold))],
                                crossAxisAlignment: CrossAxisAlignment.center,
                              ),
                            ]),
                              TableRow(children: [
                                Column(
                                  children: [Text("[ " +widget.pokemon.prevEvolution.join(", ")+ " ]")],
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                ),
                              ]),
                              TableRow(children: [
                                Column(
                                  children: [Text(" ")],
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                ),
                              ]),
                              TableRow(children: [
                                Column(
                                  children: [Text("Next Evolution", style: TextStyle(fontWeight: FontWeight.bold))],
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                ),
                              ]),
                              TableRow(children: [
                                Column(
                                  children: [Text("[ " +widget.pokemon.nextEvolution.join(", ")+" ]")],
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                ),
                              ]),
                            ],
                          ),
                        ),
                      ])),
                ],
              ),
            ),
          ],
        )
      ]));
  }
}

class FavoriteButton extends StatefulWidget {
  final bool isFavorite;
  final VoidCallback onPressed;

  const FavoriteButton({Key? key, required this.isFavorite, required this.onPressed}) : super(key: key);

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  late Icon icon;

  @override
  void initState() {
    super.initState();
    icon = Icon(widget.isFavorite ? Icons.favorite : Icons.favorite_border);
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: icon,
        onPressed: () {
      widget.onPressed();
      setState(() {
        icon = Icon(widget.isFavorite ? Icons.favorite_border : Icons.favorite);
      });
        },
    );
  }
}