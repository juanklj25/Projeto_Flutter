import 'package:flutter1/service/filmes_services.dart';
import 'package:flutter1/model/filmes.dart';

class FilmesController{
  final _service = FilmesService();

  List<Filmes> getFilmes(){
    return _service.filmes;
  }

  void adicionar(String url, String titulo,String genero,int faixa_etaria,String duracao,int pontuacao,String descricao,int ano){
    _service.adicionar(Filmes(url: url,titulo: titulo,genero: genero,faixa_etaria:faixa_etaria,duracao: duracao,pontuacao: pontuacao,descricao: descricao,ano: ano));
  }
}