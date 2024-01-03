import 'package:pokeflutter/src/features/domain/interfaces/repositories/home_repository.dart';
import 'package:pokeflutter/src/features/domain/models/pokemons_model.dart';

class GetPokemonsUsecase {
  final IHomeRepository repository;

  GetPokemonsUsecase({
    required this.repository,
  });

  Future<PokemonsModel> call() => repository.getHome();
}
