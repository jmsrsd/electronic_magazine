import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lipsum/lipsum.dart' as lipsum;
import 'package:native_pdf_renderer/native_pdf_renderer.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:path_provider/path_provider.dart' as paths;
import 'package:path/path.dart' as pathing;
import 'package:transparent_image/transparent_image.dart';
import '../common/common_screen_bar.dart';

class ContentScreen extends StatefulWidget {
  @override
  _State createState() {
    return _State();
  }
}

class _State extends State<ContentScreen> {
  final photoViewController = PhotoViewController();
  final pageController = PageController();

  PdfDocument document;

  PhotoViewComputedScale get minScale => PhotoViewComputedScale.contained;
  PhotoViewComputedScale get maxScale => PhotoViewComputedScale.contained * 3.0;

  Stream<Map<String, dynamic>> get stream async* {
    final result = <String, dynamic>{};

    result['progress'] = 0;
    result['pageImages'] = <int, Uint8List>{};

    document = await PdfDocument.openAsset(
      'assets/example_content.pdf',
    );

    final pageCount = document.pagesCount;

    for (int index = 0; index < pageCount; index++) {
      result['pageImages'][index] = kTransparentImage;
    }
    yield result;

    for (int index = 0; index < pageCount; index++) {
      if (document.isClosed) {
        return;
      }

      print('get page ${index + 1}');
      final page = await document.getPage(index + 1);

      print('render page ${index + 1}');
      final pageImage = await page.render(
        width: page.width,
        height: page.height,
        format: PdfPageFormat.JPEG,
      );

      result['pageImages'][index] = pageImage.bytes;

      print('close page ${index + 1}');
      await page.close();

      result['progress'] = index + 1;

      yield result;
    }

    await document.close();

    yield result;
  }

  @override
  void dispose() {
    if (document != null) {
      document.close().catchError((_) {
        return null;
      });
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
      ),
      child: Column(
        children: [
          Container(
            height: 24.0,
            color: Colors.black,
          ),
          Expanded(
            child: Scaffold(
              backgroundColor: Colors.black,
              body: StreamBuilder<Map<String, dynamic>>(
                stream: stream,
                builder: (context, snapshot) {
                  final data = snapshot.data;

                  if (data == null) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  final progress = data['progress'] as int;
                  final pageImages = data['pageImages'] as Map<int, Uint8List>;

                  return Column(
                    children: [
                      Expanded(
                        child: PhotoViewGallery.builder(
                          itemCount: pageImages.length,
                          pageController: pageController,
                          builder: (context, index) {
                            return PhotoViewGalleryPageOptions(
                              controller: photoViewController,
                              imageProvider: MemoryImage(pageImages[index]),
                              initialScale: minScale,
                              minScale: minScale,
                              maxScale: maxScale,
                            );
                          },
                          backgroundDecoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                          loadingBuilder: (context, event) => Center(
                            child: CircularProgressIndicator(),
                          ),
                          loadFailedChild: Center(
                            child: Icon(
                              Icons.broken_image,
                              color: Colors.white,
                            ),
                          ),
                          scrollPhysics: BouncingScrollPhysics(),
                          onPageChanged: (index) {},
                        ),
                      ),
                      LinearProgressIndicator(
                        value:
                            progress.toDouble() / pageImages.length.toDouble(),
                      ),
                      CommonScreenBar(
                        titleData: 'Baca',
                        onBackIconButtonTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
