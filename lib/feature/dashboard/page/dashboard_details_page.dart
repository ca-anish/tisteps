import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:refresh_loadmore/refresh_loadmore.dart';
import 'package:tisteps/feature/dashboard/bloc/user_bloc.dart';
import 'package:tisteps/feature/dashboard/page/profile_details_page.dart';

class DashBoardDetailsPage extends StatefulWidget {
  const DashBoardDetailsPage({super.key});

  @override
  State<DashBoardDetailsPage> createState() => _DashBoardDetailsPageState();
}

class _DashBoardDetailsPageState extends State<DashBoardDetailsPage> {
  int countIncrement = 1;
  bool loading = false;

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
      context.read<UserBloc>().add(UserListEvent(page: countIncrement));
      setState(() {});
      loading = false;
      setState(() {
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state is UserDetailsLoaded) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const ProfileDetailsPage()));
        }
      },
      child: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
        if (state is UserListLoaded) {
          return RefreshLoadmore(
              onRefresh: loadFirstData,
              onLoadmore: loadMore,
              noMoreWidget: Text('No more data, you are at the end',
                  style: TextStyle(
                      fontSize: 18, color: Theme.of(context).disabledColor)),
              isLastPage: false,
              child: Column(children: [
                Padding(
                    padding: const EdgeInsets.only(left: 20.0, bottom: 15),
                    child: Row(children: const [
                      Text('User List',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w800))
                    ])),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    child: AlignedGridView.count(
                        shrinkWrap: true,
                        itemCount: state.userList.perPage,
                        physics: ScrollPhysics(),
                        crossAxisCount: 1,
                        itemBuilder: (context, index) {
                          return state.userList.data.isNotEmpty
                              ? Card(
                                  child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                      Column(children: [
                                        SizedBox(
                                            width: 120,
                                            child: Image.network(state
                                                .userList.data[index].avatar))
                                      ]),
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              top: 20,
                                              bottom: 10,
                                              left: 10,
                                              right: 10),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Text('Name : '),
                                                      Text(
                                                          '${state.userList.data[index].firstName} ${state.userList.data[index].lastName}')
                                                    ]),
                                                SizedBox(height: 10),
                                                Row(children: [
                                                  Text(''),
                                                  Text(state.userList
                                                      .data[index].email)
                                                ]),
                                                TextButton(
                                                    child: Text('View Details'),
                                                    onPressed: () {
                                                      BlocProvider.of<UserBloc>(
                                                              context)
                                                          .add(UserDetailsEvent(
                                                              userId: state
                                                                  .userList
                                                                  .data[index]
                                                                  .id));
                                                    })
                                              ]))
                                    ]))
                              : Container();
                        }))
              ]));
        } else {
          return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: CircularProgressIndicator())
          ]);
        }
      }),
    );
  }
}
