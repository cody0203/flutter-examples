import 'package:flutter/material.dart';
import 'package:pokedex/src/core/enums/type.dart';
import 'package:pokedex/src/core/params/detail_params.dart';
import 'package:pokedex/src/core/utils/mapper/mapper.dart';
import 'package:pokedex/src/features/pokemon/domain/entities/list/pokemon.dart';
import 'package:pokedex/src/features/pokemon/presentation/screens/detail/pokemon_detail_screen.dart';
import 'package:pokedex/src/shared/widgets/trailing_types.dart';

class PokemonListItem extends StatelessWidget {
  const PokemonListItem({
    Key? key,
    required this.pokemon,
  }) : super(key: key);
  final PokemonInList pokemon;

  @override
  Widget build(BuildContext context) {
    final Mapper<String> mapper = Mapper<String>(
      source: pokemon.fieldPokemonType,
      sourceMap: mapTypeEnumToTypeImage,
    );

    return Container(
      padding: const EdgeInsets.only(
        top: 12,
        bottom: 12,
      ),
      margin: const EdgeInsets.only(left: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).dividerColor,
          ),
        ),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(0),
        dense: true,
        horizontalTitleGap: 13,
        leading: SizedBox(
          height: 60,
          width: 60,
          child: FadeInImage(
            image: NetworkImage(
              pokemon.avatar,
            ),
            placeholder:
                const AssetImage('assets/images/pokeball_gradient.png'),
            fit: BoxFit.contain,
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              pokemon.name,
              style: Theme.of(context).textTheme.headline3,
            ),
            Text(
              '#${pokemon.id.toString().padLeft(3, '0')}',
              style: Theme.of(context).textTheme.bodyText2,
            )
          ],
        ),
        trailing: TrailingTypes(
          imagesAsset: mapper.mapObjectToList(),
        ),
      ),
    );
  }
}
