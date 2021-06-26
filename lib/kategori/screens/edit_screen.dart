import 'package:flutter/material.dart';
import 'package:final_project/kategori/utils/database.dart';
import 'package:final_project/kategori/widgets/edit_item_form.dart';

class EditScreen extends StatefulWidget {
  final String currentname;
  final String currentimageurl;
  final String currentdesc;
  final String currentrating;
  final String currentnumberofRating;
  final String documentId;

  EditScreen({
    this.documentId, 
    this.currentname, 
    this.currentimageurl,
    this.currentdesc,
    this.currentrating,
    this.currentnumberofRating
  });

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _imageFocusNode = FocusNode();
  final FocusNode _descFocusNode = FocusNode();
  final FocusNode _ratingFocusNode = FocusNode();
  final FocusNode _nofratingFocusNode = FocusNode();

  bool _isDeleting = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _nameFocusNode.unfocus();
        _imageFocusNode.unfocus();
        _descFocusNode.unfocus();
        _ratingFocusNode.unfocus();
        _nofratingFocusNode.unfocus();
      },
      child: Scaffold(
        //backgroundColor: CustomColors.firebaseNavy,
        appBar: AppBar(
          title: Text('Kategori'),
          backgroundColor: Colors.yellow[600],
          // backgroundColor: CustomColors.firebaseNavy,
          //title: AppBarTitle(),
          actions: [
            _isDeleting
                ? Padding(
                    padding: const EdgeInsets.only(
                      top: 10.0,
                      bottom: 10.0,
                      right: 16.0,
                    ),
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.redAccent,
                      ),
                      strokeWidth: 3,
                    ),
                  )
                : IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Colors.redAccent,
                      size: 32,
                    ),
                    onPressed: () async {
                      setState(() {
                        _isDeleting = true;
                      });

                      await DatabaseMenu.deleteItem(
                        docId: widget.documentId,
                      );

                      setState(() {
                        _isDeleting = false;
                      });

                      Navigator.of(context).pop();
                    },
                  ),
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.yellow[600], Colors.white],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 20.0,
            ),
            child: EditItemForm(
              documentId: widget.documentId,
              nameFocusNode: _nameFocusNode,
              imageFocusNode: _imageFocusNode,
              descFocusNode: _descFocusNode,
              ratingFocusNode: _ratingFocusNode,
              nofratingFocusNode: _nofratingFocusNode,
              currentname: widget.currentname,
              currentimageurl : widget.currentimageurl,
              currentdesc: widget.currentdesc,
              currentrating : widget.currentrating,
              currentnumberofRating: widget.currentnumberofRating,
            ),
          ),
        ),
      ),
    );
  }
}