import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onboarding_flutter_app/my_files/edit_page.dart';
import 'package:share_plus/share_plus.dart';

class FeedBackPage extends StatefulWidget {
  const FeedBackPage({super.key});

  @override
  State<FeedBackPage> createState() => _FeedBackPageState();
}

class _FeedBackPageState extends State<FeedBackPage> {
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
                      padding: const EdgeInsets.only(right: 50),
                      child: Text(
                        'Give Your Feed Back',
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
                height: 580,
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
                padding: const EdgeInsets.all(16.0),
                child: FeedbackPage(),
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

////Feed Back page widgets

class FeedbackPage extends StatefulWidget {
  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _feedbackController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _feedbackController.dispose();
    super.dispose();
  }

  void _submitFeedback() {
    if (_formKey.currentState!.validate()) {
      // Process the feedback submission
      print('Name: ${_nameController.text}');
      print('Email: ${_emailController.text}');
      print('Feedback: ${_feedbackController.text}');
      // Clear the text fields after submission
      _nameController.clear();
      _emailController.clear();
      _feedbackController.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Feedback submitted!')),
      );
    }
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      border: OutlineInputBorder(),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Feedback Page'),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: _nameController,
                decoration: _inputDecoration('Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _emailController,
                decoration: _inputDecoration('Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _feedbackController,
                decoration: _inputDecoration(''),
                maxLines: 4,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your feedback';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Center(
                // child: ElevatedButton(
                //   onPressed: _submitFeedback,
                //   child: Text('Submit Feedback'),
                // ),

                child: ElevatedButton(
                  onPressed: _submitFeedback,
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                    backgroundColor: Color(0xff1760AB),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10), // Increased border radius
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                    textStyle: TextStyle(fontSize: 16),
                  ),
                  child: Text(
                    'Save'.toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
