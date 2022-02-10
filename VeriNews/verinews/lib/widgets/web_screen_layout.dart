import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
import 'package:verinews/utils/colors.dart';
import 'package:verinews/widgets/footer_text.dart';
import 'search_area.dart';

class WebScreenLayout extends StatelessWidget {
  const WebScreenLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        actions: const [
          FooterText(title: 'Entrar'),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              child: const SearchArea(),
              alignment: Alignment.center,
            ),
          ),
          const SizedBox(
            height: 50.0,
          ),
          Footer(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                FooterText(title: 'Sobre'),
                FooterText(title: 'Contato'),
                FooterText(title: 'Termos de Uso'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
