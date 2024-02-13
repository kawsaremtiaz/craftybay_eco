import 'package:flutter/material.dart';

class CreateReviewScreen extends StatefulWidget {
  const CreateReviewScreen({super.key});

  @override
  State<CreateReviewScreen> createState() => _CreateReviewScreenState();
}

class _CreateReviewScreenState extends State<CreateReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Review"),
        centerTitle: false,
      ),
      body: createReviewForm,
    );
  }

  Padding get createReviewForm {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50,),
            TextFormField(
              decoration: const InputDecoration(hintText: "First Name",),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: "Last Name",),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              maxLines: 6,
              decoration: const InputDecoration(hintText: "Write Review",),
            ),
            const SizedBox(
              height: 24,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Submit"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
