import 'package:pokeflutter/src/features/domain/models/pokemons_model.dart';

abstract class IHomeRepository {
  Future<PokemonsModel> getHome();
}
