import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokeflutter/src/features/core/enums/item_type_enum.dart';
import 'package:pokeflutter/src/features/presentation/pages/bag/widgets/item_widget.dart';

class BagPage extends StatefulWidget {
  static String routeName = 'bag-page';
  const BagPage({super.key});

  @override
  State<BagPage> createState() => _BagPageState();
}

class _BagPageState extends State<BagPage> {
  final Dio dio = Dio();
  bool isClosed = false;
  Map<ItemTypeEnum, List> items = {};

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getStoneEvolutions();
      getKeys();
      getItemByType(ItemTypeEnum.pokeball);
      getItemByType(ItemTypeEnum.medicine);
    });
  }

  @override
  void dispose() {
    isClosed = true;
    super.dispose();
  }

  Future<void> getStoneEvolutions() async {
    try {
      if (items[ItemTypeEnum.stoneEvolutions]?.isNotEmpty ?? false) {
        return;
      }
      items[ItemTypeEnum.stoneEvolutions] = [];

      String url = ItemTypeEnum.stoneEvolutions.url;
      final Response<String> response = await dio.get(
        url,
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
      );
      final Map<String, dynamic> stoneEvolutions =
          jsonDecode(response.data!) as Map<String, dynamic>;

      for (final dynamic result in stoneEvolutions['items'] as List<dynamic>) {
        if (isClosed) break;
        final Response<String> getStone = await dio.get(
          result['url'],
          options: Options(
            contentType: Headers.formUrlEncodedContentType,
          ),
        );
        if (isClosed) break;
        items[ItemTypeEnum.stoneEvolutions]!.add(jsonDecode(getStone.data!));
        setState(() {});
      }
    } catch (_) {}
  }

  Future<void> getKeys() async {
    try {
      if (items[ItemTypeEnum.keys]?.isNotEmpty ?? false) {
        return;
      }
      items[ItemTypeEnum.keys] = [];

      String url = ItemTypeEnum.keys.url;
      final Response<String> response = await dio.get(
        url,
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
      );
      final Map<String, dynamic> keys =
          jsonDecode(response.data!) as Map<String, dynamic>;

      for (final dynamic result in keys['items'] as List<dynamic>) {
        if (isClosed) break;
        final Response<String> getKey = await dio.get(
          result['url'],
          options: Options(
            contentType: Headers.formUrlEncodedContentType,
          ),
        );
        if (isClosed) break;
        items[ItemTypeEnum.keys]!.add(jsonDecode(getKey.data!));
        setState(() {});
      }
    } catch (_) {}
  }

  Future<void> getItemByType(ItemTypeEnum type) async {
    try {
      if (items[type]?.isNotEmpty ?? false) {
        return;
      }
      items[type] = [];

      final String url = type.url;
      final Response<String> response = await dio.get(
        url,
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
      );
      final Map<String, dynamic> itemsByType =
          jsonDecode(response.data!) as Map<String, dynamic>;

      for (final dynamic result in itemsByType['categories'] as List<dynamic>) {
        if (isClosed) break;
        final Response<String> getItemsByType = await dio.get(
          result['url'],
          options: Options(
            contentType: Headers.formUrlEncodedContentType,
          ),
        );
        if (isClosed) break;

        final Map<String, dynamic> itemsByType =
            jsonDecode(getItemsByType.data!) as Map<String, dynamic>;

        for (final dynamic result in itemsByType['items'] as List<dynamic>) {
          if (isClosed) break;
          final Response<String> getItemsByCategories = await dio.get(
            result['url'],
            options: Options(
              contentType: Headers.formUrlEncodedContentType,
            ),
          );
          if (isClosed) break;
          items[type]!.add(jsonDecode(getItemsByCategories.data!));
          setState(() {});
        }
      }
      print(items[type]);
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: ItemTypeEnum.values.length,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            'Bag',
            style: TextStyle(fontSize: 14, color: Colors.black87),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          bottom: TabBar(
            indicatorColor: Colors.black,
            tabs: ItemTypeEnum.values
                .map(
                  (tabName) => Tab(
                    child: tabName.widget ??
                        SvgPicture.asset(
                          'assets/icons/poke-ball.svg',
                          fit: BoxFit.contain,
                          height: 28,
                          width: 28,
                        ),
                  ),
                )
                .toList(),
          ),
        ),
        body: TabBarView(
          children: ItemTypeEnum.values
              .map((type) => ItemWidget(items: items[type]))
              .toList(),
        ),
      ),
    );
  }
}
