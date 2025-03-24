import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herfa/business%20logic/cubits/change_mode_cubit.dart';
import 'package:herfa/business%20logic/states/change_mode_state.dart';

class CustomSwitchDarkAndLightMode extends StatelessWidget {
  const CustomSwitchDarkAndLightMode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeModeCubit, ChangeModeState>(
      builder: (context, state) {
        return Switch(
          activeColor: Colors.white,
          activeTrackColor: Colors.black,
          inactiveTrackColor: Colors.white,
          inactiveThumbColor: Colors.black,
          value: BlocProvider.of<ChangeModeCubit>(context).isDark,
          onChanged: (value) {
            BlocProvider.of<ChangeModeCubit>(context).changeMode(value);
          },
        );
      },
    );
  }
}
