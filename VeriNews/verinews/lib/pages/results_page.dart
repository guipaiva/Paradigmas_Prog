import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
import 'package:verinews/pages/error_page.dart';
import 'package:verinews/services/fact_api.dart';
import 'package:verinews/utils/colors.dart';
import 'package:verinews/utils/news_data.dart';
import 'package:verinews/widgets/footer_text.dart';
import 'package:verinews/widgets/logo.dart';
import 'package:verinews/widgets/result_box.dart';
import 'package:verinews/widgets/search_bar.dart';
import 'package:verinews/widgets/web_screen_layout.dart';

class ResultsPage extends StatelessWidget {
  final TextEditingController query;
  const ResultsPage({Key? key, required this.query}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: SearchBar(queryString: query.text),
        centerTitle: true,
        elevation: 0,
        actions: const [FooterText(title: 'Entrar')],
        leading: Align(
          alignment: Alignment.center,
          child: InkWell(
            hoverColor: Colors.transparent,
            child: logo(fontSize: 24),
            onTap: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => const WebScreenLayout(),
                  ),
                  (route) => false);
            },
          ),
        ),
        leadingWidth: 150,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<Map<String, dynamic>>(
              future: FactCheckApi().fetchData(query: query.text),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data!.isEmpty) {
                    return ErrorPage();
                  }
                  return ListView.builder(
                    itemCount: snapshot.data?['claims'].length,
                    itemBuilder: (context, index) {
                      NewsData fact =
                          NewsData.fromJson(snapshot.data?['claims'][index]);
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ResultBox(
                          claim: fact.claim,
                          url: fact.url,
                          title: fact.title,
                          score: fact.score,
                        ),
                      );
                    },
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
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
          ),
        ],
      ),
    );
  }
}
