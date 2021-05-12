import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'custom.dart';
import 'generic_classes.dart';
import 'prepare_widget.dart';

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

  factory SearchableDropdown.citys({
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

  @override
  void initState() {
    _updateSelectedIndex();
    super.initState();
  }

  @override
  void didUpdateWidget(SearchableDropdown oldWidget) {
    super.didUpdateWidget(oldWidget);
    _updateSelectedIndex();
  }

  clearSelection() {
    selectedItems.clear();
    if (widget.onChanged != null) {
      widget.onChanged(selectedResult);
    }

    setState(() {});
  }

  Widget get menuWidget {
    return (DropdownDialog(
      items: widget.items,
      hint: PrepareWidget.prepareWidget(widget.searchHint),
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
    int hintIndex;
    Widget innerItemsWidget;
    List<Widget> list = [];

    final double bottom = 8.0;

    final List<Widget> items = List<Widget>.from(widget.items);

    final EdgeInsetsGeometry padding = ButtonTheme.of(context).alignedDropdown
        ? EdgeInsetsDirectional.only(start: 16.0, end: 4.0)
        : EdgeInsets.zero;

    if (widget.hint != null) {
      final Widget emplacedHint = PrepareWidget.prepareWidget(widget.hint);

      hintIndex = items.length;
      items.add(DefaultTextStyle(
        style: TextStyle(color: Colors.black),
        child: IgnorePointer(
          child: emplacedHint,
          ignoringSemantics: false,
        ),
      ));
    }

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

    Widget clickable = InkWell(
      onTap: (widget.readOnly ?? false) || !_enabled
          ? null
          : () async {
              displayMenu.value = true;
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
            child: PrepareWidget.prepareWidget(widget.icon,
                    parameter: selectedResult) ??
                SizedBox.shrink(),
          ),
        ],
      ),
    );

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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox.shrink(),
        Stack(
          children: <Widget>[
            Padding(padding: EdgeInsets.all(10.0), child: result),
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
}
