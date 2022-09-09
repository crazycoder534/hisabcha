import 'package:flutter/material.dart';
import 'package:hisabcha/home/home_vm.dart';
import 'package:hisabcha/utils/constants.dart';
import 'package:hisabcha/utils/widgets.dart';
import 'package:stacked/stacked.dart';

import '../utils/h_router.dart';
import '../utils/loading_spinner.dart';
import 'add_item/add_item_vu.dart';

class HomeView extends ViewModelBuilderWidget<HomeViewModel> {
  final String name;
  const HomeView(this.name, {Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${viewModel.greetings()}, ${name.split(' ').first}'),
        centerTitle: true,
        elevation: 0,
      ),
      body: LoadingSpinner(
        loading: viewModel.isBusy || viewModel.items.isEmpty,
        linear: true,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 64),
          child: ListView.builder(
              itemCount: viewModel.items.length,
              itemBuilder: (context, index) {
                final data = viewModel.items[index];
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
                              onTap: () => HRouter.push(
                                      context,
                                      AddNewItemScreen(
                                        initialName: data.name,
                                        initialPrice: data.price.toString(),
                                        initialCategory: data.category,
                                      ))
                                  .then((item) =>
                                      viewModel.editItem(item, index)),
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
        ),
      ),
      // floatingActionButton:
      bottomSheet: GestureDetector(
        onTap: () => HRouter.push(context, const AddNewItemScreen())
            .then(viewModel.addItem),
        child: Container(
          color: purple,
          width: double.infinity,
          padding: const EdgeInsets.all(22),
          child: const Text('Add Item',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) {
    return HomeViewModel();
  }
}
