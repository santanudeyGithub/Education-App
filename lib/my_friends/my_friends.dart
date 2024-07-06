import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';

class MyFriendsPage extends StatefulWidget {
  const MyFriendsPage({super.key});

  @override
  State<MyFriendsPage> createState() => _MyFriendsPageState();
}

class _MyFriendsPageState extends State<MyFriendsPage> {
  TextEditingController searchController = TextEditingController();
  List<String> items = [
    'Risahb Sen',
    'Banty',
    'Priyanka',
    'Tirtha',
    'Sunil',
    'Paritosh',
    'Grape',
    'Honeydew',
  ];
  List<String> filteredItems = [];

  @override
  void initState() {
    super.initState();
    filteredItems = items;
  }

  void filterSearchResults(String query) {
    List<String> dummySearchList = List.from(items);
    if (query.isNotEmpty) {
      List<String> dummyListData = [];
      dummySearchList.forEach((item) {
        if (item.toLowerCase().contains(query.toLowerCase())) {
          dummyListData.add(item);
        }
      });
      setState(() {
        filteredItems = dummyListData;
      });
      return;
    } else {
      setState(() {
        filteredItems = items;
      });
    }
  }

  void inviteFriends() {
    final String inviteMessage =
        'Check out this awesome app and join me! \n\nhttps://example.com/invite';
    Share.share(inviteMessage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // ClipPath under the SearchBox
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              height: 300,
              color: Color(0xff1760AB),
            ),
          ),
          // Positioned SearchBox
          Positioned(
            top: 50,
            left: 16,
            right: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child:
                          Icon(Icons.arrow_back_rounded, color: Colors.white),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 65),
                      child: Text(
                        'My Friends List',
                        style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // Icon(Icons.search, color: Colors.white),
                  ],
                ),
                SizedBox(height: 45),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: searchController,
                        onChanged: filterSearchResults,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Search...',
                          prefixIcon: Icon(Icons.search, color: Colors.black),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25.0)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    // IconButton(
                    //   icon: Icon(Icons.share, color: Colors.white),
                    //   onPressed: () {
                    //     // Implement share functionality here
                    //     print('Share button pressed');
                    //   },
                    // ),
                  ],
                ),
              ],
            ),
          ),
          // ListView for filtered items

          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 250),
              child: ListView.builder(
                itemCount: filteredItems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 35, vertical: 0),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(filteredItems[index]),
                        IconButton(
                          icon: Icon(Icons.share),
                          onPressed: () {
                            // Implement share functionality here
                            // For demonstration, we use a simple print statement
                            Share.share(
                                'Check out this item: ${filteredItems[index]}');
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 50);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
