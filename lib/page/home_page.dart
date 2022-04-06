import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  final String getAlbums = """
    query getAlbums(\$page: Int, \$limit: Int) {
      albums(options: { paginate: { page: \$page, limit: \$limit } }) {
        data {
          id
          title
          user {
            name
            username
            email
          }
        }
      }
    }""";

    final String getOfertas = """
    query getOfertas{
      data{
        ofertas {
          id_residuo
          cantidad
        }
      }
    }""";

    final String findTodos = """
    query{
  todos {
    id
    name
    status
  }
}""";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Query(
        options: QueryOptions(
          document: gql(findTodos),
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
            return Center(child: CircularProgressIndicator());
          }
          // List albums = result.data!["albums"]["data"];
          //List ofertas = result.data!["ofertas"]["data"];
          print("\n\n");
          print(result);
          print(result.data);
          print(result.data!["todos"]);
          print(result.data!["todos"][0]);
          print(result.data!["todos"][1]);
          // List todos = result.data!["todo"];

          // return ListView.builder(
          //   itemCount: albums.length,
          //   itemBuilder: (context, index) {
          //     final album = albums[index]["id"];
              
          //     return ListTile(
          //       title: Text(album),
          //     );
          //   },
          // );
          // return ListView.builder(
          //   itemCount: todos.length,
          //   itemBuilder: (context, index) {
          //     final todo = todos[index]["id"];
          //     return ListTile(
          //       title: Text(todo),
          //     );
          //   }
          // );
          return Center();
        },
      ),
    );
  }
}