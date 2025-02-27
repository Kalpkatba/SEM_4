import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/userlist.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';

class AddUser extends StatefulWidget {
  final Function(Map<String, dynamic>) onUserAdded;
  final List<Map<String, dynamic>> userList;
  final Map<String, dynamic>? initialData; // Pre-fill data when editing
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
  TextEditingController state = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  String? phoneError;
  String? emailError;

  // State variables for toggling password visibility
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  String selectedGender = '';
  String selectedCountryCode = '+91';
  DateTime? selectedDOB;
  List<String> hobbies = [
    'Reading',
    'Traveling',
    'Sports',
    'ESports',
    'Music',
    'Movies or Series'
  ];
  List<String> selectedHobbies = [];

  @override
  void initState() {
    super.initState();
    if (widget.initialData != null) {
      // Pre-fill the form with existing data when editing
      name.text = widget.initialData!['name'];
      email.text = widget.initialData!['email'];
      String fullPhone = widget.initialData!['phone'];
      selectedCountryCode = fullPhone.split(' ')[0];
      phone.text = fullPhone.split(' ')[1];
      address.text = widget.initialData!['address'];
      city.text = widget.initialData!['city'];
      state.text = widget.initialData!['state'];
      selectedGender = widget.initialData!['gender'];
      selectedDOB = DateFormat('dd/MM/yyyy').parse(widget.initialData!['dob']);
      selectedHobbies = widget.initialData!['hobbies'].split(', ');
    }
  }

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    phone.dispose();
    address.dispose();
    city.dispose();
    state.dispose();
    password.dispose();
    confirmPassword.dispose();
    super.dispose();
  }

  void addUser() {
    if (validateInputs()) {
      final newUser = {
        'name': name.text,
        'email': email.text,
        'phone': '$selectedCountryCode ${phone.text}',
        'address': address.text,
        'city': city.text,
        'state': state.text,
        'gender': selectedGender,
        'dob': DateFormat('dd/MM/yyyy').format(selectedDOB!),
        'age': calculateAge(selectedDOB!),
        'hobbies': selectedHobbies.join(', '),
      };

      // Only add password if not editing
      if (!widget.isEditing) {
        newUser['password'] = password.text;
      }

      widget.onUserAdded(newUser);
      clearFields();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('User added successfully!')),
      );
    }
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

    // Validate password only when adding a new user
    if (!widget.isEditing) {
      if (password.text.isEmpty || password.text.length < 6) {
        showError('Password must be at least 6 characters long.');
        return false;
      }

      if (password.text != confirmPassword.text) {
        showError('Passwords do not match.');
        return false;
      }
    }

    return true;
  }

  void showError(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
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
    state.clear();
    selectedGender = '';
    selectedDOB = null;
    selectedHobbies.clear();
    selectedCountryCode = '+91';
    if (!widget.isEditing) {
      password.clear();
      confirmPassword.clear();
    }
  }
  // Import for InputFormatter

  Widget buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildTextField('Name', name, 'Enter your full name'),
        const SizedBox(height: 10),
        // Modify the email TextField to use TextInputType.emailAddress
        TextField(
          controller: email,
          keyboardType: TextInputType.emailAddress, // Set keyboard type for email
          decoration: InputDecoration(
            labelText: 'Email',
            hintText: 'Enter your email address',
            labelStyle: const TextStyle(
              color: Colors.black,
              fontFamily: 'Pacifico',
            ),
            prefixIcon: const Icon(Icons.email),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black),
              borderRadius: BorderRadius.all(Radius.circular(21)),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(21),
            ),
            errorText: emailError, // Shows validation error if any
          ),
          onChanged: (value) {
            setState(() {
              // Add your validation logic for email here
              if (value.isEmpty) {
                emailError = "Please enter an email address";
              } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                emailError = "Enter a valid email address";
              } else {
                emailError = null; // Clear error if input is valid
              }
            });
          },
        ),
        const SizedBox(height: 10),
        TextField(
          controller: phone,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly], // Restricts to numbers only
          decoration: InputDecoration(
            labelText: 'Phone',
            hintText: 'Enter your phone number',
            labelStyle: const TextStyle(
              color: Colors.black,
              fontFamily: 'Pacifico',
            ),
            prefixIcon: const Icon(Icons.phone),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black),
              borderRadius: BorderRadius.all(Radius.circular(21)),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(21),
            ),
            errorText: phoneError, // Shows validation error if any
          ),
          onChanged: (value) {
            setState(() {
              if (value.isEmpty) {
                phoneError = "Please enter a phone number";
              } else if (value.length == 11) {
                phoneError = "Enter a valid phone number (10 digits)";
              } else {
                phoneError = null; // Clear error if input is valid
              }
            });
          },
        ),
        const SizedBox(height: 10),
        if (!widget.isEditing) ...[
          buildPasswordField('Password', password, 'Enter a strong password'),
          const SizedBox(height: 10),
          buildPasswordField(
              'Confirm Password', confirmPassword, 'Re-enter your password'),
          const SizedBox(height: 10),
        ],
        buildTextField('Address', address, 'Enter your address'),
        const SizedBox(height: 10),
        buildTextField('City', city, 'Enter your city'),
        const SizedBox(height: 10),
        buildTextField('State', state, 'Enter your state'),
        const SizedBox(height: 10),
        buildGenderSelector(),
        const SizedBox(height: 10),
        buildDatePicker(),
        const SizedBox(height: 10),
        buildHobbiesSelector(),
      ],
    );
  }


    Widget buildModernButton(String text, VoidCallback onPressed,
      {Color? color}) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF1A253F), Color(0xFF1A253F)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }

  Widget buildTextField(
      String label, TextEditingController controller, String hintText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey.shade800),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(21),
            ),
          ),
        ),
      ],
    );
  }

  // Modified buildPasswordField with toggle eye icon
  Widget buildPasswordField(
      String label, TextEditingController controller, String hintText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        TextField(
          controller: controller,
          obscureText:
              label == 'Password' ? _obscurePassword : _obscureConfirmPassword,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.black),
            suffixIcon: IconButton(
              icon: Icon(
                label == 'Password'
                    ? (_obscurePassword
                        ? Icons.visibility
                        : Icons.visibility_off)
                    : (_obscureConfirmPassword
                        ? Icons.visibility
                        : Icons.visibility_off),
                color: Colors.black,
              ),
              onPressed: () {
                setState(() {
                  if (label == 'Password') {
                    _obscurePassword = !_obscurePassword;
                  } else {
                    _obscureConfirmPassword = !_obscureConfirmPassword;
                  }
                });
              },
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(21),
              borderSide: const BorderSide(color: Colors.white24, width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(21),
              borderSide: const BorderSide(color: Colors.black, width: 2),
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
        const Text(
          'Gender:',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        ToggleButtons(
          isSelected: [
            selectedGender == "Male",
            selectedGender == "Female"
          ],
          onPressed: (int index) {
            setState(() {
              selectedGender = index == 0 ? "Male" : "Female";
            });
          },
          borderRadius: BorderRadius.circular(21),
          selectedColor: Colors.white,
          fillColor: Color(0xFF1A253F), // Highlight color for selected button
          color: Colors.black, // Text color for unselected
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Icon(Icons.male, color: selectedGender == "Male" ? Colors.white : Colors.blue),
                  SizedBox(width: 8),
                  Text('Male'),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Icon(Icons.female, color: selectedGender == "Female" ? Colors.white : Colors.pink),
                  SizedBox(width: 8),
                  Text('Female'),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }


  Widget buildDatePicker() {
    return GestureDetector(
      onTap: () async {
        DateTime? date = await showDatePicker(
          context: context,
          initialDate: selectedDOB ?? DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
          builder: (context, child) {
            return Theme(
              data: ThemeData.light().copyWith(
                primaryColor: const Color(0xFF2E3A59),
                hintColor: const Color(0xFF1A253F),
                colorScheme:
                    const ColorScheme.light(primary: Color(0xFF2E3A59)),
                buttonTheme:
                    ButtonThemeData(textTheme: ButtonTextTheme.primary),
              ),
              child: child!,
            );
          },
        );
        if (date != null) {
          setState(() {
            selectedDOB = date;
          });
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.pink, Color(0xFF1A253F)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: const Offset(2, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              selectedDOB == null
                  ? 'Select Date of Birth'
                  : DateFormat('dd/MM/yyyy').format(selectedDOB!),
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Icon(Icons.calendar_today, color: Colors.white),
          ],
        ),
      ),
    );
  }

  Widget buildHobbiesSelector() {
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: hobbies.map((hobby) {
        bool isSelected = selectedHobbies.contains(hobby);
        return ChoiceChip(
          label: Text(
            hobby,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          selected: isSelected,
          onSelected: (selected) {
            setState(() {
              if (selected) {
                selectedHobbies.add(hobby);
              } else {
                selectedHobbies.remove(hobby);
              }
            });
          },
          checkmarkColor: Colors.green,
          backgroundColor: const Color(0xFF1A253F),
          selectedColor: const Color(0xFF1A253F),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(11),
          ),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: Container(
          child: Row(
            children: [
              const Icon(
                Icons.person_add,
                color: Colors.white,
                size: 30,
              ),
              const SizedBox(width: 15),
              Text(
                widget.isEditing ? 'Edit User' : 'Add User',
                style: TextStyle(
                  fontFamily: GoogleFonts.pacifico().fontFamily,
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 3,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.pink, Color(0xFF1A253F)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildForm(),
                const SizedBox(height: 20),
                buildModernButton(
                  widget.isEditing ? 'Update' : 'Submit',
                      () {
                    if (validateInputs()) {
                      addUser();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Userlist()),
                      );
                    } else {
                      // Optionally, show an error message
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Please correct the errors before proceeding.')),
                      );
                    }
                  },
                ),

                // const SizedBox(height: 16),
                // buildModernButton('Back', () => Navigator.pop(context)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
