import 'dart:io';
import 'package:flutter/material.dart';

class CommonPersonImage extends StatelessWidget {
  final String? imageUrl;

  final double size;

  final File? imageFile;
  final bool canEdit;
  final Function? onEdit;

  const CommonPersonImage(
      {Key? key,
      this.imageUrl,
      this.size = 130,
      this.canEdit = false,
      this.onEdit,
      this.imageFile})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            width: size ,
            height: size ,
            decoration: BoxDecoration(
              border: Border.all(
                  width: 4, color: Theme.of(context).scaffoldBackgroundColor),
              boxShadow: [
                BoxShadow(
                    spreadRadius: 2,
                    blurRadius: 10,
                    color: Colors.black.withOpacity(0.1),
                    offset: const Offset(0, 10))
              ],
              shape: BoxShape.circle,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: imageFile != null
                  ? Image.file(File(imageFile!.path),
                      width: size , height: size , fit: BoxFit.fill)
                  // : profileProvider.data != null
                  // ? Image.network(profileProvider.data.path, width: 130, height: 130, fit: BoxFit.fill)
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: FadeInImage.assetNetwork(
                        placeholder: 'assets/images/img_avatar_placeholder.png',
                        width: size ,
                        height: size ,
                        fit: BoxFit.cover,
                        image: imageUrl ?? '',
                        imageErrorBuilder: (c, o, s) => Image.asset(
                            'assets/images/img_avatar_placeholder.png',
                            width: size ,
                            height: size ,
                            fit: BoxFit.cover),
                      ),
                    ),
            ),
          ),
          Visibility(
            visible: canEdit,
            child: Positioned(
              bottom: 0,
              right: 0,
              child: InkWell(
                onTap: () {
                  onEdit!();
                },
                child: Container(
                  height: size/3,
                  width: size/3,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 4,
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    color: Colors.deepPurple,
                  ),
                  child:  Icon(
                    Icons.edit,
                    size: size /5,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
