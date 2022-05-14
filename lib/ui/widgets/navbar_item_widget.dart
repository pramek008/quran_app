import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/bloc/page_cubit.dart';
import 'package:quran_app/theme.dart';

class NavbarItemWidget extends StatelessWidget {
  final String imgUrl;
  final int index;

  const NavbarItemWidget({
    required this.imgUrl,
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<PageCubit>().setPage(index);
      },
      child: Image.asset(
        imgUrl,
        width: 28,
        height: 28,
        color: context.read<PageCubit>().state == index
            ? scdPurpleColor
            : greyColor,
      ),
    );
  }
}
