import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

const String _loremIpsumParagraph = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod '
    'tempor incididunt ut labore et dolore magna aliqua. Vulputate dignissim '
    'suspendisse in est. Ut ornare lectus sit amet. Eget nunc lobortis mattis '
    'aliquam faucibus purus in. Hendrerit gravida rutrum quisque non tellus '
    'orci ac auctor. Mattis aliquam faucibus purus in massa. Tellus rutrum '
    'tellus pellentesque eu tincidunt tortor. Nunc eget lorem dolor sed. Nulla '
    'at volutpat diam ut venenatis tellus in metus. Tellus cras adipiscing enim '
    'eu turpis. Pretium fusce id velit ut tortor. Adipiscing enim eu turpis '
    'egestas pretium. Quis varius quam quisque id. Blandit aliquam etiam erat '
    'velit scelerisque. In nisl nisi scelerisque eu. Semper risus in hendrerit '
    'gravida rutrum quisque. Suspendisse in est ante in nibh mauris cursus '
    'mattis molestie. Adipiscing elit duis tristique sollicitudin nibh sit '
    'amet commodo nulla. Pretium viverra suspendisse potenti nullam ac tortor '
    'vitae.\n'
    '\n'
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod '
    'tempor incididunt ut labore et dolore magna aliqua. Vulputate dignissim '
    'suspendisse in est. Ut ornare lectus sit amet. Eget nunc lobortis mattis '
    'aliquam faucibus purus in. Hendrerit gravida rutrum quisque non tellus '
    'orci ac auctor. Mattis aliquam faucibus purus in massa. Tellus rutrum '
    'tellus pellentesque eu tincidunt tortor. Nunc eget lorem dolor sed. Nulla '
    'at volutpat diam ut venenatis tellus in metus. Tellus cras adipiscing enim '
    'eu turpis. Pretium fusce id velit ut tortor. Adipiscing enim eu turpis '
    'egestas pretium. Quis varius quam quisque id. Blandit aliquam etiam erat '
    'velit scelerisque. In nisl nisi scelerisque eu. Semper risus in hendrerit '
    'gravida rutrum quisque. Suspendisse in est ante in nibh mauris cursus '
    'mattis molestie. Adipiscing elit duis tristique sollicitudin nibh sit '
    'amet commodo nulla. Pretium viverra suspendisse potenti nullam ac tortor '
    'vitae';

const double _fabDimension = 56;

class OpenContainerTransformScreen extends StatefulWidget {
  static String tag = '/OpenContainerTransformScreen';

  @override
  _OpenContainerTransformScreenState createState() => _OpenContainerTransformScreenState();
}

