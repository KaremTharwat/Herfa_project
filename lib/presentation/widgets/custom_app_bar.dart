import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herfa/business%20logic/cubits/user_cubit/get_data_cubit.dart';
import 'package:herfa/business%20logic/states/user_state/get_data_states.dart';
import 'package:herfa/constans.dart';
import 'package:herfa/presentation/widgets/custom_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.centerTitle = true,
  });
  final String title;
  final bool centerTitle;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetDataCubit, GetDataState>(
      builder: (context, state) {
        return AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: ColorsApp.primaryColorAppbarAndCard,
          title: CustomText(
            text: title,
            fontSize: 24,
          ),
          centerTitle: centerTitle,
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
