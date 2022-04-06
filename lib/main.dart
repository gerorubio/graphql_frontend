import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphql_frontend/page/home_page.dart';
//https://www.youtube.com/watch?v=_b0tJ7zfv0g&t=81s

void main() async {
  await initHiveForFlutter();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  //final HttpLink httpLink = new HttpLink('https://graphqlzero.almansi.me/api');
  final HttpLink httpLink = new HttpLink('http://127.0.0.1:8080/graphql');

  @override
  Widget build(BuildContext context) {

    final ValueNotifier<GraphQLClient> client = ValueNotifier<GraphQLClient>(
      GraphQLClient(
        cache: GraphQLCache(store: HiveStore()),
        link: httpLink
      )
    );

    return GraphQLProvider(
      client: client,
      child: MaterialApp(
      title: 'Material App',
        home: HomePage(),
      ),
    );
  }
}