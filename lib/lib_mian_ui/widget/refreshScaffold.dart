/*
 * @author chengpenggao
 * @date 2019/11/13
 */
import 'package:flutter/material.dart';
import 'package:luck_pets/common/component_index.dart';
import 'package:luck_pets/lib_mian_ui/widget/widgets.dart';

typedef void OnLoadMore(bool up);
typedef OnRefreshCallback = Future<void> Function({bool isReload});

class RefreshScaffold extends StatefulWidget {
  final String labelId;
  final int loadStatus;
  final RefreshController controller;
  final bool enablePullUp;
  final OnRefreshCallback onRefresh;
  final OnLoadMore onLoadMore;
  final Widget child;
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;

  const RefreshScaffold(
      {Key key,
      this.labelId,
      this.loadStatus,
      this.controller,
      this.enablePullUp,
      this.onRefresh,
      this.onLoadMore,
      this.itemCount,
      this.itemBuilder,
      this.child})
      : super(key: key);

  @override
  _RefreshScaffoldState createState() => _RefreshScaffoldState();
}

class _RefreshScaffoldState extends State<RefreshScaffold>
    with AutomaticKeepAliveClientMixin {
  bool isShowFloatBtn = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.controller.scrollController.addListener(() {
        int offset = widget.controller.scrollController.offset.toInt();
        if (offset > 480 && isShowFloatBtn) {
          isShowFloatBtn = false;
          setState(() {});
        } else if (offset > 480 && !isShowFloatBtn) {
          isShowFloatBtn = true;
          setState(() {});
        }
      });
    });
  }

  Widget buildFloatingActionButton() {
    if (widget.controller.scrollController == null ||
        widget.controller.scrollController.offset < 480) {
      return null;
    }

    return new FloatingActionButton(
        heroTag: widget.labelId,
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(
          Icons.keyboard_arrow_up,
        ),
        onPressed: () {
          //_controller.scrollTo(0.0);
          widget.controller.scrollController.animateTo(0.0,
              duration: new Duration(milliseconds: 300), curve: Curves.linear);
        });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          RefreshIndicator(
            child: SmartRefresher(
                controller: widget.controller,
                enablePullDown: false,
                enablePullUp: widget.enablePullUp,
                enableOverScroll: false,
                onRefresh: widget.onLoadMore,
                child: widget.child ??
                    ListView.builder(
                      itemBuilder: widget.itemBuilder,
                      itemCount: widget.itemCount,
                    )),
            onRefresh: widget.onRefresh,
          ),
          StatusViews(
            widget.loadStatus,
            onTap: () {
              widget.onRefresh(isReload: true);
            },
          )
        ],
      ),
      floatingActionButton: buildFloatingActionButton(),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
