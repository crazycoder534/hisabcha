import 'package:flutter/material.dart';
import 'package:hisabcha/home/home_vm.dart';
import 'package:hisabcha/utils/constants.dart';
import 'package:hisabcha/utils/widgets.dart';
import 'package:stacked/stacked.dart';

import '../utils/h_router.dart';
import 'add_item/add_item_vu.dart';

class HomeView extends ViewModelBuilderWidget<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${viewModel.greetings()}, Ali'),
        centerTitle: true,
        elevation: 0,
      ),
      body: viewModel.data.isEmpty
          ? const Center(child: Text('Add some items'))
          : ListView.builder(
              reverse: true,
              itemCount: viewModel.data.length,
              itemBuilder: (context, index) {
                final data = viewModel.data[index];
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ExpansionTile(
                      tilePadding: EdgeInsets.zero,
                      childrenPadding: const EdgeInsets.only(bottom: 8),
                      title: Text(data.name),
                      subtitle: Text(data.category),
                      leading: CircleAvatar(
                        backgroundColor: lightPurple,
                        child: Text(data.id.toString()),
                      ),
                      trailing: Text(data.price.toString()),
                      children: [
                        Row(
                          children: [
                            iconButton(
                              color: lightGreen,
                              lable: 'Edit',
                              lableColor: green,
                            ),
                            const SizedBox(width: 8),
                            iconButton(
                              color: lightRed,
                              lable: 'Delete',
                              lableColor: red,
                              onTap: () => viewModel.deleteItem(index),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () =>
              HRouter.push(context, const AddNewItemScreen()).then((data) {
                viewModel.data.add(data);
                viewModel.notifyListeners();
              }),
          label: const Text('Add Item')),
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) {
    return HomeViewModel();
  }
}
