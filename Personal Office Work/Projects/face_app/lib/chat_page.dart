import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class ImageGenerationApp extends StatefulWidget {
  @override
  _ImageGenerationAppState createState() => _ImageGenerationAppState();
}

class _ImageGenerationAppState extends State<ImageGenerationApp> {
  final String apiKey = 'YOUR_OPENAI_API_KEY'; // Replace with your OpenAI API key
  File? _selectedImage;
  String? _generatedImageUrl;
  bool _isLoading = false;

  final ImagePicker _picker = ImagePicker();

  // Method to pick an image from the gallery
  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
    }
  }

  // Method to upload an image and generate variations
  Future<void> _generateImageVariation() async {
    if (_selectedImage == null) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final request = http.MultipartRequest(
        'POST',
        Uri.parse('https://api.openai.com/v1/images/variations'),
      );

      request.headers['Authorization'] = 'Bearer $apiKey';
      request.files.add(await http.MultipartFile.fromPath(
        'image',
        _selectedImage!.path,
      ));
      request.fields['n'] = '1';
      request.fields['size'] = '1024x1024';

      final response = await request.send();
      final responseBody = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        final data = jsonDecode(responseBody);
        setState(() {
          _generatedImageUrl = data['data'][0]['url'];
        });
      } else {
        print('Error: ${responseBody}');
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  // Method to generate an image based on a prompt
  Future<void> _generateImageFromPrompt(String prompt) async {
    setState(() {
      _isLoading = true;
      _generatedImageUrl = null;
    });

    try {
      final response = await http.post(
        Uri.parse('https://api.openai.com/v1/images/generations'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $apiKey',
        },
        body: jsonEncode({
          'model': 'dall-e-3',
          'prompt': prompt,
          'n': 1,
          'size': '1024x1024',
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          _generatedImageUrl = data['data'][0]['url'];
        });
      } else {
        print('Error: ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Generation App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: _pickImage,
              child: const Text('Pick Image from Gallery'),
            ),
            const SizedBox(height: 10),
            if (_selectedImage != null)
              Image.file(
                _selectedImage!,
                height: 150,
              ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _generateImageVariation,
              child: const Text('Generate Image Variation'),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Enter Image Prompt',
                border: OutlineInputBorder(),
              ),
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  _generateImageFromPrompt(value);
                }
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _generateImageFromPrompt('A cute baby sea otter'),
              child: const Text('Generate Image from Prompt'),
            ),
            const SizedBox(height: 20),
            if (_isLoading) const CircularProgressIndicator(),
            if (_generatedImageUrl != null)
              Image.network(
                _generatedImageUrl!,
                height: 300,
              ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ImageGenerationApp(),
  ));
}
