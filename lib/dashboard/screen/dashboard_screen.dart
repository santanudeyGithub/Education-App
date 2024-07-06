import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onboarding_flutter_app/about_us/about_us.dart';
import 'package:onboarding_flutter_app/custom_appBar/custom_appbar_screen.dart';
import 'package:onboarding_flutter_app/feedback/feedback.dart';
import 'package:onboarding_flutter_app/floating_bot_page/flaot_all_page_details/bot_message_body.dart';
import 'package:onboarding_flutter_app/floating_bot_page/flaot_button_page.dart';
import 'package:onboarding_flutter_app/login_screen/screens/login_screen.dart';
import 'package:onboarding_flutter_app/my_files/my_files.dart';
import 'package:onboarding_flutter_app/my_friends/my_friends.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar(height: 200.0, scaffoldKey: _scaffoldKey),
      drawer: Drawer(
        width: MediaQuery.of(context).size.width * 0.8,

        ///drawer with sidebar menu
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color(0xff1760AB),
              ),
              padding: const EdgeInsets.all(5.0),
              child: ClipRect(
                child: Row(
                  children: [
                    ClipOval(
                      child: Container(
                        color: Colors.white,
                        width: 60,
                        height: 60,
                        alignment: Alignment.center,
                        child: Text(
                          'PD',
                          style: GoogleFonts.roboto(
                            color: const Color.fromARGB(255, 46, 145, 244),
                            fontSize: 24,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Paul Davies',
                          style: GoogleFonts.roboto(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          'Edit Details',
                          style: GoogleFonts.roboto(
                              fontSize: 14,
                              color: const Color.fromARGB(255, 132, 183, 255)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.home,
                color: Color(0xff1760AB),
              ),
              title: const Text('Home'),
              onTap: () {
                // Update the UI based on drawer item selected
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.school_sharp,
                color: Color(0xff1760AB),
              ),
              title: Text(
                'My Files',
                style: GoogleFonts.roboto(color: Colors.black),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyFilesScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.people,
                color: Color(0xff1760AB),
              ),
              title: const Text('My Friends'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyFriendsPage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.info,
                color: Color(0xff1760AB),
              ),
              title: const Text('About Us'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AboutUsPage(),
                  ),
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(
                Icons.exit_to_app,
                color: Color(0xff1760AB),
              ),
              title: const Text('Logout'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),

      ///Dasboard design
      body: Stack(
        children: [
          Positioned(
            child: Padding(
              padding: const EdgeInsets.only(top: 30, left: 28, right: 15),
              child: Container(
                height: 200,
                width: 358,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.5),
                      offset: Offset(0, 2),
                      blurRadius: 4,
                    )
                  ],
                  color: const Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 166, top: 0),
            child: Positioned(
              child: Container(
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xffF2F2F2),
                  border: Border.all(
                    color: const Color.fromARGB(
                        255, 255, 255, 255), // Border color
                    width: 2.0, // Border width
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 10,
            left: 175,
            child: ClipOval(
              child: Container(
                color: const Color(0xff1760AB),
                width: 72,
                height: 72,
                alignment: Alignment.center,
                child: Text(
                  'PD',
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Positioned(
            top: 100,
            left: 140,
            child: Column(
              children: [
                Text(
                  'Paul Davies',
                  //textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff1760AB),
                  ),
                ),
                Text(
                  'View Responses',
                  //textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff3A3A3A),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            child: Padding(
              padding: const EdgeInsets.only(top: 240, left: 20, right: 5),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      height: 175,
                      width: 170,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade600.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 12,
                            offset: const Offset(
                                -2, 2), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Container(
                        width: 152,
                        height: 165,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade600.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 12,
                              offset: const Offset(
                                  -2, 2), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Icon(
                              //   HomeItemHelper.getIconData(homeItem),
                              //   color: Palette.primary,
                              //   size: 60,
                              // ),
                              // const Image(
                              //   image:
                              //       AssetImage('assets/images/Incident@.png'),
                              // ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MyFilesScreen(),
                                    ),
                                  );
                                },
                                child: const Icon(
                                  Icons.school_sharp,
                                  size: 60,
                                  color: Color(0xff1760AB),
                                ),
                              ),

                              const SizedBox(height: 5),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MyFilesScreen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'My Files',
                                  style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MyFilesScreen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "view",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: Colors.blue.shade700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 175,
                    width: 170,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade600.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 12,
                          offset:
                              const Offset(-2, 2), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Icon(
                          //   HomeItemHelper.getIconData(homeItem),
                          //   color: Palette.primary,
                          //   size: 60,
                          // ),
                          // const Image(
                          //   image: AssetImage('assets/images/Incident@.png'),
                          // ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MyFriendsPage(),
                                ),
                              );
                            },
                            child: const Icon(
                              Icons.people,
                              size: 60,
                              color: Color(0xff1760AB),
                            ),
                          ),

                          const SizedBox(height: 5),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MyFriendsPage(),
                                ),
                              );
                            },
                            child: Text(
                              'My Friends',
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: Colors.grey.shade700,
                              ),
                            ),
                          ),

                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MyFriendsPage(),
                                ),
                              );
                            },
                            child: Text(
                              "view",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: Colors.blue.shade700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            child: Padding(
              padding: const EdgeInsets.only(top: 430, left: 20, right: 5),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      height: 175,
                      width: 170,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade600.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 12,
                            offset: const Offset(
                                -2, 2), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Container(
                        width: 152,
                        height: 165,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade600.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 12,
                              offset: const Offset(
                                  -2, 2), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Icon(
                              //   HomeItemHelper.getIconData(homeItem),
                              //   color: Palette.primary,
                              //   size: 60,
                              // ),
                              // const Image(
                              //   image:
                              //       AssetImage('assets/images/Incident@.png'),
                              // ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const FeedBackPage(),
                                    ),
                                  );
                                },
                                child: const Icon(
                                  Icons.feedback,
                                  size: 60,
                                  color: Color(0xff1760AB),
                                ),
                              ),

                              const SizedBox(height: 5),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const FeedBackPage(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Feedback',
                                  style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const FeedBackPage(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "view",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: Colors.blue.shade700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 175,
                    width: 170,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade600.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 12,
                          offset:
                              const Offset(-2, 2), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Icon(
                          //   HomeItemHelper.getIconData(homeItem),
                          //   color: Palette.primary,
                          //   size: 60,
                          // ),
                          // const Image(
                          //   image: AssetImage('assets/images/Incident@.png'),
                          // ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MyFriendsPage(),
                                ),
                              );
                            },
                            child: const Icon(
                              Icons.assignment_outlined,
                              size: 60,
                              color: Color(0xff1760AB),
                            ),
                          ),

                          const SizedBox(height: 5),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MyFriendsPage(),
                                ),
                              );
                            },
                            child: Text(
                              'Practice Papers',
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: Colors.grey.shade700,
                              ),
                            ),
                          ),

                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MyFriendsPage(),
                                ),
                              );
                            },
                            child: Text(
                              "view",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: Colors.blue.shade700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 645, left: 145),
            child: Text(
              'Version - 1.0.0',
              style: GoogleFonts.roboto(
                fontSize: 18,
                color: const Color(0xff1760AB),
              ),
            ),
          ),
          FlaotingPage(),
        ],
      ),
    );
  }
}

class FlaotingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 16,
      right: 16,
      child: Container(
        width: 80, // Set the width of the button
        height: 80, // Set the height of the button
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(218, 12, 98, 141),
              Color.fromARGB(255, 33, 138, 243),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          shape: BoxShape.circle,
        ),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => BotMessageBody()));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor:
                Colors.transparent, // Make the button itself transparent
            shadowColor: Colors.transparent, // Remove shadow if needed
            shape: const CircleBorder(),
            padding: EdgeInsets.zero, // Remove padding to fill the container
          ),
          child: Center(
            child: Image.asset(
              'assets/images/logo_bot.png', // Replace with the path to your image asset
              width: 110,
              height: 110,
            ),
          ),
        ),
      ),
    );
  }
}
