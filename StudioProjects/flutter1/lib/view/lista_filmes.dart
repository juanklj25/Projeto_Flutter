import 'package:flutter/material.dart';
import 'package:flutter1/model/filmes.dart';
import 'package:flutter1/controller/filmes_controller.dart';
import 'package:flutter1/view/cadastro_filmes.dart';

class ListaFilmes extends StatefulWidget {
  const ListaFilmes({super.key});

  @override
  State<ListaFilmes> createState() => _ListaFilmesState();
}

class _ListaFilmesState extends State<ListaFilmes> {
  final _filmesController = FilmesController();
  List<Filmes> _filmes = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _filmes = _filmesController.getFilmes();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Listar Filmes"),
      ),
      body: ListView.builder(
        itemCount: _filmes.length,
        itemBuilder: (context, index) {
          return buildItemList(index);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const CadastrarFilmes();
          })).then((value) {
            setState(() {
              _filmes = _filmesController.getFilmes();
            });
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget buildItemList(index) {
    return ListTile(
      leading: const Icon(Icons.person),
      title: Text(_filmes[index].url),
      subtitle: Text(_filmes[index].duracao),
      trailing: const Icon(Icons.delete),
    );
  }
}