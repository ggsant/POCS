import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'generic_classes.dart';
import 'widgets_search_dropdown.dart';

class SearchableDropdown<T> extends StatefulWidget {
  final List<DropdownMenuItem<T>> items;
  final Function onChanged;
  final T value;
  final dynamic searchHint;
  final bool dialogBox;
  final dynamic hint;
  final BoxConstraints menuConstraints;
  final dynamic icon;
  final double iconSize;
  final bool isExpanded;
  final bool isCaseSensitiveSearch;
  final bool displayClearIcon;
  final Icon clearIcon;
  final TextInputType keyboardType;
  final bool readOnly;
  final Function selectedValueWidgetFn;

  factory SearchableDropdown.single({
    Key key,
    @required List<DropdownMenuItem<T>> items,
    @required Function onChanged,
    T value,
    TextStyle style,
    dynamic searchHint,
    dynamic hint,
    dynamic disabledHint,
    dynamic icon = const Icon(Icons.arrow_drop_down),
    dynamic underline,
    bool displayClearIcon = true,
    Icon clearIcon = const Icon(Icons.clear),
    double iconSize = 24.0,
    bool isExpanded = false,
    bool isCaseSensitiveSearch = false,
    TextInputType keyboardType = TextInputType.text,
    bool assertUniqueValue = true,
    bool dialogBox = true,
    BoxConstraints menuConstraints,
    bool readOnly = false,
    Color menuBackgroundColor,
  }) {
    return (SearchableDropdown._(
      key: key,
      items: items,
      onChanged: onChanged,
      value: value,
      searchHint: searchHint,
      hint: hint,
      icon: icon,
      iconSize: iconSize,
      isExpanded: isExpanded,
      isCaseSensitiveSearch: isCaseSensitiveSearch,
      displayClearIcon: displayClearIcon,
      clearIcon: clearIcon,
      keyboardType: keyboardType,
      dialogBox: dialogBox,
      menuConstraints: menuConstraints,
      readOnly: readOnly,
    ));
  }

  SearchableDropdown._({
    Key key,
    @required this.items,
    this.onChanged,
    this.value,
    this.searchHint,
    this.hint,
    this.icon,
    this.iconSize = 24.0,
    this.isExpanded = false,
    this.isCaseSensitiveSearch = false,
    this.displayClearIcon = true,
    this.clearIcon = const Icon(Icons.clear),
    this.selectedValueWidgetFn,
    this.keyboardType = TextInputType.text,
    this.dialogBox,
    this.menuConstraints,
    this.readOnly = false,
  })  : assert(items != null),
        assert(iconSize != null),
        assert(isExpanded != null),
        assert(menuConstraints == null || !dialogBox),
        super(key: key);

  SearchableDropdown({
    Key key,
    @required this.items,
    @required this.onChanged,
    this.value,
    this.searchHint,
    this.dialogBox = true,
    this.hint,
    this.menuConstraints,
    this.icon = const Icon(Icons.arrow_drop_down),
    this.iconSize = 24.0,
    this.isExpanded = false,
    this.isCaseSensitiveSearch = false,
    this.displayClearIcon = false,
    this.clearIcon = const Icon(Icons.clear),
    this.selectedValueWidgetFn,
    this.keyboardType = TextInputType.text,
    this.readOnly = false,
  })  : assert(items != null),
        assert(iconSize != null),
        assert(isExpanded != null),
        assert(menuConstraints == null || !dialogBox),
        super(key: key);

  @override
  _SearchableDropdownState<T> createState() => _SearchableDropdownState();
}

class _SearchableDropdownState<T> extends State<SearchableDropdown<T>> {
  List<int> selectedItems;
  TypeValue<bool> displayMenu = TypeValue<bool>(false);

  bool get _enabled =>
      widget.items != null &&
      widget.items.isNotEmpty &&
      widget.onChanged != null;

  bool get hasSelection {
    return (selectedItems != null && selectedItems.isNotEmpty);
  }

  dynamic get selectedResult {
    return (selectedItems?.isNotEmpty ?? false
        ? widget.items[selectedItems.first]?.value
        : null);
  }

  int indexFromValue(T value) {
    return (widget.items.indexWhere((item) {
      return (item.value == value);
    }));
  }

  @override
  void initState() {
    _updateSelectedIndex();
    super.initState();
  }

