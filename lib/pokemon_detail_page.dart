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
      body: Column(

        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          Container(
            height: MediaQuery.of(context).size.height/3,
            alignment: Alignment.topCenter,
            child: Image.network(
              widget.pokemon.image,
              fit: BoxFit.scaleDown,
            ),
          ),

          Container(
            height: 30,
            alignment: Alignment.topCenter,
            child: Text(
              widget.pokemon.name,
              style: const TextStyle(
                fontSize: 20,fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Text(
            "Type",
            style: const TextStyle(
              fontSize: 14,fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 30,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.pokemon.type.length,
              itemBuilder: (BuildContext context, int index) => Container(
                child : Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("[ "+widget.pokemon.type[index]+"]"),
                  ],
                ),
              ),
            ),
          ),
          Text(
            "Weakness",
            style: const TextStyle(
              fontSize: 14,fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          Container(
            width: 1000,
            height: 30,
            alignment: Alignment.center,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.pokemon.weakness.length,
              itemBuilder: (BuildContext context, int index) => Container(
                child : Center(
                  child : Text("[ "+widget.pokemon.weakness[index]+"]"),
                ),
              ),
            ),
          ),
          Text(
            "Previous Evolution",
            style: const TextStyle(
              fontSize: 14,fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          Container(
            width: 1000,
            height: 30,
            alignment: Alignment.center,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.pokemon.prevEvolution.length,
              itemBuilder: (BuildContext context, int index) => Container(
                child : Center(
                  child : Text("[ "+widget.pokemon.prevEvolution[index]+"]"),
                ),
              ),
            ),
          ),
          Text(
            "Next Evolution",
            style: const TextStyle(
              fontSize: 14,fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          Container(
            width: 1000,
            height: 30,
            alignment: Alignment.center,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.pokemon.nextEvolution.length,
              itemBuilder: (BuildContext context, int index) => Container(
                child : Center(
                  child : Text("[ "+widget.pokemon.nextEvolution[index]+"]"),
                ),
              ),
            ),
          ),

        ],
      ),
    );
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