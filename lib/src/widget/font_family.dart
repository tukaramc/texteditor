import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_editor/src/font_option_model.dart';
import 'package:google_fonts/google_fonts.dart';

class FontFamily extends StatefulWidget {
  final List<FontFamilyModel> fonts;
  bool showLoading;

  FontFamily(this.fonts, this.showLoading);

  @override
  _FontFamilyState createState() => _FontFamilyState();
}

class _FontFamilyState extends State<FontFamily> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: widget.fonts
              .map((fontModel) => _FontFamilyPicker(
                  fontModel.font, fontModel.isSelected, widget.showLoading))
              .toList(),
        ),
      ),
    );
  }
}

class _FontFamilyPicker extends StatelessWidget {
  final String font;
  final bool isSelected;
  bool showLoading;

  _FontFamilyPicker(this.font, this.isSelected, this.showLoading);

  @override
  Widget build(BuildContext context) {
    FontOptionModel fontOptionModel =
        Provider.of<FontOptionModel>(context, listen: false);
    return Stack(
      children: [
        GestureDetector(
          onTap: () => fontOptionModel.selectFontFamily(font),
          child: Container(
            width: 40,
            height: 40,
            margin: EdgeInsets.only(right: 7),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: isSelected ? Colors.white : Colors.black45,
            ),
            child: Center(
              child: Text(
                'Aa',
                style: GoogleFonts.getFont(
                  font,
                  color: isSelected ? Colors.orange : Colors.white,
                ),
              ),
            ),
          ),
        ),
        showLoading
            ? Container(
                width: 40,
                height: 40,
                margin: EdgeInsets.only(right: 7),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: isSelected ? Colors.white : Colors.black,
                ),
              )
            : Container()
      ],
    );
  }
}
