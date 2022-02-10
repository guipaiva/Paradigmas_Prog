import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('oops.png'),
        const Text(
          'Não foram encontradas notícias para os termos de pesquisa',
          style: TextStyle(color: Color(0xff70757a), fontSize: 24),
        )
      ],
    );
  }
}
