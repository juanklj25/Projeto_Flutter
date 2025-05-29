import 'package:flutter1/controller/filmes_controller.dart';
import 'package:flutter/material.dart';

class CadastrarFilmes extends StatefulWidget {
  const CadastrarFilmes({super.key});

  @override
  State<CadastrarFilmes> createState() => _CadastrarContatoState();
}

class _CadastrarContatoState extends State<CadastrarFilmes> {
  final _key = GlobalKey<FormState>();
  final _edtUrl = TextEditingController();
  final _edtTitulo = TextEditingController();
  final _edtGenero = TextEditingController();
  final _edtfaixa_etaria = TextEditingController();
  final _edtduracao = TextEditingController();
  final _edtdescricao = TextEditingController();
  final _edtpontuacao = TextEditingController();
  final _edtano = TextEditingController();
  final _filmesController = FilmesController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastrar Contato"),
      ),
      body: Container(
        margin: const EdgeInsets.all(8),
        child: Form(
          key: _key,
          child: Column(
            children: [
              TextFormField(
                controller: _edtUrl,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    labelText: "Url"
                ),
                validator: (value){
                  if(value == null || value.isEmpty){
                    return "Campo Obrigatório";
                  }
                  return null;
                } ,
              ),
              TextFormField(
                controller: _edtTitulo,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    labelText: "Titulo"
                ),
                validator: (value){
                  if(value == null || value.isEmpty){
                    return "Campo Obrigatório";
                  }
                  return null;
                } ,
              ),TextFormField(
                controller: _edtGenero,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    labelText: "Titulo"
                ),
                validator: (value){
                  if(value == null || value.isEmpty){
                    return "Campo Obrigatório";
                  }
                  return null;
                } ,
              ),TextFormField(
                controller: _edtfaixa_etaria,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                    labelText: "Titulo"
                ),
                validator: (value){
                  if(value == null || value.isEmpty){
                    return "Campo Obrigatório";
                  }
                  return null;
                } ,
              ),TextFormField(
                controller: _edtduracao,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    labelText: "Titulo"
                ),
                validator: (value){
                  if(value == null || value.isEmpty){
                    return "Campo Obrigatório";
                  }
                  return null;
                } ,
              ),TextFormField(
                controller: _edtdescricao,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    labelText: "Titulo"
                ),
                validator: (value){
                  if(value == null || value.isEmpty){
                    return "Campo Obrigatório";
                  }
                  return null;
                } ,
              ),TextFormField(
                controller: _edtpontuacao,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                    labelText: "Titulo"
                ),
                validator: (value){
                  if(value == null || value.isEmpty){
                    return "Campo Obrigatório";
                  }
                  return null;
                } ,
              ),TextFormField(
                controller: _edtano,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                    labelText: "Titulo"
                ),
                validator: (value){
                  if(value == null || value.isEmpty){
                    return "Campo Obrigatório";
                  }
                  return null;
                }
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          final valid = _key.currentState!.validate();
          if(!valid){
            return;
          }
          _filmesController.adicionar( _edtUrl.text, _edtTitulo.text,_edtGenero.text,_edtfaixa_etaria.hashCode,_edtduracao.text,_edtpontuacao.hashCode,_edtdescricao.text,_edtano.hashCode);

          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Cadastrado com Sucesso"))
          );
          Navigator.pop(context);
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}
