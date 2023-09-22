import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:refresh_loadmore/refresh_loadmore.dart';
import 'package:tisteps/feature/dashboard/bloc/user_bloc.dart';

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
    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      if (state is UserListLoaded) {
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
                        fontSize: 18, color: Theme
                        .of(context)
                        .disabledColor)),
                isLastPage: false,
                child: Column(children: [
                  Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, bottom: 15, top: 15),
                      child: Row(children: const [
                        Text('User List',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w800))
                      ])),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: AlignedGridView.count(
                          shrinkWrap: true,
                          itemCount: state.userList.perPage,
                          physics: ScrollPhysics(),
                          crossAxisCount: 1,
                          itemBuilder: (context, index) {
                            return state.userList.data.isNotEmpty
                                ? Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Card(
                                  color: Color(0xFFE1F6FF),
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(20.0)),
                                  child: Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Column(children: [
                                          ClipRRect(
                                              borderRadius:
                                              BorderRadius.circular(
                                                  16.0),
                                              child: Image.network(
                                                  state.userList
                                                      .data[index].avatar,
                                                  width: 100,
                                                  height: 125,
                                                  fit: BoxFit.cover))
                                        ]),
                                        Expanded(
                                          child: Padding(
                                              padding:
                                              const EdgeInsets.only(
                                                  top: 20,
                                                  bottom: 10,
                                                  left: 10,
                                                  right: 10),
                                              child: Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment
                                                      .start,
                                                  children: [
                                                    Row(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .start,
                                                        children: [
                                                          Text('Name : '),
                                                          Text(
                                                              '${state.userList
                                                                  .data[index]
                                                                  .firstName} ${state
                                                                  .userList
                                                                  .data[index]
                                                                  .lastName}')
                                                        ]),
                                                    SizedBox(height: 10),
                                                    Row(children: [
                                                      Text(''),
                                                      Text(state
                                                          .userList
                                                          .data[index]
                                                          .email)
                                                    ]),
                                                    Align(
                                                      alignment: Alignment.bottomRight,
                                                      child: TextButton(
                                                          child: Text(
                                                              'View Details'),
                                                          onPressed: () {
                                                            BlocProvider.of<
                                                                UserBloc>(
                                                                context)
                                                                .add(
                                                                UserDetailsEvent(
                                                                    userId: state
                                                                        .userList
                                                                        .data[
                                                                    index]
                                                                        .id));
                                                            showDataAlert(context);
                                                            context
                                                                .read<
                                                                UserBloc>()
                                                                .add(UserListEvent(
                                                                page:
                                                                countIncrement));
                                                          }),
                                                    )
                                                  ])),
                                        )
                                      ])),
                            )
                                : Container();
                          }))
                ])),
          ),
        );
      } else {
        return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: CircularProgressIndicator())
        ]);
      }
    });
  }

  showDataAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          contentPadding: EdgeInsets.zero,
          content: Container(
            width: 500,
            height: 400, // Increase the container height as needed
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.white,
            ),
            child: Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                    color: Colors.blue,
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 20,
                  right: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                      )])),
                // Positioned( top: 250,
                //     left: 20,
                //     right: 20,
                //     child: Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           Container(
                //             width: 20,
                //             height: 20,
                //             decoration: BoxDecoration(
                //               shape: BoxShape.circle,
                //               color: Colors.blue,
                //             ),
                //           ),
                //           Container(
                //             width: 20,
                //             height: 20,
                //             decoration: BoxDecoration(
                //               shape: BoxShape.circle,
                //               color: Colors.blue,
                //             ),
                //           )])),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        ),
                      ),
                      child: Image.asset(
                        'assets/images/image 64.png',
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'John Doe',
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black, // Set contrasting text color
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'john.doe@example.com',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black, // Set contrasting text color
                            ),
                          ),
                          SizedBox(height: 16.0),
                          Text(
                            'Description goes here. You can provide a brief description about John Doe in this section.',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black, // Set contrasting text color
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }



}