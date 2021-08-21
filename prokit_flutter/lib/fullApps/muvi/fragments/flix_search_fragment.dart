import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/muvi/models/flix_response.dart';
import 'package:prokit_flutter/fullApps/muvi/utils/flix_app_widgets.dart';
import 'package:prokit_flutter/fullApps/muvi/utils/flix_constants.dart';
import 'package:prokit_flutter/fullApps/muvi/utils/flix_data_generator.dart';
import 'package:prokit_flutter/fullApps/muvi/utils/resources/flix_colors.dart';
import 'package:prokit_flutter/fullApps/muvi/utils/resources/flix_images.dart';
import 'package:prokit_flutter/fullApps/muvi/utils/resources/flix_size.dart';

class SearchFragment extends StatefulWidget {
  static String tag = '/SearchFragment';

  @override
  SearchFragmentState createState() => SearchFragmentState();
}

class SearchFragmentState extends State<SearchFragment> {
  TextEditingController controller = TextEditingController();
  bool isLoading = false;
  List<Movie> popularMovieList = [];
  List<Movie> searchResults = [];
  var searchText = "";

  showLoading(bool show) {
    setState(() {
      isLoading = show;
    });
  }

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      //here you have the changes of your textfield
      print("value: ${controller.text}");
      setState(() {
        searchText = controller.text;
      });
      searchItems();
    });
    getData();
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    controller.dispose();
    super.dispose();
  }

  getData() {
    setState(() {
      popularMovieList.addAll(getContinueMovies());
    });
  }

  searchItems() {
    setState(() {
      searchResults.clear();
      if (searchText.isNotEmpty) {
        searchResults.addAll(getMadeForYouMovie());
        searchResults.addAll(getMovie());
        searchResults.addAll(getTrendingOnMovie());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var appBar = AppBar(
      title: toolBarTitle(context, "Search"),
      backgroundColor: muvi_navigationBackground,
      elevation: 0,
      bottom: PreferredSize(
        preferredSize: Size(double.infinity, 45),
        child: Container(
          height: 50,
          color: search_edittext_color,
          padding: EdgeInsets.only(left: spacing_standard_new, right: spacing_standard),
          child: Row(
            children: <Widget>[
              Expanded(
                child: TextFormField(
                    controller: controller,
                    textInputAction: TextInputAction.search,
                    style: TextStyle(fontFamily: font_regular, fontSize: ts_normal, color: muvi_textColorPrimary),
                    decoration: InputDecoration(
                      hintText: "Type title, categories, years, etc",
                      hintStyle: TextStyle(fontFamily: font_regular, color: muvi_textColorSecondary),
                      border: InputBorder.none,
                      filled: false,
                    ),
                    onFieldSubmitted: (term) {
                      searchItems();
                    }),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    controller.clear();
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.cancel,
                    color: muvi_colorPrimary,
                    size: 20,
                  ),
                ),
              ).visible(searchText.isNotEmpty),
              InkWell(
                onTap: () {
                  searchItems();
                },
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Image.asset(
                    ic_search,
                    color: muvi_colorPrimary,
                    width: 20,
                    height: 20,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
    var popularSearchList = ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: popularMovieList.length,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(left: spacing_standard_new, right: spacing_standard_new),
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {},
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.only(bottom: spacing_standard_new),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    networkImage(popularMovieList[index].slideImage, aWidth: (width * 0.5) - 42, aHeight: ((width * 0.5) - 42) * (2.5 / 4)).cornerRadiusWithClipRRect(8).paddingRight(10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          itemTitle(context, popularMovieList[index].title),
                          itemSubTitle(context, "2019"),
                          itemSubTitle(context, "Action, 18+, Dark, Inspiring, Comedy", colorThird: true, fontsize: ts_medium),
                        ],
                      ),
                    )
                  ],
                ),
              ));
        });
    var popularSearchLayout = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[headingText(context, "Popular Search").paddingAll(spacing_standard_new), Expanded(child: popularSearchList)],
    );
    var searchResultList = MovieGridList(searchResults);
    var searchResultLayout = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        headingText(context, "Result For" + " \'" + searchText + "\'").paddingOnly(left: spacing_standard_new, right: spacing_standard_new, top: spacing_standard_new, bottom: 12),
        Expanded(child: searchResultList)
      ],
    );

    return Scaffold(
      backgroundColor: muvi_appBackground,
      appBar: appBar,
      body: Stack(
        children: <Widget>[popularSearchLayout.visible(searchText.isEmpty), searchResultLayout.visible(searchResults.isNotEmpty), Center(child: loadingWidgetMaker().visible(isLoading))],
      ),
    );
  }
}
