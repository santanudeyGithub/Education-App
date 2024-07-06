// lib/curved_app_bar.dart
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final GlobalKey<ScaffoldState> scaffoldKey;

  CustomAppBar({this.height = 200.0, required this.scaffoldKey});

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomAppBarClipper(),
      child: Container(
        color: const Color(0xff1760AB),
        height: height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                scaffoldKey.currentState!.openDrawer();
              },
            ),
            const Align(
              alignment: Alignment.center,
              child: Text(
                'Dashboard',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              children: [
                PopupMenuButton(
                  icon: Icon(
                    Icons.more_vert, // Change this to the icon you want
                    color: Colors.white, // Change the color here
                  ),
                  itemBuilder: (BuildContext context) => [
                    PopupMenuItem(
                      child: Text("Help"),
                      value: 1,
                    ),
                    PopupMenuItem(
                      child: Text("About"),
                      value: 2,
                    ),
                    // Add more PopupMenuItems as needed
                  ],
                  onSelected: (value) {
                    // Handle item selection here
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomAppBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
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
