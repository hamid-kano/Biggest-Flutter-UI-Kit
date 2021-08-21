import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/smartDeck/ModelClass/LiveVideoModel.dart';
import 'package:prokit_flutter/fullApps/smartDeck/SDUtils/SDColors.dart';
import 'package:prokit_flutter/fullApps/smartDeck/SDUtils/SDStyle.dart';

class SdViewAllLiveVideoScreen extends StatefulWidget {
  @override
  _SdViewAllLiveVideoScreenState createState() => _SdViewAllLiveVideoScreenState();
}

class _SdViewAllLiveVideoScreenState extends State<SdViewAllLiveVideoScreen> with SingleTickerProviderStateMixin {
  List<LiveVideoModel> liveVideo = [
    LiveVideoModel(
      image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTFX3JNvflemOpVIwXGd_BdLChYZefcPNWCAQ&usqp=CAU',
      title: 'Talkshow',
      message: 'Top 10 eco campus in \nindonesia that you can be..',
      status: 'LIVE NOW',
    ),
    LiveVideoModel(
      image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcR4sfk7iQgjlNupZAy_A2HSv2hpgRm__UedzdvidFN8GAwd0SSKazIR2DwP39tHc0qUrNOERBaWBVvsds_wivtmBwjtOh8zRTz6kQ&usqp=CAU&ec=45690273',
      title: 'Talkshow',
      message: 'Top 5 colleges in \nIndia that you can be..',
      status: 'LIVE NOW',
    ),
    LiveVideoModel(
      image: 'https://static01.nyt.com/images/2020/03/14/upshot/14up-colleges-remote/14up-colleges-remote-mediumSquareAt3X.jpg',
      title: 'Talkshow',
      message: 'Top 10 eco campus in \nindonesia that you can be..',
      status: 'LIVE NOW',
    ),
  ];
  TabController? _tabController;
  late List tabs;
  int _currentIndex = 0;

  void initState() {
    super.initState();

    tabs = ['All Video', 'Live', 'New Uploaded'];
    _tabController = TabController(length: tabs.length, vsync: this);
    _tabController!.addListener(_handleTabControllerTick);
  }

  void _handleTabControllerTick() {
    setState(() {
      _currentIndex = _tabController!.index;
    });
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget mList(LiveVideoModel mLiveVideo) {
      return Container(
        margin: EdgeInsets.only(left: 16, right: 16, top: 16),
        decoration: boxDecorations(showShadow: true),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 130,
              width: 115,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(5), bottomLeft: Radius.circular(5)),
                image: DecorationImage(image: NetworkImage(mLiveVideo.image!), fit: BoxFit.fill),
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(mLiveVideo.title!, style: boldTextStyle(size: 16)),
                      Padding(
                        padding: EdgeInsets.only(top: 6),
                        child: Align(alignment: Alignment.topRight, child: Icon(Icons.more_vert)),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    child: Text(
                      mLiveVideo.message!,
                      style: primaryTextStyle(size: 14),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  FittedBox(
                    child: Container(
                      margin: EdgeInsets.only(top: 15),
                      decoration: boxDecorations(bgColor: sdSecondaryColorRed, radius: 4),
                      padding: EdgeInsets.fromLTRB(10, 6, 10, 6),
                      child: Center(
                        child: Text(mLiveVideo.status!, style: secondaryTextStyle(size: 8, color: Colors.white)),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              finish(context);
            },
            child: Icon(Icons.arrow_back, color: Colors.white),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Icon(Icons.search, color: Colors.white),
            ),
          ],
          backgroundColor: sdPrimaryColor,
          elevation: 0.0,
          automaticallyImplyLeading: false,
        ),
        body: Stack(
          children: [
            Container(color: sdPrimaryColor, height: MediaQuery.of(context).size.width * 0.5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 16, left: 16),
                  child: Text('Video Learning', style: boldTextStyle(color: Colors.white)),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: TabBar(
                    isScrollable: true,
                    indicatorColor: Colors.white,
                    indicatorWeight: 4.0,
                    labelColor: Colors.white,
                    labelStyle: boldTextStyle(size: 14),
                    unselectedLabelColor: Colors.white.withOpacity(.5),
                    controller: _tabController,
                    tabs: tabs.map((e) => Tab(text: e)).toList(),
                  ),
                ),
                if (_currentIndex == 0)
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: liveVideo.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return mList(liveVideo[index]);
                    },
                  ),
                if (_currentIndex == 1)
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: liveVideo.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return mList(liveVideo[index]);
                    },
                  ),
                if (_currentIndex == 2)
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: liveVideo.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return mList(liveVideo[index]);
                    },
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
