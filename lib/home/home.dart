import 'package:face_detection/core/widgets/custom_container.dart';
import 'package:face_detection/vision_detector_views/face_detector_view.dart';
import 'package:face_detection/vision_detector_views/gallery_view.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Face Detection'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 40, 207, 140),
        elevation: 0,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/background.png'),
                  opacity: 0.3,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      const CustomContainer(
                        'Camera live face detection',
                        FaceDetectorView(),
                      ),
                      const SizedBox(height: 20),
                      CustomContainer(
                        'Gallery detect how many faces',
                        GalleryView(
                          title: 'Gallery Face Detection',
                          onImage: (InputImage inputImage) {},

                          onDetectorViewModeChanged: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
