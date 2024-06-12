import 'package:desafio_tecnico/components/isVoltar.dart';
import 'package:desafio_tecnico/constants/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarComponente extends StatelessWidget implements PreferredSizeWidget {
  final bool? isVoltar;
  final double appBarHeight;
  final Widget? flexibleSpace;
  final String isTitulo;
  final SystemUiOverlayStyle? systemOverlayStyle;

  const AppBarComponente({
    super.key,
    this.isVoltar,
    this.appBarHeight = 65,
    this.systemOverlayStyle,
    this.flexibleSpace,
    required this.isTitulo,
  });

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      flexibleSpace: flexibleSpace,
      centerTitle: true,
      title: Text(
        isTitulo,
        style: GoogleFonts.dmSans(
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
      automaticallyImplyLeading: false,
      backgroundColor:
          flexibleSpace != null ? Colors.transparent : primaryColor,
      elevation: 0,
      leading: _buildLeading(),
    );
  }

  Widget _buildLeading() {
    return Row(
      children: [
        if (isVoltar != null) const Voltar(),
      ],
    );
  }
}
