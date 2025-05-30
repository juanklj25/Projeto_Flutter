import 'package:flutter1/model/filmes.dart';

class FilmesService{

   final _contatoDao = ContatoDao();

   Future<List<Filmes>?> findAll() async{
   return await _contatoDao.findAll();
   }

   Future<int?> save(Filmes filme) async{
   return await _contatoDao.save(filme);
   }

   }
