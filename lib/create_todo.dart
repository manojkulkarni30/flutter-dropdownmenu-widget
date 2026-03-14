import 'package:flutter/material.dart';

enum Category {
  work,
  personal,
  shopping,
  others,
}

class CreateTodo extends StatefulWidget {
  const CreateTodo({super.key});

  @override
  State<CreateTodo> createState() => _CreateTodoState();
}

class _CreateTodoState extends State<CreateTodo> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _taskDetailsController = TextEditingController();
  bool _isFormSubmitted = false;
  Category? _selectedCategory;

  @override
  void dispose() {
    _titleController.dispose();
    _taskDetailsController.dispose();
    super.dispose();
  }

  void _submitForm() {
    setState(() {
      _isFormSubmitted = true;
    });
    if (_formKey.currentState!.validate()) {
      print('Title: ${_titleController.text}');
      print('Task Details: ${_taskDetailsController.text}');
      print('Selected Category: $_selectedCategory');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Todo'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          autovalidateMode: _isFormSubmitted
              ? AutovalidateMode.onUserInteraction
              : AutovalidateMode.disabled,
          key: _formKey,
          child: Column(
            spacing: 16,
            children: [
              DropdownMenuFormField(
                expandedInsets: EdgeInsets.zero,
                enableFilter: true,
                requestFocusOnTap: true,
                label: const Text('Select Category'),
                textInputAction: TextInputAction.next,
                inputDecorationTheme: InputDecorationTheme(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                dropdownMenuEntries: <DropdownMenuEntry<Category>>[
                  const DropdownMenuEntry(
                    value: Category.work,
                    label: 'Work',
                    leadingIcon: Icon(Icons.work),
                  ),
                  const DropdownMenuEntry(
                    value: Category.personal,
                    label: 'Personal',
                    leadingIcon: Icon(Icons.person),
                  ),
                  const DropdownMenuEntry(
                    value: Category.shopping,
                    label: 'Shopping',
                    leadingIcon: Icon(Icons.shopping_cart),
                  ),
                  const DropdownMenuEntry(
                    value: Category.others,
                    label: 'Others',
                    leadingIcon: Icon(Icons.category),
                  ),
                ],
                onSelected: (value) {
                  _selectedCategory = value;
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please select a category';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _taskDetailsController,
                decoration: InputDecoration(
                  labelText: 'Task Details',
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                textInputAction: TextInputAction.done,
                maxLines: 4,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter task details';
                  }
                  return null;
                },
                onFieldSubmitted: (value) {
                  _submitForm();
                },
              ),
              FilledButton(
                onPressed: _submitForm,
                child: const Text('Create Todo'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
