import 'package:pokeflutter/src/features/domain/models/pokemons_model.dart';

abstract class IHomeDatasource {
  Future<PokemonsModel> getHome();
}
