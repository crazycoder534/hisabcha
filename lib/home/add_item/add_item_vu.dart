import 'package:flutter/material.dart';
import 'package:hisabcha/home/add_item/add_item_vm.dart';
import 'package:stacked/stacked.dart';

import '../../utils/constants.dart';
import '../../utils/widgets.dart';

class AddNewItemScreen extends ViewModelBuilderWidget<AddNewItemVM> {
  const AddNewItemScreen({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, AddNewItemVM viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: viewModel.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              header('Item Name'),
              space,
              HTextField(hintText: 'Enter Item Name'),
              bigSpace,
              header('Price'),
              space,
              HTextField(
                hintText: 'Enter Item Price',
                keyboardType: TextInputType.number,
              ),
              bigSpace,
              header('Category'),
              space,
              GestureDetector(
                onTap: () {
                  buildBottomSheet(context, viewModel).then((value) {
                    viewModel.value = value;
                    viewModel.notifyListeners();
                  });
                },
                child: HTextField(
                    hintText: viewModel.value ?? 'Select Category',
                    enabled: false),
              ),
              bigSpace,
              GestureDetector(
                onTap: () {},
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: purple,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text('Save',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> buildBottomSheet(
      BuildContext context, AddNewItemVM viewModel) {
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: purple[50],
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24), topRight: Radius.circular(24)),
        ),
        child: Column(
          children: [
            AppBar(
              title: const Text('Select Category'),
              centerTitle: true,
              leading: const SizedBox(),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: viewModel.categories.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () =>
                        Navigator.pop(context, viewModel.categories[index]),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          viewModel.categories[index],
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  AddNewItemVM viewModelBuilder(BuildContext context) {
    return AddNewItemVM();
  }
}
