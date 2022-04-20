import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:graphql_frontend/widgets/crear_oferta_form.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Container(
        child: CrearOfertaForm(),
      )
    );
  }
}

  //  final String getOfertas = """
  //   query getOfertas{
  //       ofertas {
  //         id_residuo
  //         cantidad
  //       }
  //   }""";

  //   final String findTodos = """
  //   query{
  //     todo{
  //       id
  //       name
  //       status
  //     }
  //   }""";

  //   final String createTodo = """
  //   mutation {
  //     createTodo(name: "Todo 2") {
  //       id
  //       name
  //       status
  //     }
  //   }
  //   """;

  //   final String getTiposResiduos = """
  //   query {
  //     tipos_residuos{
  //       descripcion
  //     }
  //   }""";