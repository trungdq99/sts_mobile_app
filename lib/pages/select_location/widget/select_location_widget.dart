import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sts/cubits/selected_index_cubit.dart';
import 'package:sts/models/location_model.dart';

class SelectLocationWidget extends StatelessWidget {
  final List<LocationModel> children;
  final int index;
  final ValueChanged<int> onValueChanged;

  SelectLocationWidget({
    this.children,
    this.index: 0,
    this.onValueChanged,
  });

  final SelectedIndexCubit _selectedIndexCubit = SelectedIndexCubit(0);

  @override
  Widget build(BuildContext context) {
    _selectedIndexCubit.emit(index);
    return ListView(
      children: [
        for (int i = 0; i < children.length; i++)
          _buildChild(children[i].name, children[i].id),
      ],
    );
  }

  Widget _buildChild(String title, int index) {
    return InkWell(
      child: BlocBuilder<SelectedIndexCubit, int>(
        bloc: _selectedIndexCubit,
        builder: (context, state) {
          return ListTile(
            leading: Icon(Icons.location_on),
            title: Text(title),
            trailing: index == state ? Icon(Icons.check) : null,
          );
        },
      ),
      onTap: () {
        _selectedIndexCubit.emit(index);
        if (onValueChanged != null) {
          onValueChanged(index);
        }
      },
    );
  }
}
