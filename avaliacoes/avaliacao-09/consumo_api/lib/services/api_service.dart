import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/usuario.dart';

class ApiService {

  static const String url =
      'https://jsonplaceholder.typicode.com/users';

  Future<List<Usuario>> buscarUsuarios() async {

    try {

      final response = await http.get(
        Uri.parse(url),
      );

      if (response.statusCode == 200) {

        List<dynamic> dados =
            jsonDecode(response.body);

        return dados
            .map((json) => Usuario.fromJson(json))
            .toList();

      } else {
        throw Exception(
          'Erro ao carregar usuários'
        );
      }

    } catch (e) {
      throw Exception(
        'Falha na conexão: $e'
      );
    }
  }
}