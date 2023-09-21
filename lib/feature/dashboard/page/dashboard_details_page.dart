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
                        fontSize: 18, color: Theme.of(context).disabledColor)),
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
                                              Padding(
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
                                                                  '${state.userList.data[index].firstName} ${state.userList.data[index].lastName}')
                                                            ]),
                                                        SizedBox(height: 10),
                                                        Row(children: [
                                                          Text(''),
                                                          Text(state
                                                              .userList
                                                              .data[index]
                                                              .email)
                                                        ]),
                                                        TextButton(
                                                            child: Text(
                                                                'View Details'),
                                                            onPressed: () {
                                                              BlocProvider.of<
                                                                          UserBloc>(
                                                                      context)
                                                                  .add(UserDetailsEvent(
                                                                      userId: state
                                                                          .userList
                                                                          .data[
                                                                              index]
                                                                          .id));
                                                              showDataAlert();
                                                              context
                                                                  .read<
                                                                      UserBloc>()
                                                                  .add(UserListEvent(
                                                                      page:
                                                                          countIncrement));
                                                            })
                                                      ]))
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

  showDataAlert() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              contentPadding: EdgeInsets.only(top: 10.0),
              title: Text("Create ID", style: TextStyle(fontSize: 24.0)),
              content: Container(
                  height: 400,
                  child: SingleChildScrollView(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Mension Your ID ")),
                            Container(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Enter Id here',
                                        labelText: 'ID'))),
                            Container(
                                width: double.infinity,
                                height: 60,
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.black),
                                    child: Text("Submit"))),
                            Container(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Note')),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt'
                                    ' ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud'
                                    ' exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.'
                                    ' Duis aute irure dolor in reprehenderit in voluptate velit esse cillum '
                                    'dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident,'
                                    ' sunt in culpa qui officia deserunt mollit anim id est laborum.',
                                    style: TextStyle(fontSize: 12)))
                          ]))));
        });
  }
}
