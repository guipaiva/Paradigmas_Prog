import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ResultBox extends StatefulWidget {
  const ResultBox(
      {Key? key,
      required this.claim,
      required this.url,
      required this.title,
      required this.score})
      : super(key: key);

  final String claim;
  final String url;
  final String title;
  final String score;

  @override
  State<ResultBox> createState() => _ResultBoxState();
}

class _ResultBoxState extends State<ResultBox> {
  bool _upCounter = false;
  bool _downCounter = false;

  void _incrementCounter(String which) {
    setState(() {
      if (which == 'down') {
        if (_upCounter) _upCounter = !_upCounter;
        _downCounter = !_downCounter;
      } else {
        if (_downCounter) _downCounter = !_downCounter;
        _upCounter = !_upCounter;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Center(
      child: Container(
        color: const Color.fromARGB(255, 235, 235, 235),
        height: 130,
        width: 0.8 * size.width,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.claim,
                        softWrap: true,
                        style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 18,
                        )),
                    Text(widget.title,
                        style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 18,
                        )),
                    InkWell(
                      child: const Text('Confira aqui a fonte',
                          style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 18,
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          )),
                      onTap: () async {
                        if (await canLaunch(widget.url)) {
                          await launch(widget.url);
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.score,
                      style: const TextStyle(
                          fontSize: 18, overflow: TextOverflow.ellipsis),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.thumb_up),
                          color: Colors.green,
                          onPressed: () {
                            _incrementCounter('up');
                          },
                        ),
                        Text('${_upCounter ? 1 : 0}'),
                        const SizedBox(width: 5),
                        IconButton(
                          icon: const Icon(
                            Icons.thumb_down,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            _incrementCounter('down');
                          },
                        ),
                        Text('${_downCounter ? 1 : 0}'),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
