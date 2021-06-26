import 'package:flutter/material.dart';
import 'package:final_project/kategori/utils/database.dart';

class EditItemForm extends StatefulWidget {
  final FocusNode nameFocusNode;
  final FocusNode imageFocusNode;
  final FocusNode descFocusNode;
  final FocusNode ratingFocusNode;
  final FocusNode nofratingFocusNode;
  final String currentname;
  final String currentimageurl;
  final String currentdesc;
  final String currentrating;
  final String currentnumberofRating;
  final String documentId;

  const EditItemForm({
    this.documentId, 
    this.currentname, 
    this.currentimageurl,
    this.currentdesc,
    this.currentrating,
    this.currentnumberofRating,
    this.descFocusNode,
    this.imageFocusNode,
    this.nameFocusNode,
    this.nofratingFocusNode,
    this.ratingFocusNode
  });

  @override
  _EditItemFormState createState() => _EditItemFormState();
}

class _EditItemFormState extends State<EditItemForm> {
  final _editItemFormKey = GlobalKey<FormState>();

  bool _isProcessing = false;

  TextEditingController _nameController = TextEditingController();
  TextEditingController _imageController = TextEditingController();
  TextEditingController _descController = TextEditingController();
  TextEditingController _ratingController = TextEditingController();
  TextEditingController _nofratingController = TextEditingController();

  @override
  void initState() {
    _nameController = TextEditingController(
      text: widget.currentname,
    );

    _imageController = TextEditingController(
      text: widget.currentimageurl,
    );
    _descController = TextEditingController(
      text: widget.currentdesc
    );

    _ratingController = TextEditingController(
      text: widget.currentrating
    );
    _nofratingController = TextEditingController(
      text: widget.currentnumberofRating
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _editItemFormKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 24.0),
                Padding(
                  padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: TextField(
                    controller: _nameController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      labelStyle:
                          new TextStyle(color: Colors.black54, fontSize: 16.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onChanged: (value) {
                      //
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: TextField(
                    controller: _descController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Desc',
                      labelStyle:
                          new TextStyle(color: Colors.black54, fontSize: 16.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onChanged: (value) {
                      //
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: TextField(
                    controller: _imageController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Image',
                      labelStyle:
                          new TextStyle(color: Colors.black54, fontSize: 16.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onChanged: (value) {
                      //
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: TextField(
                    controller: _ratingController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Rating',
                      labelStyle:
                          new TextStyle(color: Colors.black54, fontSize: 16.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onChanged: (value) {
                      //
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: TextField(
                    controller: _nofratingController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Number Rating',
                      labelStyle:
                          new TextStyle(color: Colors.black54, fontSize: 16.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onChanged: (value) {
                      //
                    },
                  ),
                ),
              ],
            ),
          ),
          _isProcessing
              ? Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CircularProgressIndicator(
                      // valueColor: AlwaysStoppedAnimation<Color>(
                      //   CustomColors.firebaseOrange,
                      // ),
                      ),
                )
              : Container(
                  width: double.maxFinite,
                  child: RaisedButton(
                    color: Colors.teal[600],
                    textColor: Theme.of(context).primaryColorLight,
                    onPressed: () async {
                      widget.nameFocusNode.unfocus();
                      widget.descFocusNode.unfocus();
                      widget.imageFocusNode.unfocus();
                      widget.ratingFocusNode.unfocus();
                      widget.nofratingFocusNode.unfocus();

                      if (_editItemFormKey.currentState.validate()) {
                        setState(() {
                          _isProcessing = true;
                        });

                        await DatabaseMenu.updateItem(
                          docId: widget.documentId,
                          name: _nameController.text,
                          imageUrl: _imageController.text,
                          desc:_descController.text,
                          rating: _ratingController.text,
                          numberOfRating: _nofratingController.text,
                        );

                        setState(() {
                          _isProcessing = false;
                        });

                        Navigator.of(context).pop();
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                      child: Text(
                        'UPDATE ITEM',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          //color: CustomColors.firebaseGrey,
                          letterSpacing: 2,
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