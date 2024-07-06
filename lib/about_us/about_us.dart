import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onboarding_flutter_app/my_files/edit_page.dart';
import 'package:share_plus/share_plus.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
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
              height: 250,
              color: const Color(0xff1760AB),
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
                      child: const Icon(Icons.arrow_back_rounded,
                          color: Colors.white),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 100),
                      child: Text(
                        'About Us',
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
                const SizedBox(height: 45),
                const Row(
                  children: [
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
              padding: const EdgeInsets.only(top: 170, left: 25),
              child: Container(
                width: 365,
                height: 680,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  // border: Border.all(
                  //   color: Colors.black,
                  //   width: 3,
                  // ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      // ClipPath(
                      //   clipper: CustomClipPath(),
                      //   child: Container(
                      //     height: 250,
                      //     color: Colors.blue,
                      //     child: Center(
                      //       child: Text(
                      //         "About Us",
                      //         style: TextStyle(
                      //           color: Colors.white,
                      //           fontSize: 36,
                      //           fontWeight: FontWeight.bold,
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      const SizedBox(height: 20),
                      // const CircleAvatar(
                      //   radius: 50,
                      //   backgroundImage: AssetImage(
                      //       'assets/images/itisiya_logo.png') // Replace with your image asset
                      // ),

                      Image.asset(
                        'assets/images/itisiya_logo.png', // Replace with your image asset
                        width: 150, // Customize the width
                        height: 150, // Customize the height
                      ),
                      const SizedBox(height: 10),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          "Our Company",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          "We are a leading company in the tech industry, providing top-notch solutions to our clients. Our team is composed of talented professionals dedicated to innovation and excellence.",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          children: [
                            ContactInfoRow(
                              icon: Icons.email,
                              text: 'contact@company.com',
                            ),
                            ContactInfoRow(
                              icon: Icons.phone,
                              text: '+1 234 567 890',
                            ),
                            ContactInfoRow(
                              icon: Icons.location_on,
                              text: '123 Main Street, Anytown, USA',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // child: Padding(
            //   padding: const EdgeInsets.only(top: 250),
            //   child: ListView.builder(
            //     itemCount: filteredItems.length,
            //     itemBuilder: (context, index) {
            //       return ListTile(
            //         contentPadding:
            //             EdgeInsets.symmetric(horizontal: 35, vertical: 0),
            //         title: Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           children: [
            //             Text(filteredItems[index]),
            //             IconButton(
            //               icon: Icon(Icons.share),
            //               onPressed: () {
            //                 // Implement share functionality here
            //                 // For demonstration, we use a simple print statement
            //                 Share.share(
            //                     'Check out this item: ${filteredItems[index]}');
            //               },
            //             ),
            //           ],
            //         ),
            //       );
            //     },
            //   ),
            // ),
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

class CustomClipPath extends CustomClipper<Path> {
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

class ContactInfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  ContactInfoRow({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.blue),
        const SizedBox(width: 10),
        Text(
          text,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
