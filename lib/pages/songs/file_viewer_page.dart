import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class FileViewerPage extends StatelessWidget {
  final String fileUrl; // z. B. Firebase Storage URL

  const FileViewerPage({super.key, required this.fileUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PDF Viewer')),
      body: SfPdfViewer.network(fileUrl),
    );
  }
}
