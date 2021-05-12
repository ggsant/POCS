import 'package:flutter/material.dart';

import 'generic_classes.dart';

class DropdownDialog<T> extends StatefulWidget {
  final List<DropdownMenuItem<T>> items;
  final Widget hint;
  final bool isCaseSensitiveSearch;
  final dynamic closeButton;
  final TextInputType keyboardType;
  final Function searchFn;
  final bool multipleSelection;
  final List<int> selectedItems;
  final Function displayItem;
  final dynamic doneButton;
  final Function validator;
  final bool dialogBox;
  final TypeValue<bool> displayMenu;
  final BoxConstraints menuConstraints;
  final Function callOnPop;
  final Color menuBackgroundColor;

  DropdownDialog({
    Key key,
    this.items,
    this.hint,
    this.isCaseSensitiveSearch = false,
    this.closeButton,
    this.keyboardType,
    this.searchFn,
    this.multipleSelection,
    this.selectedItems,
    this.displayItem,
    this.doneButton,
    this.validator,
    this.dialogBox,
    this.displayMenu,
    this.menuConstraints,
    this.callOnPop,
    this.menuBackgroundColor,
  })  : assert(items != null),
        super(key: key);

  _DropdownDialogState<T> createState() => _DropdownDialogState<T>();
}

class _DropdownDialogState<T> extends State<DropdownDialog> {
  TextEditingController txtSearch = TextEditingController();
  TextStyle defaultButtonStyle =
      TextStyle(fontSize: 16, fontWeight: FontWeight.w500);
  List<int> shownIndexes = [];
  Function searchFn;

  _DropdownDialogState();

  dynamic get selectedResult {
    return (widget.multipleSelection
        ? widget.selectedItems
        : widget.selectedItems?.isNotEmpty ?? false
            ? widget.items[widget.selectedItems.first]?.value
            : null);
  }

  void _updateShownIndexes(String keyword) {
    shownIndexes = searchFn(keyword, widget.items);
  }

  @override
  void initState() {
    if (widget.searchFn != null) {
      searchFn = widget.searchFn;
    } else {
      Function matchFn;
      if (widget.isCaseSensitiveSearch) {
        matchFn = (item, keyword) {
          return (item.value.toString().contains(keyword));
        };
      } else {
        matchFn = (item, keyword) {
          return (item.value
              .toString()
              .toLowerCase()
              .contains(keyword.toLowerCase()));
        };
      }
      searchFn = (keyword, items) {
        List<int> shownIndexes = [];
        int i = 0;
        widget.items.forEach((item) {
          if (matchFn(item, keyword) || (keyword?.isEmpty ?? true)) {
            shownIndexes.add(i);
          }
          i++;
        });
        return (shownIndexes);
      };
    }
    assert(searchFn != null);
    _updateShownIndexes('');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      padding: MediaQuery.of(context).viewInsets,
      duration: const Duration(milliseconds: 300),
      child: Card(
        color: widget.menuBackgroundColor,
        margin: EdgeInsets.symmetric(
            vertical: widget.dialogBox ? 10 : 5,
            horizontal: widget.dialogBox ? 10 : 4),
        child: Container(
          constraints: widget.menuConstraints,
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              // titleBar(),
              searchBar(),
              list(),
            ],
          ),
        ),
      ),
    );
  }

  Widget searchBar() {
    return Container(
      child: Stack(
        children: <Widget>[
          TextField(
            cursorColor: Colors.black,
            keyboardType: widget.keyboardType,
            controller: txtSearch,
            autofocus: true,
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            ),
            onChanged: (value) {
              _updateShownIndexes(value);
              setState(() {});
            },
          ),
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: Center(
              child: Icon(Icons.search, size: 24),
            ),
          ),
          txtSearch.text.isNotEmpty
              ? Positioned(
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        _updateShownIndexes('');
                        setState(() {
                          txtSearch.text = '';
                        });
                      },
                      borderRadius: BorderRadius.all(Radius.circular(32)),
                      child: Container(
                        width: 32,
                        height: 32,
                        child: Center(
                          child: Icon(Icons.close, size: 24),
                        ),
                      ),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }

  pop() {
    widget.displayMenu.value = false;
    if (widget.callOnPop != null) {
      widget.callOnPop();
    }
  }

  Widget list() {
    return Expanded(
      child: Scrollbar(
        child: ListView.builder(
          itemCount: shownIndexes.length,
          itemBuilder: (context, index) {
            DropdownMenuItem item = widget.items[shownIndexes[index]];
            return InkWell(
              onTap: () {
                widget.selectedItems.clear();
                widget.selectedItems.add(shownIndexes[index]);
                if (widget.doneButton == null) {
                  pop();
                } else {
                  setState(() {});
                }
              },
              child: widget.displayItem == null
                  ? item
                  : widget.displayItem(item, item.value == selectedResult),
            );
          },
        ),
      ),
    );
  }
}