  void _updateSelectedIndex() {
    if (!_enabled) {
      return;
    }
    if (widget.value != null) {
      int i = indexFromValue(widget.value);
      if (i != null && i != -1) {
        selectedItems = [i];
      }
    }
    if (selectedItems == null) selectedItems = [];
  }

  @override
  void didUpdateWidget(SearchableDropdown oldWidget) {
    super.didUpdateWidget(oldWidget);
    _updateSelectedIndex();
  }

  Widget get menuWidget {
    return (DropdownDialog(
      items: widget.items,
      hint: WidgetsSearchDropDown.prepareWidget(widget.searchHint),
      isCaseSensitiveSearch: widget.isCaseSensitiveSearch,
      keyboardType: widget.keyboardType,
      selectedItems: selectedItems,
      dialogBox: widget.dialogBox,
      displayMenu: displayMenu,
      menuConstraints: widget.menuConstraints,
      callOnPop: () {
        if (!widget.dialogBox &&
            widget.onChanged != null &&
            selectedItems != null) {
          widget.onChanged(selectedResult);
        }
        setState(() {});
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> items =
        _enabled ? List<Widget>.from(widget.items) : <Widget>[];
    int hintIndex;
    if (widget.hint != null) {
      final Widget emplacedHint =
          WidgetsSearchDropDown.prepareWidget(widget.hint);

      hintIndex = items.length;
      items.add(DefaultTextStyle(
        style: TextStyle(color: Colors.black),
        child: IgnorePointer(
          child: emplacedHint,
          ignoringSemantics: false,
        ),
      ));
    }
    Widget innerItemsWidget;
    List<Widget> list = [];
    selectedItems?.forEach((item) {
      list.add(widget.selectedValueWidgetFn != null
          ? widget.selectedValueWidgetFn(widget.items[item].value)
          : items[item]);
    });
    if (list.isEmpty && hintIndex != null) {
      innerItemsWidget = items[hintIndex];
    } else {
      innerItemsWidget = Column(children: list);
    }
    final EdgeInsetsGeometry padding = ButtonTheme.of(context).alignedDropdown
        ? EdgeInsetsDirectional.only(start: 16.0, end: 4.0)
        : EdgeInsets.zero;

    Widget clickable = InkWell(
        onTap: (widget.readOnly ?? false) || !_enabled
            ? null
            : () async {
                if (widget.dialogBox) {
                  await showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (context) {
                        return (menuWidget);
                      });
                  if (widget.onChanged != null && selectedItems != null) {
                    widget.onChanged(selectedResult);
                  }
                } else {
                  displayMenu.value = true;
                }
                setState(() {});
              },
        child: Row(
          children: <Widget>[
            widget.isExpanded
                ? Expanded(child: innerItemsWidget)
                : innerItemsWidget,
            IconTheme(
              data: IconThemeData(
                color: Colors.black,
                size: widget.iconSize,
              ),
              child: WidgetsSearchDropDown.prepareWidget(widget.icon,
                      parameter: selectedResult) ??
                  SizedBox.shrink(),
            ),
          ],
        ));

    Widget result = DefaultTextStyle(
      style: TextStyle(color: Colors.black),
      child: Container(
        padding: padding.resolve(Directionality.of(context)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            widget.isExpanded ? Expanded(child: clickable) : clickable,
            !widget.displayClearIcon
                ? SizedBox()
                : InkWell(
                    onTap: hasSelection && _enabled && !widget.readOnly
                        ? () {
                            clearSelection();
                          }
                        : null,
                    child: Container(
                      padding: padding.resolve(Directionality.of(context)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          IconTheme(
                            data: IconThemeData(
                              color: Colors.black,
                              size: widget.iconSize,
                            ),
                            child: widget.clearIcon ?? Icon(Icons.clear),
                          ),
                        ],
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );

    final double bottom = 8.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox.shrink(),
        Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
              child: result,
            ),
            Positioned(
              left: 0.0,
              right: 0.0,
              bottom: bottom,
              child: Container(
                height: 1.0,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color(0xFFBDBDBD),
                      width: 0.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox.shrink(),
        displayMenu.value ? menuWidget : SizedBox.shrink(),
      ],
    );
  }

  clearSelection() {
    selectedItems.clear();
    if (widget.onChanged != null) {
      widget.onChanged(selectedResult);
    }

    setState(() {});
  }
}

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
