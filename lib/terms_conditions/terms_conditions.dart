import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';

class TermsConditionsPage extends StatefulWidget {
  const TermsConditionsPage({super.key});

  @override
  State<TermsConditionsPage> createState() => _TermsConditionsPageState();
}

class _TermsConditionsPageState extends State<TermsConditionsPage> {
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
                      padding: const EdgeInsets.only(right: 65),
                      child: Text(
                        'Terms & Conditions',
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Terms & Conditions',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal,
                        ),
                      ),
                      SizedBox(height: 20),
                      _buildSectionTitle('Introduction'),
                      _buildSectionContent(
                        'Welcome to our app. By accessing or using our app, you agree to be bound by these terms and conditions.',
                      ),
                      _buildSectionTitle('Use of the App'),
                      _buildSectionContent(
                        'You agree to use the app only for lawful purposes and in a way that does not infringe the rights of, restrict or inhibit anyone else\'s use and enjoyment of the app.',
                      ),
                      _buildSectionTitle('Changes to the Terms'),
                      _buildSectionContent(
                        'We reserve the right to modify these terms at any time. Your continued use of the app will be deemed as acceptance of the updated terms.',
                      ),
                      _buildSectionTitle('Termination'),
                      _buildSectionContent(
                        'We may terminate or suspend your access to the app at any time, without prior notice or liability, for any reason whatsoever.',
                      ),
                      _buildSectionTitle('Contact Us'),
                      _buildSectionContent(
                        'If you have any questions about these Terms & Conditions, please contact us at support@example.com.',
                      ),
                      SizedBox(height: 20),
                      _buildFooter(),
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

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildSectionContent(String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        content,
        style: TextStyle(
          fontSize: 16,
          color: Colors.black54,
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return Center(
      child: Column(
        children: [
          Divider(color: Colors.teal),
          Text(
            '© 2024 Your Company',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black45,
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
