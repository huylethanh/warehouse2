import 'package:flutter/material.dart';
import 'package:warehouse_app/utils/index.dart';

import '../utils/debouncer.dart';

class SearchAppBar extends StatefulWidget implements PreferredSizeWidget {
  final Widget? title;
  final Function(String value)? onChanged;
  final Function()? closeSearch;
  final bool usingCloseButton;
  final List<Widget> actions;
  final int typingDelay;
  final String hintText;
  final bool centerTitle;

  // minimunCharToSearch = 0 for searching on memory.
  //Set this field to 0, the onChanged will trigger when the text is empty
  final int minimumCharToSearch;
  final bool canSearch;
  final bool showLeadingButton;
  final Icon? searchIcon;
  final PreferredSizeWidget? bottom;
  final Widget? leadingButton;

  final bool onlyDoSearchOnSubmitted;
  final ShapeBorder? shapeBorder;
  final double? leadingWidth;
  final double? titleSpacing;

  final BoxDecoration? customSearchDecoration;
  final EdgeInsets? searchContentPadding;

  final bool autofocus;

  const SearchAppBar({
    Key? key,
    this.title,
    this.onChanged,
    this.closeSearch,
    this.usingCloseButton = false,
    this.typingDelay = 300,
    this.hintText = "Search",
    this.minimumCharToSearch = 1,
    this.canSearch = true,
    this.centerTitle = true,
    this.searchIcon,
    this.showLeadingButton = true,
    this.bottom,
    this.actions = const [],
    this.leadingButton,
    this.onlyDoSearchOnSubmitted = false,
    this.shapeBorder,
    this.leadingWidth,
    this.titleSpacing,
    this.customSearchDecoration,
    this.searchContentPadding,
    this.autofocus = false,
  }) : super(key: key);
  @override
  _SearchAppBarState createState() => _SearchAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _SearchAppBarState extends State<SearchAppBar> {
  bool isSearchViewClicked = false;
  String? searchText;
  late Debouncer _debounced;
  late String? hintText = widget.hintText;

  @override
  void initState() {
    super.initState();
    isSearchViewClicked = widget.autofocus;
    if (hintText.isNullOrEmptyEx()) {
      hintText = "Search";
    }
    _debounced = Debouncer(milliseconds: widget.typingDelay);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant SearchAppBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.canSearch != widget.canSearch) {
      isSearchViewClicked = false;
      searchText = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return searchableAppBar();
  }

  Widget searchableAppBar() {
    final actions = <Widget>[];
    if (widget.canSearch) {
      actions.add(_renderSearchIcon());
    }

    actions.addAll(widget.actions);

    return AppBar(
      leadingWidth: widget.leadingWidth,
      centerTitle: widget.centerTitle,
      automaticallyImplyLeading: !widget.usingCloseButton,
      bottom: widget.bottom,
      shape: widget.shapeBorder,
      leading: !widget.showLeadingButton
          ? Container()
          : (widget.leadingButton !=
                  null //If no leading button provided, show the arrow one
              ? widget.leadingButton!
              : const BackButton()),
      titleSpacing: widget.titleSpacing,
      title: isSearchViewClicked
          ? Container(
              decoration: widget.customSearchDecoration,
              padding: widget.searchContentPadding,
              child: TextField(
                onChanged: widget.onlyDoSearchOnSubmitted
                    ? null
                    : (value) {
                        // minimunCharToSearch = 0 for searching on memory.
                        if (widget.minimumCharToSearch != 0) {
                          if (value == searchText) {
                            return;
                          }

                          if (value.length < widget.minimumCharToSearch) {
                            return;
                          }
                        }

                        _debounced.run(() {
                          widget.onChanged!(value);
                        });

                        setState(() {
                          searchText = value;
                        });
                      },
                onSubmitted: (value) {
                  if (widget.onlyDoSearchOnSubmitted) {
                    widget.onChanged!(value);
                    return;
                  }

                  isSearchViewClicked = false;
                  setState(() {
                    searchText = null;
                  });
                },
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: widget.hintText,
                  hintStyle: const TextStyle(fontSize: 14),
                ),
                autofocus: true,
              ),
            )
          : widget.title,
      actions: actions,
    );
  }

  Widget _renderSearchIcon() {
    var icon = widget.searchIcon ??
        const Icon(
          Icons.search,
        );
    return IconButton(
      icon: isSearchViewClicked
          ? const Icon(
              Icons.close,
            )
          : icon,
      onPressed: () {
        //show search bar
        setState(() {
          if (isSearchViewClicked) {
            isSearchViewClicked = false;
            searchText = "";
            if (widget.closeSearch != null) {
              widget.closeSearch!();
            }
          } else {
            isSearchViewClicked = true;
          }
        });
      },
    );
  }
}
