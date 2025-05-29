class Filmes{
  int? id;
  String url;
  String titulo;
  String genero;
  int faixa_etaria;
  String duracao;
  int pontuacao;
  String descricao;
  int ano;

  Filmes({ this.id, required this.url,required this.titulo,required this.genero,required this.faixa_etaria,required this.duracao,required this.pontuacao,required this.descricao,required this.ano});

  @override
  String toString(){
    return "[Nome: $id, Email: $url,Nome: $titulo,Nome: $genero,Nome: $faixa_etaria,Nome: $duracao,Nome: $pontuacao,Nome: $descricao,Nome: $ano]";
  }
}