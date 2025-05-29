import 'package:flutter1/model/filmes.dart';

class FilmesService{
  static final _filmes = [
    Filmes(id: 1, url:"",titulo:"" ,genero:"" ,faixa_etaria:2 ,duracao: "",pontuacao: 5,descricao:"" ,ano:1)
  ];

  List<Filmes> get filmes{
    return List.unmodifiable(_filmes);
  }

  void adicionar(Filmes contato){
    _filmes.add(contato);
  }
}