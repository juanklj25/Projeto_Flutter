import 'dart:convert';
import 'dart:io';
import 'package:flutter1/config/filme_api.dart';
import 'package:flutter1/model/filmes.dart';
import 'package:http/http.dart' as http;

class FilmeApiController{

  Future<List<Filmes>> findAll() async{
    final response = await http.get(Uri.parse("${FilmeApiConfig.url}/filmes"), headers: FilmeApiConfig.headers);

    if(response.statusCode == 200){
      final jsonData = jsonDecode(response.body);

      List<Filmes> filme = [];
      for(var map in jsonData){
        filme.add(Filmes.fromJson(map));
      }

      return filme;
    }else{
      throw HttpException("Erro ao consultar os dados: ${response.statusCode}");
    }
  }
}