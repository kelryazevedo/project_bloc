import 'dart:async';

import 'package:dio/dio.dart';
import 'package:project_bloc/Model/Dtos/enderecoDTO.dart';

class CepBloc {
  final StreamController<String> _streamController = StreamController();

  Sink get input => _streamController.sink;
  Stream<EnderecoDTO> get output => _streamController.stream
      .where((cep) => cep.length >= 7) // começar a chamar esse cara apenas quando tiver no minimo 7 caracteres
      .asyncMap((cep) => _searchCep(cep)); // chama a funcao aqui já passando o parametro

  String url(String cep) => 'https://viacep.com.br/ws/$cep/json/';

  Future<EnderecoDTO>_searchCep(String cep) async {
    Response response = await Dio().get(url(cep.replaceAll("-", "")));
    return EnderecoDTO.fromJson(response.data);
  }
}
