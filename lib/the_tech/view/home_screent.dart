import 'package:flutter/material.dart';
import 'package:np/the_tech/data/response/status.dart';
import 'package:np/the_tech/utils/routes/routes_name.dart';
import 'package:np/the_tech/view_model/home_view_model.dart';
import 'package:np/the_tech/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreent extends StatefulWidget {
  const HomeScreent({super.key});

  @override
  State<HomeScreent> createState() => _HomeScreentState();
}

class _HomeScreentState extends State<HomeScreent> {
  HomeViewModel home = HomeViewModel();

  @override
  void initState() {
    home.fetchUserList();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                provider.removeUser().then((value) {
                  Navigator.pushNamedAndRemoveUntil(
                      context, RoutesName.login, (routes) => false);
                });
              },
              icon: Icon(Icons.logout))
        ],
        title: Text("Home Screen"),
      ),
      body: ChangeNotifierProvider<HomeViewModel>(
        create: (context) => home,
        child: Consumer<HomeViewModel>(builder: (context, value, child) {
          switch (value.userList.status) {
            case Status.LOADING:
              return Center(child: CircularProgressIndicator());
            case Status.ERROR:
              return Center(child: Text(value.userList.message.toString()));
            case Status.COMPLETE:
              return ListView.builder(
                  itemCount: value.userList.data!.results!.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        child: Image.network(value
                            .userList.data!.results![index].picture!.medium
                            .toString()),
                      ),
                      title: Text(value
                          .userList.data!.results![index].name!.first
                          .toString()),
                    );
                  });
            default:
              return Container();
          }
        }),
      ),
    );
  }
}
