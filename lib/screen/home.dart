// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:np/enum.dart';
// import 'package:np/model/user.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   List<User> users = [];

//   @override
//   void initState() {
//     fetchPost();
//     // TODO: implement initState
//     super.initState();
//   }

//   void fetchPost() async {
//     final url = 'https://randomuser.me/api/?results=20';
//     final uri = Uri.parse(url);
//     final response = await http.get(uri);

//     if (response.statusCode == 200) {
//       final body = jsonDecode(response.body);

//       final json = body['results'] as List;

//       final transform = json.map((e) {
//         final streets = Street(
//             number: e['location']['street']['number'],
//             name: e['location']['street']['name']);
//         final location = UserLocation(
//           city: e['location']['city'],
//           state: e['location']['state'],
//           country: e['location']['country'],
//           street: streets,
//         );
//         final username = UserName(
//             title: e['name']['title'],
//             fname: e['name']['first'],
//             lname: e['name']['last']);
//         return User(
//           gender: e['gender'],
//           email: e['email'],
//           phone: e['phone'],
//           cell: e['cell'],
//           nat: e['nat'],
//           userName: username,
//           userLocation: location,
//         );
//       }).toList();

//       setState(() {
//         users = transform;
//       });
//     } else {
//       print("fetch to failed");
//       print(response.statusCode);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {},
//           child: Icon(Icons.add),
//         ),
//         appBar: AppBar(
//           centerTitle: true,
//           title: Text(
//             "Api Consuming",
//             style: TextStyle(color: Colors.white),
//           ),
//         ),
//         body: ListView.builder(
//             physics: BouncingScrollPhysics(),
//             itemCount: users.length,
//             itemBuilder: (context, index) {
//               final user = users[index];

//               return Card(
//                 child: ListTile(
//                   title: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(user.email),
//                       Text(user.phone),
//                       Text(user.gender),
//                       Text("User Name"),
//                       Text(user.userName.title),
//                       Text(user.userName.fname),
//                       Text(user.userName.lname),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       Card(
//                         child: ListTile(
//                           title: Column(
//                             children: [
//                               Text(user.userLocation.city),
//                               Text(user.userLocation.state),
//                               Text(user.userLocation.country),
//                               Text(user.userLocation.street.name),
//                               Text(user.userLocation.street.number.toString())
//                             ],
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               );
//             }));
//   }
// }
