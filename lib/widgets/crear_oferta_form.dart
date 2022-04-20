import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphql_frontend/models/crear_oferta_model.dart';
import 'package:flutter/material.dart';
// https://www.youtube.com/watch?v=eGwq3_0K_Sg
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'dart:convert' as convert;

class CrearOfertaForm extends StatefulWidget {
  const CrearOfertaForm({Key? key}) : super(key: key);

  @override
  _CrearOfertaFormState createState() => _CrearOfertaFormState();
}

// Front-end del formulario de direccion
class _CrearOfertaFormState extends State<CrearOfertaForm> {

  final String getTiposResiduos = """
  query {
    tipos_residuos(id_residuo: "RES02"){
      descripcion
    }
  }
  """;

    final String crearOfertaResiduos = """
    mutation CrearOfertaResiduos {
      createOfertaResiduo(id_residuo: "RES01", cantidad: 200) {
        id_oferta
        id_residuo
        cantidad
      }
    }
    """;


    final _formKey = GlobalKey<FormBuilderState>(); // Controlador del formulario

    @override
    Widget build(BuildContext context) {
      return Query(
        options: QueryOptions(
          document: gql(getTiposResiduos),
          // variables: {
            //   'page': 1,
            //   'limit': 9
            // }
            ),
        builder: (QueryResult result, {fetchMore, refetch}) {
          if (result.hasException) {
            return Text(result.exception.toString());
          }
          
          if (result.isLoading) {
            return const Text('Loading');
          }

          List<String> tiposResiduos = [''];
          
          for (var residuo in result.data!["tipos_residuos"]) {
            tiposResiduos.add(residuo["descripcion"]);
          }
            
          return FormBuilder(
            key: _formKey,
            child: Column(
              children: [
                FormBuilderDropdown(
                  name: 'residuo',
                  items: tiposResiduos.map((gender) => DropdownMenuItem(
                    value: gender,
                    child: Text('$gender'),
                    ))
                  .toList(),
                ),

                FormBuilderTextField(
                  name: 'cantidad',
                  autovalidateMode: AutovalidateMode.always,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.numeric(errorText: 'La cantidad debe ser númerica.'),
                    FormBuilderValidators.min(1),
                    (val) {
                      var number = int.tryParse(val ?? '');
                      if (number != null) if (number < 0)
                      print("Cantidades positivas");
                      return null;
                    }
                  ]),
                ),

                ElevatedButton(
                  onPressed: (){
                    _formKey.currentState?.save();
                    print(_formKey.currentState?.value);
                  },
                  child: Text("Enviar"),
                ),
              ],
            ),
          );
        },
      );
    }
  }