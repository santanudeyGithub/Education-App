import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';

class PrivacyPolicyPage extends StatefulWidget {
  const PrivacyPolicyPage({super.key});

  @override
  State<PrivacyPolicyPage> createState() => _PrivacyPolicyPageState();
}

class _PrivacyPolicyPageState extends State<PrivacyPolicyPage> {
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
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.privacy_tip,
                                  size: 50.0,
                                  color: Colors.teal[300],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Text(
                                    'Privacy Policy',
                                    style: GoogleFonts.lato(
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.teal[800],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 16.0),
                            Text(
                              'Last updated: July 4, 2024',
                              style: GoogleFonts.lato(
                                fontSize: 16.0,
                                color: Colors.teal[600],
                              ),
                            ),
                            SizedBox(height: 16.0),
                            RichText(
                              text: TextSpan(
                                style: GoogleFonts.lato(
                                  fontSize: 16.0,
                                  color: Colors.black87,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Welcome to our Privacy Policy page. '
                                        'Your privacy is critically important to us. '
                                        'Our policy is to respect your privacy regarding any information we may collect while operating our application.\n\n',
                                  ),
                                  TextSpan(
                                    text: 'Information We Collect\n',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                    text:
                                        'We only ask for personal information when we truly need it to provide a service to you. '
                                        'We collect it by fair and lawful means, with your knowledge and consent.\n\n',
                                  ),
                                  TextSpan(
                                    text: 'How We Use Information\n',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                    text:
                                        'We use the collected information to operate and maintain our application, '
                                        'provide customer support, and improve our services.\n\n',
                                  ),
                                  TextSpan(
                                    text: 'External Links\n',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                    text:
                                        'Our application may contain links to external sites that are not operated by us. '
                                        'We strongly advise you to review the Privacy Policy of every site you visit.\n\n',
                                  ),
                                  TextSpan(
                                    text: 'Contact Us\n',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                    text:
                                        'If you have any questions about our Privacy Policy, please contact us.\n\n',
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              // onTap: () => launch('https://example.com'),
                              child: Text(
                                'Visit our website',
                                style: GoogleFonts.lato(
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16.0),
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
