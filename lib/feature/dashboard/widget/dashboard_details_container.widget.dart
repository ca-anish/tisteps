import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:refresh_loadmore/refresh_loadmore.dart';
import 'package:tisteps/feature/dashboard/widget/dashboard_card.widget.dart';

import '../bloc/user_bloc.dart';

class DashboardDetailsContainer extends StatefulWidget {
  const DashboardDetailsContainer(
      {super.key});

  @override
  State<DashboardDetailsContainer> createState() => _DashboardDetailsContainerState();
}

class _DashboardDetailsContainerState extends State<DashboardDetailsContainer> {


  Future<void> loadMore() async {
    // countIncrement = countIncrement + 1;
    // setState(() {});
    // await Future.delayed(Duration(seconds: 1), () async {
    //   loading = true;
    //   setState(() {});
    //   ProductListRequestModel productListRequestModel = ProductListRequestModel(
    //       tag: 'productlist',
    //       customerId: customerId,
    //       limit: '10',
    //       page: countIncrement.toString(),
    //       catId: widget.categoryId.toString(),
    //       searchkey: eCommerceSearchController.text);
    //   productList.addAll(await EcomDataService()
    //       .productList(productListRequestModel: productListRequestModel));
    //   loading = false;
    //   setState(() {
    //     if (productList == []) {
    //       isLastPage = true;
    //     }
    //     loading = false;
    //   });
    // });
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(children: [

          BlocBuilder<UserBloc, UserState>(builder: (context, state) {
            if (state is UserListLoaded) {
              return Column(children: [
                Expanded(
                  child: RefreshLoadmore(
                      onRefresh: loadFirstData,
                      onLoadmore: loadMore,
                      noMoreWidget: Text('No more data, you are at the end',
                          style: TextStyle(
                              fontSize: 18,
                              color: Theme.of(context).disabledColor)),
                      isLastPage: false,
                      child: Column(children: [
                        Row(children: [
                          Text('User List',
                              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800))
                        ]),
                        SizedBox(height: 10),
                        Container(
                            margin: EdgeInsets.symmetric(horizontal: 15),
                            child: AlignedGridView.count(
                                shrinkWrap: true,
                                itemCount: state.userList.total,
                                physics: ScrollPhysics(),
                                crossAxisCount: 2,
                                itemBuilder: (context, index) {
                                  return state.userList.data.isNotEmpty
                                      ? Card(
                                      child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Column(children: [
                                              SizedBox(width: 120, child: Image.network(state.userList.data[index].avatar))
                                            ]),
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 20, bottom: 10, left: 10, right: 10),
                                                child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Row(
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment.start,
                                                          mainAxisAlignment:
                                                          MainAxisAlignment.start,
                                                          children: [
                                                            Text('Name : '),
                                                            Text('${state.userList.data[index].firstName} ${state.userList.data[index].lastName}')
                                                          ]),
                                                      SizedBox(height: 10),
                                                      Row(children: [
                                                        Text(''),
                                                        Text(state.userList.data[index].email)
                                                      ]),
                                                      TextButton(
                                                          child: Text('View Details'),
                                                          onPressed: () {
                                                            // Perform some action
                                                          })
                                                    ])
                                            )
                                          ]))
                                      : Container();
                                }))
                      ])))
              ]);
            } else {
              return CircularProgressIndicator();
            }
          })
        ]));
  }
}
