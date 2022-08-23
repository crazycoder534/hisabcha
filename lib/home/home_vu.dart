import 'package:flutter/material.dart';
import 'package:hisabcha/home/home_vm.dart';
import 'package:hisabcha/utils/widgets.dart';
import 'package:stacked/stacked.dart';

class HomeView extends ViewModelBuilderWidget<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hisabcha')),
      body: viewModel.data.isEmpty
          ? const Center(child: Text('Add some items'))
          : ListView.builder(
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
                        backgroundColor: Colors.purple[100],
                        child: Text(data.id.toString()),
                      ),
                      trailing: Text(data.price.toString()),
                      children: [
                        Row(
                          children: [
                            iconButton(
                              color: Colors.green[50],
                              lable: 'Edit',
                              lableColor: Colors.green,
                            ),
                            const SizedBox(width: 8),
                            iconButton(
                              color: Colors.red[50],
                              lable: 'Delete',
                              lableColor: Colors.red,
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
          onPressed: () {}, label: const Text('Add Item')),
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) {
    return HomeViewModel();
  }
}
