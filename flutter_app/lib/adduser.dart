import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddUser extends StatefulWidget {
  final Function(Map<String, dynamic>) onUserAdded;
  final List<Map<String, dynamic>> userList;
  final Map<String, dynamic>? initialData;  // Add this
  final bool isEditing;

  const AddUser({
    super.key,
    required this.onUserAdded,
    required this.userList,
    this.initialData,
    this.isEditing = false,
  });

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController city = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.initialData != null) {
      // Pre-fill the form with existing data
      name.text = widget.initialData!['name'];
      email.text = widget.initialData!['email'];
      String fullPhone = widget.initialData!['phone'];
      selectedCountryCode = fullPhone.split(' ')[0];
      phone.text = fullPhone.split(' ')[1];
      address.text = widget.initialData!['address'];
      city.text = widget.initialData!['city'];
      selectedGender = widget.initialData!['gender'];
      selectedDOB = DateFormat('dd/MM/yyyy').parse(widget.initialData!['dob']);
      selectedHobbies = widget.initialData!['hobbies'].split(', ');
    }
  }

  String selectedGender = '';
  String selectedCountryCode = '+91';
  DateTime? selectedDOB;
  List<String> hobbies = ['Reading', 'Traveling', 'Sports', 'Music'];
  List<String> selectedHobbies = [];
  List<Map<String, dynamic>> userList = [];

  List<String> countryCodes = ['+1', '+44', '+91', '+61', '+81'];
  void addUser() {
    if (validateInputs()) {
      final newUser = {
        'name': name.text,
        'email': email.text,
        'phone': '$selectedCountryCode ${phone.text}',
        'address': address.text,
        'city': city.text,
        'gender': selectedGender,
        'dob': DateFormat('dd/MM/yyyy').format(selectedDOB!),
        'age': calculateAge(selectedDOB!),
        'hobbies': selectedHobbies.join(', '),
      };

      widget.onUserAdded(newUser);
      clearFields();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('User added successfully!')),
      );
    }
  }

  void deleteUser(int index) {
    setState(() {
      userList.removeAt(index);
    });
  }

  bool validateInputs() {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    final phoneRegex = RegExp(r'^\d{10}$');

    if (name.text.isEmpty ||
        name.text.length < 3 ||
        name.text.length > 50 ||
        !RegExp(r'^[a-zA-Z\s]+$').hasMatch(name.text)) {
      showError(
          'Name must be between 3 and 50 characters long and contain only letters.');
      return false;
    }

    if (!emailRegex.hasMatch(email.text)) {
      showError('Please enter a valid email address.');
      return false;
    }

    if (!phoneRegex.hasMatch(phone.text)) {
      showError('Phone number must be exactly 10 digits.');
      return false;
    }

    if (selectedDOB == null) {
      showError('Please select a valid date of birth.');
      return false;
    }

    if (calculateAge(selectedDOB!) < 18) {
      showError('User must be at least 18 years old.');
      return false;
    }

    if (selectedGender.isEmpty) {
      showError('Please select a gender.');
      return false;
    }

    if (selectedHobbies.isEmpty) {
      showError('Please select at least one hobby.');
      return false;
    }

    return true;
  }

  void showError(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  int calculateAge(DateTime dob) {
    final today = DateTime.now();
    int age = today.year - dob.year;
    if (today.month < dob.month ||
        (today.month == dob.month && today.day < dob.day)) {
      age--;
    }
    return age;
  }

  void clearFields() {
    name.clear();
    email.clear();
    phone.clear();
    address.clear();
    city.clear();
    selectedGender = '';
    selectedDOB = null;
    selectedHobbies.clear();
    selectedCountryCode = '+91';
  }

  Widget buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildTextField('Name', name),
        SizedBox(height: 10),
        buildTextField('Email', email),
        SizedBox(height: 10),
        buildTextField('Phone', phone),
        SizedBox(height: 10),
        buildTextField('Address', address),
        SizedBox(height: 10),
        buildTextField('City', city),
        SizedBox(height: 10),
        buildGenderSelector(),
        SizedBox(height: 10),
        buildDatePicker(),
        SizedBox(height: 10),
        buildHobbiesSelector(),
      ],
    );
  }

  Widget buildTextField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildGenderSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Gender:',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Row(
          children: [
            Expanded(
              child: RadioListTile<String>(
                value: 'Male',
                groupValue: selectedGender,
                title: Text('Male'),
                onChanged: (value) {
                  setState(() {
                    selectedGender = value!;
                  });
                },
              ),
            ),
            Expanded(
              child: RadioListTile<String>(
                value: 'Female',
                groupValue: selectedGender,
                title: Text('Female'),
                onChanged: (value) {
                  setState(() {
                    selectedGender = value!;
                  });
                },
              ),
            ),
            Expanded(
              child: RadioListTile<String>(
                value: 'Other',
                groupValue: selectedGender,
                title: Text('Other'),
                onChanged: (value) {
                  setState(() {
                    selectedGender = value!;
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildDatePicker() {
    return Row(
      children: [
        Text('DOB:'),
        TextButton(
          onPressed: () async {
            DateTime? date = await showDatePicker(
              context: context,
              initialDate: selectedDOB ?? DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
            );
            if (date != null) {
              setState(() {
                selectedDOB = date;
              });
            }
          },
          child: Text(selectedDOB == null
              ? 'Select Date'
              : DateFormat('dd/MM/yyyy').format(selectedDOB!)),
        ),
      ],
    );
  }

  Widget buildHobbiesSelector() {
    return Column(
      children: hobbies.map((hobby) {
        return CheckboxListTile(
          value: selectedHobbies.contains(hobby),
          title: Text(hobby),
          onChanged: (value) {
            setState(() {
              if (value == true) {
                selectedHobbies.add(hobby);
              } else {
                selectedHobbies.remove(hobby);
              }
            });
          },
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add User',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildForm(),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: addUser,
                  child: Text('Submit'),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Back'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}