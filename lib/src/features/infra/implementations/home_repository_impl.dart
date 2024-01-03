import 'package:pokeflutter/src/features/data/interfaces/home_datasource_interface.dart';
import 'package:pokeflutter/src/features/domain/interfaces/repositories/home_repository.dart';
import 'package:pokeflutter/src/features/domain/models/pokemons_model.dart';

class HomeRepositoryImpl extends IHomeRepository {
  final IHomeDatasource datasource;
  HomeRepositoryImpl({required this.datasource});

  @override
  Future<PokemonsModel> getHome() => datasource.getHome();
}
