import 'package:converter/models/conversion_formats.dart';
import 'package:converter/screens/buildvu_converter_screen.dart';
import 'package:converter/themes/buttons.dart';
import 'package:converter/themes/colors.dart';
import 'package:converter/themes/dropdown_theme.dart';
import 'package:converter/themes/texts.dart';
import 'package:flutter/material.dart';

class BuildVuFormatSelection extends StatefulWidget {
  const BuildVuFormatSelection({super.key});

  @override
  State<BuildVuFormatSelection> createState() => _BuildVuFormatSelectionState();
}

class _BuildVuFormatSelectionState extends State<BuildVuFormatSelection> {
  final TextEditingController buildvuOriginalFormatController = TextEditingController();
  final TextEditingController buildvuConvertedFormatController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        StyledTitle(text: 'PDF/ Word/ PowerPoint/ Excel to HTML/ SVG', color: AppColors.buildvuPrimary,),
        
        const SizedBox(height: 20,),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // original format dropdown
            Flexible(
              child: StyledDropdown<BuildVuOriginalFormats>(
                label: const Text('Original Format'), 
                initialSelection: BuildVuOriginalFormats.pdf, 
                controller: buildvuOriginalFormatController, 
                dropdownMenuEntries: BuildVuOriginalFormats.entries,
              ),
            ),

            Flexible(child: StyledTitle(text: 'To', color: AppColors.buildvuPrimary,)),

            // converted format dropdown
            Flexible(
              child: StyledDropdown<BuildVuConvertedFormats>(
                label: const Text('Converted Format'), 
                initialSelection: BuildVuConvertedFormats.html, 
                controller: buildvuConvertedFormatController, 
                dropdownMenuEntries: BuildVuConvertedFormats.entries,
              ),
            ),
          ],
        ),

        const SizedBox(height: 20,),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset('assets/images/poweredbybuildvu.png'),
            ColorfulBgBtn(
              color: AppColors.buildvuPrimary,
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (ctx) => const BuildVuConverterScreen()));
              },
              child: StyledTitleWhite(text: 'GO',),
            ),
          ],
        ),
      ],
    );
  }
}