import 'package:flutter/material.dart';
import 'package:final_project/kategori/widgets/add_item_form.dart';

class AddScreen extends StatelessWidget {
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _imageFocusNode = FocusNode();
  final FocusNode _ratingFocusNode = FocusNode();
  final FocusNode _nofratingFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _nameFocusNode.unfocus();
        _imageFocusNode.unfocus();
        _ratingFocusNode.unfocus();
        _nofratingFocusNode.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Name', style : TextStyle (fontWeight: FontWeight.bold)),
          backgroundColor: Colors.yellow[600],
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.yellow[200], Colors.white],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 20.0,
            ),
            child: AddItemForm(
              nameFocusNode: _nameFocusNode,
              imageFocusNode: _imageFocusNode,
              ratingFocusNode: _ratingFocusNode,
              nofratingFocusNode: _nofratingFocusNode,
            ),
          ),
        ),
      ),
    );
  }
}