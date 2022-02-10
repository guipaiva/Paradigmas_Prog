import 'package:flutter/material.dart';
import 'package:verinews/pages/results_page.dart';
import 'package:verinews/utils/colors.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key, this.queryString = ""}) : super(key: key);
  final String queryString;

  @override
  Widget build(BuildContext context) {
    TextEditingController query =
        TextEditingController.fromValue(TextEditingValue(text: queryString));
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.5,
      child: Material(
        elevation: 10,
        shadowColor: primaryColor,
        borderRadius: BorderRadius.circular(10),
        child: TextField(
          controller: query,
          onSubmitted: (value) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ResultsPage(query: query),
              ),
            );
          },
          keyboardType: TextInputType.text,
          cursorColor: primaryColor,
          decoration: const InputDecoration(
            suffixIcon: Icon(Icons.search, color: Colors.black87),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(10))),
          ),
        ),
      ),
    );
  }
}
