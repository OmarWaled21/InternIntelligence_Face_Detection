import 'package:camera/camera.dart';
import 'package:face_detection/vision_detector_views/painters/face_detector_painter.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

class ImageProcessor {
  final FaceDetector _faceDetector;

  ImageProcessor()
    : _faceDetector = FaceDetector(
        options: FaceDetectorOptions(
          enableContours: true,
          enableLandmarks: true,
        ),
      );

  Future<void> processImage(
    InputImage inputImage,
    Function(String? text, CustomPaint? customPaint) updateUI,
  ) async {
    final faces = await _faceDetector.processImage(inputImage);

    if (inputImage.metadata?.size != null &&
        inputImage.metadata?.rotation != null) {
      final painter = FaceDetectorPainter(
        faces,
        inputImage.metadata!.size,
        inputImage.metadata!.rotation,
        CameraLensDirection.front, // You can pass the lens direction if needed
      );
      updateUI(null, CustomPaint(painter: painter));
    } else {
      String text = 'Faces found: ${faces.length}\n\n';
      for (final face in faces) {
        text += 'face: ${face.boundingBox}\n\n';
      }
      updateUI(text, null);
    }
  }

  void dispose() {
    _faceDetector.close();
  }
}
