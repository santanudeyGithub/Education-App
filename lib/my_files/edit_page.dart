import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

import 'package:onboarding_flutter_app/custom_appBar/custom_appbar_screen.dart';

class EditPage extends StatefulWidget {
  final Map<String, String>? item;

  EditPage({this.item});

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _dateController;
  late TextEditingController _subjectController;
  DateTime? _selectedDate;
  File? _image;
  File? _document;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.item?['name'] ?? '');
    _subjectController =
        TextEditingController(text: widget.item?['subject'] ?? '');
    _dateController = TextEditingController(text: widget.item?['date'] ?? '');
    if (widget.item != null && widget.item!['date'] != null) {
      _selectedDate = DateFormat('yyyy-MM-dd').parse(widget.item!['date']!);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _dateController.dispose();
    _subjectController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != _selectedDate)
      setState(() {
        _selectedDate = pickedDate;
        _dateController.text = DateFormat('yyyy-MM-dd').format(_selectedDate!);
      });
  }

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  Future<void> _pickDocument() async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        _document = File(result.files.single.path!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
    return Scaffold(
      key: _scaffoldKey,
      // appBar: CustomAppBar(height: 200.0, scaffoldKey: _scaffoldKey),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(200.0),
        child: ClipPath(
          clipper: MyClipper(),
          child: Container(
            color: const Color(0xff1760AB),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back_rounded, color: Colors.white),
                  ),
                  Text(
                    'Daily Class',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(Icons.search, color: Colors.white),
                ],
              ),
            ),
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTextField(_nameController, 'Name', 'Please enter a name'),
                SizedBox(height: 20),
                _buildTextField(
                    _subjectController, 'Subject', 'Please enter a subject'),
                SizedBox(height: 20),
                _buildDateField(context),
                SizedBox(height: 20),
                Padding(
                  padding:
                      const EdgeInsets.only(right: 2.0, left: 12, top: 10.0),
                  child: Row(
                    children: [
                      _buildUploadSection(
                          'Upload Image', Icons.image, _pickImage, _image),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _buildUploadSection('Upload Document',
                            Icons.attach_file, _pickDocument, _document),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 215),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final item = {
                          'name': _nameController.text,
                          'date': _dateController.text,
                          'subject': _subjectController.text,
                          'image': _image?.path ?? '',
                          'document': _document?.path ?? '',
                        };
                        Navigator.pop(context, item);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                      backgroundColor: Color(0xff1760AB),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            10), // Increased border radius
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
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String labelText,
      String validationText) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validationText;
        }
        return null;
      },
    );
  }

  Widget _buildDateField(BuildContext context) {
    return TextFormField(
      controller: _dateController,
      decoration: InputDecoration(
        labelText: 'Date',
        suffixIcon: IconButton(
          icon: Icon(Icons.calendar_today),
          onPressed: () {
            _selectDate(context);
          },
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      readOnly: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select a date';
        }
        return null;
      },
    );
  }

  Widget _buildUploadSection(
      String labelText, IconData icon, Function() onPressed, File? file) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OutlinedButton.icon(
          onPressed: onPressed,
          icon: Icon(icon, color: Colors.blue),
          label: Text(
            labelText,
            style: TextStyle(color: Colors.blue),
          ),
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: Colors.blue, width: 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        SizedBox(height: 10),
        if (file != null)
          Text(
            'Selected: ${file.path.split('/').last}',
            overflow: TextOverflow.ellipsis,
          ),
      ],
    );
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
