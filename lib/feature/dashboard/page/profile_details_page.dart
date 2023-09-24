import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tisteps/feature/authandicate/page/login_page.dart';
import 'package:tisteps/feature/dashboard/widget/profile_card_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import '../bloc/user_bloc.dart';

class ProfileDetailsPage extends StatefulWidget {
  final int userId;

  const ProfileDetailsPage({super.key, required this.userId});

  @override
  State<ProfileDetailsPage> createState() => _ProfileDetailsPageState();
}

class _ProfileDetailsPageState extends State<ProfileDetailsPage>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 3),
  )..repeat(reverse: true);

  final DecorationTween decorationTween = DecorationTween(
      begin: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          border: Border.all(style: BorderStyle.none),
          borderRadius: BorderRadius.circular(60.0),
          boxShadow: const <BoxShadow>[
            BoxShadow(
                color: Color(0x66666666),
                blurRadius: 10.0,
                spreadRadius: 3.0,
                offset: Offset(0, 6.0))
          ]),
      end: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          border: Border.all(style: BorderStyle.none),
          borderRadius: BorderRadius.zero));

  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(1.5, 0.0),
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticIn));

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  getData() {
    context.read<UserBloc>().add(UserDetailsEvent(userId: widget.userId));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
        child: WillPopScope(
            onWillPop: () async {
              Navigator.pop(context);
              context.read<UserBloc>().add(UserListEvent(page: 1));
              return true;
            },
            child: Stack(fit: StackFit.expand, children: [
              Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                    Color.fromRGBO(4, 9, 35, 1),
                    Color.fromRGBO(39, 105, 171, 1)
                  ],
                          begin: FractionalOffset.bottomCenter,
                          end: FractionalOffset.topCenter))),
              Scaffold(
                  backgroundColor: Colors.transparent,
                  body: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: BlocBuilder<UserBloc, UserState>(
                          builder: (context, state) {
                        if (state is UserDetailsLoaded) {
                          return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 20),
                              child: Column(children: [
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                          onTap: () {
                                            context
                                                .read<UserBloc>()
                                                .add(UserListEvent(page: 1));
                                            Navigator.pop(context);
                                          },
                                          child: Icon(Icons.arrow_back_ios,
                                              color: Colors.white)),
                                      GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        LoginPage()));
                                          },
                                          child: Icon(Icons.logout,
                                              color: Colors.white))
                                    ]),
                                SizedBox(height: 35),
                                Text('Profile Details',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 30)),
                                SizedBox(height: 22),
                                ProfileCardWidget(profileDetails : state.userDetails.data),
                                SizedBox(height: 30),
                                DecoratedBoxTransition(
                                    decoration:
                                        decorationTween.animate(_controller),
                                    child: Container(
                                        width: width,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            color: Colors.white),
                                        child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 15, vertical: 15),
                                            child: Column(children: [
                                              SizedBox(height: 20),
                                              Text('Support',
                                                  style: TextStyle(
                                                      color: Color.fromRGBO(
                                                          39, 105, 171, 1),
                                                      fontSize: 27,
                                                      fontFamily: 'Nunito')),
                                              Divider(thickness: 2.5),
                                              SizedBox(height: 10),
                                              Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.grey,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30)),
                                                  child: Column(children: [
                                                    Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(20.0),
                                                        child: RichText(
                                                            text: TextSpan(
                                                                children: <
                                                                    TextSpan>[
                                                              TextSpan(
                                                                  text:
                                                                      'Description : ',
                                                                  style: TextStyle(
                                                                      color: Color.fromRGBO(
                                                                          39,
                                                                          105,
                                                                          171,
                                                                          1),
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal)),
                                                              TextSpan(
                                                                  text: state
                                                                      .userDetails
                                                                      .support
                                                                      .text,
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          16))
                                                            ])))
                                                  ])),
                                              SizedBox(height: 10),
                                              Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.grey,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30)),
                                                  child: Center(
                                                      child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 10,
                                                                  bottom: 10,
                                                                  left: 10,
                                                                  right: 20),
                                                          child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                const Text(
                                                                    'Visit website'),
                                                                SlideTransition(
                                                                    position:
                                                                        _offsetAnimation,
                                                                    child: Padding(
                                                                        padding:
                                                                            EdgeInsets.all(
                                                                                8.0),
                                                                        child: GestureDetector(
                                                                            onTap: () =>
                                                                                _launchURL(state.userDetails.support.url),
                                                                            child: Icon(Icons.support_agent))))
                                                              ]))))
                                            ]))))
                              ]));
                        } else {
                          return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                    padding: const EdgeInsets.only(top: 300.0),
                                    child: CircularProgressIndicator())
                              ]);
                        }
                      })))
            ])));
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
