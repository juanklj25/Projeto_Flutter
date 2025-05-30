import 'package:flutter1/service/filmes_services.dart';
import 'package:flutter1/model/filmes.dart';

class FilmesController{
  final _service = FilmesService();

  Future<List<Filmes>?> findAll() async{
    return await _service.findAll();
  }

  Future<int?> save(String url, String titulo,String genero,int faixa_etaria,String duracao,int pontuacao,String descricao,int ano) async{
    return await _service.save(Filmes(url: url, titulo: titulo, genero: genero, faixa_etaria: faixa_etaria, duracao: duracao, pontuacao: pontuacao, descricao: descricao, ano: ano));
  }
}


