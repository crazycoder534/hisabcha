import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hisabcha/home/add_item/add_item_vm.dart';
import 'package:stacked/stacked.dart';

import '../../utils/constants.dart';
import '../../utils/widgets.dart';

class AddNewItemScreen extends ViewModelBuilderWidget<AddNewItemVM> {
  const AddNewItemScreen({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, AddNewItemVM viewModel, Widget? child) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: viewModel.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('What did you eat today?',
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(color: purple)),
                  bigSpace,
                  imageContainer(),
                  bigSpace,
                  Expanded(
                    child: Center(
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          header('Item Name'),
                          space,
                          HTextField(
                            hintText: 'Enter Item Name',
                            validator: viewModel.nameValidator,
                            onSaved: viewModel.onNameSaved,
                          ),
                          bigSpace,
                          header('Price'),
                          space,
                          HTextField(
                            hintText: 'Enter Item Price',
                            keyboardType: TextInputType.number,
                            validator: viewModel.priceValidator,
                            onSaved: viewModel.onPriceSaved,
                          ),
                          bigSpace,
                          header('Category'),
                          space,
                          GestureDetector(
                            onTap: () => buildBottomSheet(context, viewModel)
                                .then((category) {
                              viewModel.category = category;
                              viewModel.notifyListeners();
                            }),
                            child: HTextField(
                              hintText: viewModel.category ?? 'Select Category',
                              enabled: false,
                              // validator: viewModel.categoryValidator,
                              onSaved: viewModel.onCategorySaved,
                            ),
                          ),
                          bigSpace,
                          saveButton(viewModel, context),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  AddNewItemVM viewModelBuilder(BuildContext context) {
    return AddNewItemVM();
  }
}

GestureDetector saveButton(AddNewItemVM viewModel, BuildContext context) {
  return GestureDetector(
    onTap: () {
      viewModel.onSave();
      Navigator.pop(context, viewModel.data);
    },
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
              fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white)),
    ),
  );
}

Future<dynamic> buildBottomSheet(BuildContext context, AddNewItemVM viewModel) {
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
            elevation: 0,
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

Container imageContainer() {
  return Container(
    padding: const EdgeInsets.all(16),
    clipBehavior: Clip.none,
    decoration: BoxDecoration(
        color: lightPurple,
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          colors: [purple[300]!, lightPurple!],
          begin: Alignment.bottomCenter,
          end: Alignment.center,
        )),
    height: 200,
    child: SvgPicture.asset('assets/food.svg'),
  );
}
