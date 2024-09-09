import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:passion_purpose/api_service_provider.dart';
import 'package:passion_purpose/core/theme/theme.dart';
import 'package:passion_purpose/core/widgets/custom_text_form_field.dart';
import 'package:passion_purpose/core/widgets/submit_button.dart';
import 'package:passion_purpose/features/contact/models/book_appointment_request.dart';
import 'package:passion_purpose/features/contact/models/book_appointment_response.dart';
import 'package:passion_purpose/features/contact/notifiers/book_appointment_notifier.dart';

class ContactPage extends ConsumerStatefulWidget {
  const ContactPage({super.key});

  @override
  ConsumerState<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends ConsumerState<ContactPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();

    nameController.addListener(_updateFormState);
    emailController.addListener(_updateFormState);
    subjectController.addListener(_updateFormState);
    messageController.addListener(_updateFormState);
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    subjectController.dispose();
    messageController.dispose();
    super.dispose();
  }

  void _updateFormState() {
    setState(() {});
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.redAccent,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.all(16),
      ),
    );
  }

  Future<void> _submitForm() async {
    final String subject = subjectController.text.trim();
    final String message = messageController.text.trim();

    if (subject.isEmpty) {
      _showSnackbar('Please enter the subject.');
      return;
    }
    if (selectedDate == null) {
      _showSnackbar('Please select a date.');
      return;
    }
    if (message.isEmpty) {
      _showSnackbar('Please enter your message.');
      return;
    }

    final request = BookAppointmentRequest(
      subject: subject,
      email: "",
      appointmentDate: selectedDate!.toUtc(),
      message: message,
      userId: "3fa85f64-5717-4562-b3fc-2c963f66afa6",
    );

    final appointmentNotifier = ref.read(appointmentProvider.notifier);

    try {
      // Call the booking function
      await appointmentNotifier.bookAppointment(request);
    } catch (e) {
      _showSnackbar('Unexpected error occurred.');
      print('Unexpected Error: $e');
    }
  }

  bool _isFormValid() {
    return subjectController.text.trim().isNotEmpty &&
        selectedDate != null &&
        messageController.text.trim().isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    final appointmentState = ref.watch(appointmentProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Contact Us',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: AppTheme.whiteColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Book an Appointment',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppTheme.textColor,
              ),
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              labelText: 'Subject to Discuss',
              controller: subjectController,
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () => _selectDate(context),
              child: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 18.0, horizontal: 16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      selectedDate != null
                          ? DateFormat('yyyy-MM-dd').format(selectedDate!)
                          : 'Select Date',
                      style: const TextStyle(
                        color: AppTheme.textColor,
                        fontSize: 16,
                      ),
                    ),
                    const Icon(
                      Icons.calendar_today,
                      color: AppTheme.primaryColor,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              labelText: 'Message',
              controller: messageController,
              maxLines: 5,
            ),
            const SizedBox(height: 16),
            appointmentState.when(
              data: (data) {
                if (data != null) {
                  // Show success message
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    _showSnackbar('Appointment successfully submitted!');
                  });
                }
                return SubmitButton(
                  onPressed: _isFormValid() ? _submitForm : null,
                  label: 'Submit',
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stackTrace) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  _showSnackbar('Failed to book appointment.');
                });
                return SubmitButton(
                  onPressed: _isFormValid() ? _submitForm : null,
                  label: "Submit",
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
