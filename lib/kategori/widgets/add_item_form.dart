import 'package:final_project/pages/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:final_project/kategori/utils/database.dart';

class AddItemForm extends StatefulWidget {
  final FocusNode nameFocusNode;
  final FocusNode imageFocusNode;
  final FocusNode descFocusNode;
  final FocusNode ratingFocusNode;
  final FocusNode nofratingFocusNode;

  const AddItemForm({
    this.nameFocusNode,
    this.imageFocusNode,
    this.descFocusNode,
    this.ratingFocusNode,
    this.nofratingFocusNode,
  });

  @override
  _AddItemFormState createState() => _AddItemFormState();
}

class _AddItemFormState extends State<AddItemForm> {
  final _addItemFormKey = GlobalKey<FormState>();

  bool _isProcessing = false;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _ratingController = TextEditingController();
  final TextEditingController _nofratingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _addItemFormKey,
      child: ListView(
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
                    controller: _descController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Describe',
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
                      labelText: 'Number of Rating',
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
                      //   //CustomColors.firebaseOrange,
                      // ),
                      ),
                )
              : Container(
                  width: double.maxFinite,
                  child: RaisedButton(
                    color: Colors.yellow[600],
                    textColor: Theme.of(context).primaryColorLight,
                    onPressed: () async {
                      widget.nameFocusNode.unfocus();
                      widget.imageFocusNode.unfocus();
                      widget.descFocusNode.unfocus();
                      widget.ratingFocusNode.unfocus();
                      widget.nofratingFocusNode.unfocus();

                      if (_addItemFormKey.currentState.validate()) {
                        setState(() {
                          _isProcessing = true;
                        });

                        await DatabaseKategori.addItem(
                          name : _nameController.text,
                          imageUrl: _imageController.text,
                          desc: _descController.text,
                          rating: _ratingController.text,
                          numberOfRating: _nofratingController.text
                        );

                        setState(() {
                          _isProcessing = false;
                        });

                        Navigator.of(context).pop(HomePage());
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 16.0, bottom: 16.0, left: 16, right: 16),
                      child: Text(
                        'ADD ITEM',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          // color: CustomColors.firebaseGrey,
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