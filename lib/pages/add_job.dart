import 'package:flutter/material.dart';
import 'package:tasktrail/services/auth/auth_service.dart';
import 'package:tasktrail/services/firrestore.dart';

class AddJob extends StatefulWidget {
  const AddJob({Key? key}) : super(key: key);

  @override
  State<AddJob> createState() => _AddJobState();
}

class _AddJobState extends State<AddJob> {
  final AuthService authService = AuthService();

  final FirestoreService firestoreService = FirestoreService();

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  final slotsController = TextEditingController();
  final addressController = TextEditingController();
  final contactController = TextEditingController();
  String? category;

  //get user data by email
  Future<void> getUserData() async {
    final user = await firestoreService.getUserByEmail(authService.getEmail());
  }

  void addJob() async {
    if (titleController.text.isEmpty ||
        descriptionController.text.isEmpty ||
        priceController.text.isEmpty ||
        slotsController.text.isEmpty ||
        addressController.text.isEmpty ||
        category == null) {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text(
            'Please fill all fields',
            style: TextStyle(
              fontSize: 14,
            ),
          ),
        ),
      );
      return;
    }

    await firestoreService.addJob(
      titleController.text,
      descriptionController.text,
      int.parse(priceController.text),
      int.parse(slotsController.text),
      addressController.text,
      category!,
      contactController.text,
      authService.getEmail(),
    );

    // clear fields
    titleController.clear();
    descriptionController.clear();
    priceController.clear();
    slotsController.clear();
    addressController.clear();
    contactController.clear();
    category = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      appBar: AppBar(
        title: const Text(
          "Add New Task",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 28),
        child: Form(
          child: ListView(
            children: <Widget>[
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(
                  labelText: 'Job Title',
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primaryContainer,
                    ),
                  ),
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.tertiary,
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  border: UnderlineInputBorder(),
                  filled: true,
                  fillColor: Color.fromARGB(255, 255, 255, 255),
                ),
                maxLines: null,
                keyboardType: TextInputType.multiline,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: priceController,
                decoration: const InputDecoration(
                  labelText: 'Price',
                  border: UnderlineInputBorder(),
                  filled: true,
                  fillColor: Color.fromARGB(255, 255, 255, 255),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: slotsController,
                decoration: const InputDecoration(
                  labelText: 'Available Slots',
                  border: UnderlineInputBorder(),
                  filled: true,
                  fillColor: Color.fromARGB(255, 255, 255, 255),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: addressController,
                decoration: const InputDecoration(
                  labelText: 'Address',
                  border: UnderlineInputBorder(),
                  filled: true,
                  fillColor: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: contactController,
                decoration: InputDecoration(
                  labelText: 'Contact',
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primaryContainer,
                    ),
                  ),
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.tertiary,
                ),
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: category,
                decoration: InputDecoration(
                  labelText: 'Category',
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primaryContainer,
                    ),
                  ),
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.tertiary,
                ),
                items: <String>[
                  'Engineering',
                  'Education',
                  'IT',
                  'Constructions',
                  'Healthcare',
                  'Science',
                  'Transportation',
                  'Finance',
                  'Entertainment',
                  'Sports',
                  'Gardening',
                  'Photography',
                  'Volunteer',
                  'Therapy',
                  'Household Chores',
                  'Beauty & Skincare',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  print(newValue);
                  setState(() {
                    category = newValue;
                  });
                },
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  overlayColor: MaterialStateProperty.all<Color>(Colors.green),
                  shadowColor: MaterialStateProperty.all<Color>(Colors.red),
                  elevation: MaterialStateProperty.all<double>(5),
                  padding: MaterialStateProperty.all<EdgeInsets>(
                      const EdgeInsets.all(15)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                onPressed: addJob,
                child: Text('Submit',
                    style: TextStyle(
                      color: Colors.white,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
