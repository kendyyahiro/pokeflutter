import 'package:pokeflutter/src/features/domain/models/pokemons_model.dart';

abstract class IGetHomeUsecase {
  Future<PokemonsModel> call();
}
