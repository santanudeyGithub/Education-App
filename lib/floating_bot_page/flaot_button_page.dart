import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CallButton extends StatelessWidget {
  final String phoneNumber;

  CallButton({required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: _makePhoneCall,
      child: Icon(Icons.phone),
    );
  }

  void _makePhoneCall() async {
    final url = 'tel:$phoneNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not make the call.';
    }
  }
}
