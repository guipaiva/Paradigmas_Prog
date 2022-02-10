import 'package:flutter/material.dart';
import 'package:verinews/widgets/logo.dart';
import 'package:verinews/widgets/search_bar.dart';

class SearchArea extends StatelessWidget {
  const SearchArea({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: logo(fontSize: 72),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: SearchBar(),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Verifique sua notícia a partir de fontes confiáveis'),
        ),
      ],
    );
  }
}
