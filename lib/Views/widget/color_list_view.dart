import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/Views/widget/color_item.dart';
import 'package:notes_app/cubits/add_note_cubit.dart/add_note_cubit.dart';

class ColorsListView extends StatefulWidget {
  const ColorsListView({super.key});

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 28 * 2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 11,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: GestureDetector(
            onTap: () {
              BlocProvider.of<AddNoteCubit>(context).currentIndex = index;
              BlocProvider.of<AddNoteCubit>(context).color =
                  BlocProvider.of<AddNoteCubit>(context).getColor(index);

              setState(() {});
            },
            child: ColorItem(
              isActive:
                  BlocProvider.of<AddNoteCubit>(context).currentIndex == index,
              index: index,
            ),
          ),
        ),
      ),
    );
  }
}
