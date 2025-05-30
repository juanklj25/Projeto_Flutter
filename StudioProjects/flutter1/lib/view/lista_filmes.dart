import 'package:flutter/material.dart';
import 'package:flutter1/model/filmes.dart';
import 'package:flutter1/controller/filmes_controller.dart';
import 'package:flutter1/view/cadastro_filmes.dart';
import 'package:flutter1/controller/controlle_api_filme.dart';

class ListaFilmes extends StatefulWidget {
  const ListaFilmes({super.key});

  @override
  State<ListaFilmes> createState() => _ListaFilmesState();
}

class _ListaFilmesState extends State<ListaFilmes> {
  final _filmesController = FilmesController();

  List<Filmes> _filmes = [];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Listar Filmes",
      ),
      ),
      body: FutureBuilder(
          future: FilmeApiController().findAll(),
          builder: (context, snapshot){
              if(snapshot.hasData){
              final filmes = snapshot.data;
              return ListView.builder(
                itemCount: _filmes.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: Key(_filmes[index].titulo),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Icon(Icons.delete, color: Colors.white),
                    ),
                    onDismissed: (direction) {
                      final filmeRemovido = _filmes[index];
                      setState(() {
                        _filmesController.removerFilme(filmeRemovido);
                        _filmes = List.from(_filmesController.getFilmes());
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("${filmeRemovido.titulo} foi removido")),
                      );
                    },
                    child: _buildCard(index),
                  );
                },
              );
              }else if(snapshot.hasError){
                return Center(
                  child: Text("Error: ${snapshot.error}"),
                );
              }else{
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
          }
      ),
    floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const CadastrarFilmes();
          }));
          setState(() {
            _filmes = _filmesController.getFilmes();
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildCard(int index) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            _filmes[index].url,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          _filmes[index].titulo,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text("${_filmes[index].genero} • ${_filmes[index].duracao}"),
        trailing: const Icon(Icons.star, color: Colors.amber),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return CadastrarFilmes();
          }));
        },
      ),
    );
  }
}
