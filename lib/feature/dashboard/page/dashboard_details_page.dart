import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:refresh_loadmore/refresh_loadmore.dart';
import 'package:tisteps/data/user_data_service.dart';
import 'package:tisteps/feature/dashboard/bloc/user_bloc.dart';
import 'package:tisteps/feature/dashboard/page/profile_details_page.dart';
import 'package:tisteps/feature/dashboard/widget/user_list_card_widget.dart';
import 'package:tisteps/model/user_details_model.dart';
import 'package:tisteps/model/user_response_model.dart';

class DashBoardDetailsPage extends StatefulWidget {
  const DashBoardDetailsPage({super.key});

  @override
  State<DashBoardDetailsPage> createState() => _DashBoardDetailsPageState();
}

class _DashBoardDetailsPageState extends State<DashBoardDetailsPage>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation =
      CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn);
  int countIncrement = 1;
  bool loading = false;
  bool isLastPage = false;
  List<UserDetailsModel> userList = [];

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() {
    context.read<UserBloc>().add(UserListEvent(page: 1));
    setState(() {});
  }

  Future<void> loadFirstData() async {
    await Future.delayed(Duration(seconds: 1), () async {
      loading = true;
      setState(() {});
      context.read<UserBloc>().add(UserListEvent(page: 1));
      setState(() {});
      loading = false;
      setState(() {
        loading = false;
      });
    });
  }

  Future<void> loadMore() async {
    countIncrement = countIncrement + 1;
    await Future.delayed(Duration(seconds: 1), () async {
      loading = true;
      setState(() {});
      userList
          .addAll(await UserDataService().getLoadMoreUserList(countIncrement));
      setState(() {});
      loading = false;
      setState(() {
        if (userList == []) {
          isLastPage = true;
        }
        loading = false;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      print(state);
      if (state is UserListLoaded) {
        userList = state.userList.data;
        return Padding(
            padding: const EdgeInsets.only(right: 10.0, left: 10, top: 10),
            child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20.0),
                        topLeft: Radius.circular(20.0))),
                child: RefreshLoadmore(
                    onRefresh: loadFirstData,
                    onLoadmore: loadMore,
                    noMoreWidget: Text('No more data, you are at the end',
                        style: TextStyle(
                            fontFamily: 'SFPro',
                            fontSize: 18,
                            color: Theme.of(context).disabledColor)),
                    isLastPage: isLastPage,
                    child: Column(children: [
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, bottom: 15, top: 15, right: 15),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('User List',
                                    style: TextStyle(
                                        fontFamily: 'SFPro',
                                        fontSize: 22,
                                        fontWeight: FontWeight.w800)),
                                ScaleTransition(
                                    scale: _animation,
                                    child: const Center(
                                        child: Visibility(
                                            visible: true,
                                            child: Icon(Icons.verified_rounded,
                                                color: Colors.green))))
                              ])),
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: AlignedGridView.count(
                              shrinkWrap: true,
                              itemCount: userList.length,
                              physics: ScrollPhysics(),
                              crossAxisCount: 1,
                              itemBuilder: (context, index) {
                                return userList.isNotEmpty
                                    ? UserListCardWidget(userList : userList[index])
                                    : Container();
                              }))
                    ]))));
      } else {
        return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: CircularProgressIndicator())
        ]);
      }
    });
  }
}
