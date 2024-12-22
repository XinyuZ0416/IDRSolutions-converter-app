import 'dart:io';

import 'package:converter/themes/buttons.dart';
import 'package:converter/themes/colors.dart';
import 'package:converter/themes/texts.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class SingleFilePicker extends StatefulWidget {
  const SingleFilePicker({super.key});

  @override
  State<SingleFilePicker> createState() => _SingleFilePickerState();
}

class _SingleFilePickerState extends State<SingleFilePicker> {
  late String _fileName = ""; 

  getFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if(mounted){
      // if user picked a file
      if (result != null) {
        final file = File(result.files.single.path!);
        final fileName = file.path.split("/").last;
        final fileFormat = fileName.split(".").last;

        // if user-picked file format is the original file format, set the file name
        if (fileFormat == "jpg") {
          setState(() {
            _fileName = fileName;
          });
        // otherwise tell user picked the wrong file
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Wrong file type')),
          );
        }
      // if user did not pick a file, ask user to pick a file
      } else {
        if(_fileName.isEmpty){
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Please select a file')),
          );
        }
      }
    } 
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WhiteBgBtn(
          onPressed: getFile,
          color: AppColors.dimmedBlack,
          child: StyledTitle(text: 'Select Original File', color: AppColors.dimmedBlack,),
        ),
        
        StyledText(text: _fileName.isEmpty ? "" : _fileName,),
      ],
    );
  }
}