class _OpenContainerTransformScreenState extends State<OpenContainerTransformScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  ContainerTransitionType _transitionType = ContainerTransitionType.fade;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      key: _scaffoldKey,
      appBar: appBar(context, 'Open Container Transform Demo'),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          _OpenContainerWrapper(
            transitionType: _transitionType,
            closedBuilder: (context, openContainer) {
              return _DetailsCard(openContainer: openContainer);
            },
          ),
          16.height,
          _OpenContainerWrapper(
            transitionType: _transitionType,
            closedBuilder: (context, openContainer) {
              return _DetailsListTile(openContainer: openContainer);
            },
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _OpenContainerWrapper(
                  transitionType: _transitionType,
                  closedBuilder: (context, openContainer) {
                    return _SmallDetailsCard(openContainer: openContainer, subtitle: 'Placeholder text');
                  },
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _OpenContainerWrapper(
                  transitionType: _transitionType,
                  closedBuilder: (context, openContainer) {
                    return _SmallDetailsCard(openContainer: openContainer, subtitle: 'Placeholder text');
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _OpenContainerWrapper(
                  transitionType: _transitionType,
                  closedBuilder: (context, openContainer) {
                    return _SmallDetailsCard(openContainer: openContainer, subtitle: 'Small placeholder text');
                  },
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _OpenContainerWrapper(
                  transitionType: _transitionType,
                  closedBuilder: (context, openContainer) {
                    return _SmallDetailsCard(openContainer: openContainer, subtitle: 'Small placeholder text');
                  },
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _OpenContainerWrapper(
                  transitionType: _transitionType,
                  closedBuilder: (context, openContainer) {
                    return _SmallDetailsCard(openContainer: openContainer, subtitle: 'Small placeholder text');
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ...List.generate(10, (index) {
            return OpenContainer<bool>(
              transitionType: _transitionType,
              openBuilder: (context, openContainer) => const _DetailsPage(),
              tappable: false,
              closedShape: const RoundedRectangleBorder(),
              closedElevation: 0,
              closedBuilder: (context, openContainer) {
                return Container(
                  color: appStore.appBarColor,
                  child: ListTile(
                    leading: Image.network(SampleImageUrl, width: 40, fit: BoxFit.cover),
                    onTap: openContainer,
                    title: Text(
                      'List Menu Item' + ' ${index + 1}',
                      style: primaryTextStyle(size: 16),
                    ),
                    subtitle: Text(
                      'Placeholder text',
                      style: secondaryTextStyle(size: 12),
                    ),
                  ),
                );
              },
            );
          }),
        ],
      ),
      floatingActionButton: OpenContainer(
        transitionType: _transitionType,
        openBuilder: (context, openContainer) => const _DetailsPage(),
        closedElevation: 6,
        closedShape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(_fabDimension / 2))),
        closedColor: colorScheme.secondary,
        closedBuilder: (context, openContainer) {
          return SizedBox(
            height: _fabDimension,
            width: _fabDimension,
            child: Center(child: Icon(Icons.add, color: colorScheme.onSecondary)),
          );
        },
      ),
    );
  }
}

class _OpenContainerWrapper extends StatelessWidget {
  const _OpenContainerWrapper({
    this.closedBuilder,
    this.transitionType,
  });

  final CloseContainerBuilder? closedBuilder;
  final ContainerTransitionType? transitionType;

  @override
  Widget build(BuildContext context) {
    return OpenContainer<bool>(
      transitionType: transitionType!,
      openBuilder: (context, openContainer) => const _DetailsPage(),
      tappable: false,
      closedBuilder: closedBuilder!,
    );
  }
}

class _DetailsCard extends StatelessWidget {
  const _DetailsCard({this.openContainer});

  final VoidCallback? openContainer;

  @override
  Widget build(BuildContext context) {
    return _InkWellOverlay(
      openContainer: openContainer,
      height: 300,
      child: Container(
        color: appStore.appBarColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Image.network(SampleImageUrl, fit: BoxFit.cover),
            ),
            ListTile(
              title: Text(
                'Title',
                style: primaryTextStyle(size: 18),
              ),
              subtitle: Text(
                'Placeholder text',
                style: secondaryTextStyle(size: 14),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur '
                'adipiscing elit, sed do eiusmod tempor.',
                style: secondaryTextStyle(size: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SmallDetailsCard extends StatelessWidget {
  const _SmallDetailsCard({
    this.openContainer,
    this.subtitle,
  });

  final VoidCallback? openContainer;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return _InkWellOverlay(
      openContainer: openContainer,
      height: 250,
      child: Container(
        color: appStore.appBarColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(SampleImageUrl, width: context.width(), height: 150, fit: BoxFit.cover),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Title', style: primaryTextStyle(size: 18)),
                    const SizedBox(height: 4),
                    Expanded(child: Text(subtitle!, style: secondaryTextStyle(size: 12))),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DetailsListTile extends StatelessWidget {
  const _DetailsListTile({this.openContainer});

  final VoidCallback? openContainer;

  @override
  Widget build(BuildContext context) {
    const height = 120.0;

    return _InkWellOverlay(
      openContainer: openContainer,
      height: height,
      child: Container(
        color: appStore.appBarColor,
        child: Row(
          children: [
            Image.network(SampleImageUrl, height: height, fit: BoxFit.cover).expand(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Title', style: primaryTextStyle(size: 16)),
                    6.height,
                    Expanded(
                      child: Text(
                        'Lorem ipsum dolor sit amet, consectetur '
                        'adipiscing elit,',
                        style: secondaryTextStyle(size: 12),
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InkWellOverlay extends StatelessWidget {
  const _InkWellOverlay({
    this.openContainer,
    this.width,
    this.height,
    this.child,
  });

  final VoidCallback? openContainer;
  final double? width;
  final double? height;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: InkWell(onTap: openContainer, child: child),
    );
  }
}

class _DetailsPage extends StatelessWidget {
  const _DetailsPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Details Page Title',
        style: primaryTextStyle(),
      )),
      body: ListView(
        children: [
          Image.network(SampleImageUrl, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Title', style: primaryTextStyle(size: 30)),
                const SizedBox(height: 10),
                Text(_loremIpsumParagraph, style: secondaryTextStyle(size: 14)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
