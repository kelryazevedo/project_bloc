import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_bloc/Model/Dtos/enderecoDTO.dart';
import 'package:project_bloc/components/text_field_widget.dart';
import 'package:project_bloc/screen/buscaCep/cep_bloc.dart';

class CepScreen extends StatefulWidget {
  @override
  _CepScreenState createState() => _CepScreenState();
}

class _CepScreenState extends State<CepScreen> {
  CepBloc bloc = CepBloc();

  var txtCEP = TextEditingController();
  var txtEndereco = TextEditingController();
  var txtNumero = TextEditingController();
  var txtComplemento = TextEditingController();
  var txtNomeEndereco = TextEditingController();
  var txtBairro = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Busca CEP - Bloc"),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              child: Text(
                "Digite o CEP",
                style: TextStyle(
                    color: Colors.blueAccent, fontSize: 14),
              ),
              padding: EdgeInsets.only(left: 4),
            ),
            TextFieldWidget(
              textColor: Colors.blueAccent,
              backgroundColorContainer: Colors.white,
              inputType: TextInputType.number,
              mask: "#####-### ",
              onChanged: (value) {
                bloc.input.add(value);
              },
            ),
            Center(
              child: StreamBuilder<EnderecoDTO>(
                  stream: bloc.output,
                  initialData: EnderecoDTO(bairro: "Sem bairro"),

                  builder: (context, snapshot) {
                    // aqui o snapshot passa a ter o dado do enderecoDTO
                    if (snapshot.hasError) {
                      return Text(
                        "Ocorreu um erro",
                        style: TextStyle(color: Colors.red),
                      );
                    }

                    txtCEP.text = snapshot.data.cep.toString();
                    txtEndereco.text = snapshot.data.logradouro;
                    txtComplemento.text = snapshot.data.complemento;
                    txtBairro.text = snapshot.data.bairro;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        SizedBox(height: 20),
                        Padding(
                          child: Text(
                            "Endereço:",
                            style: TextStyle(
                                color: Colors.blueAccent, fontSize: 14),
                          ),
                          padding: EdgeInsets.only(left: 4),
                        ),
                        TextFieldWidget(
                          backgroundColorContainer: Colors.white,
                          textColor: Colors.blueAccent,
                          placeholder: "",
                          controller: txtEndereco,
                        ),
                        SizedBox(height: 24),
                        Padding(
                          child: Text(
                            "Bairro:",
                            style: TextStyle(
                                color: Colors.blueAccent, fontSize: 14),
                          ),
                          padding: EdgeInsets.only(left: 4),
                        ),
                        TextFieldWidget(
                          backgroundColorContainer: Colors.white,
                          textColor: Colors.blueAccent,
                          placeholder: "",
                          controller: txtBairro,
                        ),
                        SizedBox(height: 24),
                      ],
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
