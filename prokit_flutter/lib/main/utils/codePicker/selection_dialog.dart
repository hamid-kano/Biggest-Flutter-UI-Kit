import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import '../../../main.dart';
import '../AppConstant.dart';
import 'country_code.dart';

/// selection dialog used for selection of the country code
class SelectionDialog extends StatefulWidget {
  final List<CountryCode> elements;
  final bool? showCountryOnly;
  final InputDecoration searchDecoration;
  final TextStyle? searchStyle;
  final WidgetBuilder? emptySearchBuilder;
  final bool? showFlag;

  /// elements passed as favorite
  final List<CountryCode> favoriteElements;

  SelectionDialog(this.elements, this.favoriteElements,
      {Key? key, this.showCountryOnly, this.emptySearchBuilder, InputDecoration searchDecoration = const InputDecoration(), this.searchStyle, this.showFlag})
      : this.searchDecoration = searchDecoration.copyWith(prefixIcon: Icon(Icons.search)),
        super(key: key);

  @override
  State<StatefulWidget> createState() => _SelectionDialogState();
}

class _SelectionDialogState extends State<SelectionDialog> {
  /// this is useful for filtering purpose
  late List<CountryCode> filteredElements;

  @override
  Widget build(BuildContext context) => CustomTheme(
        child: SimpleDialog(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              text("Select Country Code", textColor: appStore.textPrimaryColor, fontSize: 16.0, fontFamily: fontSemibold),
              SizedBox(height: 8),
              TextField(
                style: widget.searchStyle,
                decoration: InputDecoration(
                  filled: true,
                  hintText: "Search Country",
                  hintStyle: secondaryTextStyle(),
                  border: InputBorder.none,
                ),
                onChanged: _filterElements,
              )
            ],
          ),
          children: [
            Container(
                margin: EdgeInsets.only(top: 16),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: ListView(
                    children: [
                  widget.favoriteElements.isEmpty
                      ? DecoratedBox(decoration: BoxDecoration())
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[]
                            ..addAll(widget.favoriteElements
                                .map(
                                  (f) => SimpleDialogOption(
                                    child: _buildOption(f),
                                    onPressed: () {
                                      _selectItem(f);
                                    },
                                  ),
                                )
                                .toList())
                            ..add(Divider())),
                ]..addAll(filteredElements.isEmpty
                        ? [_buildEmptySearchWidget(context)]
                        : filteredElements.map((e) => SimpleDialogOption(
                              key: Key(e.toLongString()),
                              child: _buildOption(e),
                              onPressed: () {
                                _selectItem(e);
                              },
                            ))))),
          ],
        ),
      );

  Widget _buildOption(CountryCode e) {
    return Container(
      width: 400,
      child: Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          widget.showFlag!
              ? Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(right: 16.0),
                    child: CachedNetworkImage(
                      placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
                      imageUrl: e.flagUri!,
                      width: 25.0,
                    ),
                  ),
                )
              : Container(),
          Expanded(
            flex: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(child: text(e.toLongString(), fontSize: textSizeMedium, textColor: appStore.textPrimaryColor)),
                text(e.dialCode, fontSize: textSizeMedium, textColor: appStore.textPrimaryColor, fontFamily: fontSemibold),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptySearchWidget(BuildContext context) {
    if (widget.emptySearchBuilder != null) {
      return widget.emptySearchBuilder!(context);
    }

    return Center(child: Text('No Country Found'));
  }

  @override
  void initState() {
    filteredElements = widget.elements;
    super.initState();
  }

  void _filterElements(String s) {
    s = s.toUpperCase();
    setState(() {
      filteredElements = widget.elements.where((e) => e.code!.contains(s) || e.dialCode!.contains(s) || e.name!.toUpperCase().contains(s)).toList();
    });
  }

  void _selectItem(CountryCode e) {
    Navigator.pop(context, e);
  }
}
