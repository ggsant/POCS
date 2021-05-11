import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:search_drop/custom.dart';

class ExampleNumber {
  int number;

  static final Map<int, String> map = {
    0: "zero",
    1: "one",
    2: "two",
    3: "three",
    4: "four",
    5: "five",
    6: "six",
    7: "seven",
    8: "eight",
    9: "nine",
    10: "ten",
    11: "eleven",
    12: "twelve",
    13: "thirteen",
    14: "fourteen",
    15: "fifteen",
  };

  String get numberString {
    return (map.containsKey(number) ? map[number] : "unknown");
  }

  ExampleNumber(this.number);

  String toString() {
    return ("$number $numberString");
  }

  static List<ExampleNumber> get list {
    return (map.keys.map((num) {
      return (ExampleNumber(num));
    })).toList();
  }
}

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool asTabs = false;
  String selectedValue;
  String preselectedValue = "dolor sit";
  ExampleNumber selectedNumber;
  List<int> selectedItems = [];
  final List<DropdownMenuItem> items = [];

  static const String appTitle = "Search Choices demo";
  final String loremIpsum =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

  @override
  void initState() {
    String wordPair = "";
    loremIpsum
        .toLowerCase()
        .replaceAll(",", "")
        .replaceAll(".", "")
        .split(" ")
        .forEach((word) {
      if (wordPair.isEmpty) {
        wordPair = word + " ";
      } else {
        wordPair += word;
        if (items.indexWhere((item) {
              return (item.value == wordPair);
            }) ==
            -1) {
          items.add(DropdownMenuItem(
            child: Text(wordPair),
            value: wordPair,
          ));
        }
        wordPair = "";
      }
    });
    super.initState();
  }

  List<Widget> get appBarActions {
    return ([
      Center(child: Text("Tabs:")),
      Switch(
        activeColor: Colors.white,
        value: asTabs,
        onChanged: (value) {
          setState(() {
            asTabs = value;
          });
        },
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    Map<String, Widget> widgets;
    widgets = {
      //todo: esse aqui
      "Single menu": SearchableDropdown.single(
        items: items,
        value: selectedValue,
        hint: "Cidades",
        searchHint: null,
        onChanged: (value) {
          setState(() {
            selectedValue = value;
          });
        },
        dialogBox: false,
        isExpanded: true,
        menuConstraints: BoxConstraints.tight(Size.fromHeight(350)),
      ),
    };

    return MaterialApp(
      home: asTabs
          ? DefaultTabController(
              length: widgets.length,
              child: Scaffold(
                appBar: AppBar(
                  title: const Text(appTitle),
                  actions: appBarActions,
                  bottom: TabBar(
                    isScrollable: true,
                    tabs: Iterable<int>.generate(widgets.length)
                        .toList()
                        .map((i) {
                      return (Tab(
                        text: (i + 1).toString(),
                      ));
                    }).toList(), //widgets.keys.toList().map((k){return(Tab(text: k));}).toList(),
                  ),
                ),
                body: Container(
                  padding: EdgeInsets.all(20),
                  child: TabBarView(
                    children: widgets
                        .map((k, v) {
                          return (MapEntry(
                              k,
                              SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Column(children: [
                                  Text(k),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  v,
                                ]),
                              )));
                        })
                        .values
                        .toList(),
                  ),
                ),
              ),
            )
          : Scaffold(
              appBar: AppBar(
                title: const Text(appTitle),
                actions: appBarActions,
              ),
              body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: widgets
                      .map((k, v) {
                        return (MapEntry(
                            k,
                            Center(
                                child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: BorderSide(
                                        color: Colors.grey,
                                        width: 1.0,
                                      ),
                                    ),
                                    margin: EdgeInsets.all(20),
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Column(
                                        children: <Widget>[
                                          Text("$k:"),
                                          v,
                                        ],
                                      ),
                                    )))));
                      })
                      .values
                      .toList(),
                ),
              ),
            ),
    );
  }
}
