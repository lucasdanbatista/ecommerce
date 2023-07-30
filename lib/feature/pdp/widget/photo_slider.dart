import 'package:flutter/material.dart';

class PhotoSlider extends StatelessWidget {
  final List<Uri> photos;
  final Size size;

  const PhotoSlider(
    this.photos, {
    super.key,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: size,
      child: PageView(
        controller: PageController(viewportFraction: 0.92),
        children: List.generate(
          photos.length,
          (index) => Padding(
            padding: EdgeInsets.only(
              right: index != photos.length - 1 ? 16 : 0,
            ),
            child: Material(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              clipBehavior: Clip.antiAlias,
              color: Theme.of(context).colorScheme.surfaceVariant,
              child: Image.network(
                photos[index].toString(),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
