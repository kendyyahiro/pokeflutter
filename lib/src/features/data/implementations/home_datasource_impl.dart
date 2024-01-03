import 'package:pokeflutter/src/features/data/interfaces/home_datasource_interface.dart';
import 'package:pokeflutter/src/features/domain/models/pokemons_model.dart';
import 'package:http/http.dart' as http;

class HomeDatasourceImpl extends IHomeDatasource {
  @override
  Future<PokemonsModel> getHome() async {
    final url = Uri.parse('https://pokeapi.co/api/v2/pokemon/');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return PokemonsModel.fromMapList(response.body as List<dynamic>);
    }
    return PokemonsModel(results: []);
  }
}
