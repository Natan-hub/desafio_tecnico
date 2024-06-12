import 'package:desafio_tecnico/constants/const.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardCarroCarrosel extends StatefulWidget {
  final String titulo;
  final String combustivel;
  final String ano;
  final List<String> imagens;

  const CardCarroCarrosel({
    Key? key,
    required this.titulo,
    required this.combustivel,
    required this.ano,
    required this.imagens,
  }) : super(key: key);

  @override
  State<CardCarroCarrosel> createState() => _CardCarroCarroselState();
}

class _CardCarroCarroselState extends State<CardCarroCarrosel> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SizedBox(
                height: 250,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: widget.imagens.length,
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      child: Image.network(
                        widget.imagens[index],
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ),
              Positioned(
                bottom: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(widget.imagens.length, (index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentPage == index
                            ? secondaryColor
                            : Colors.grey,
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
          ListTile(
            title: Row(
              children: [
                Text(
                  'Cor:',
                  style: GoogleFonts.dmSans(
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 8),
                Text(widget.titulo),
              ],
            ),
            trailing: Text(
              widget.combustivel,
              style: const TextStyle(fontSize: 20),
            ),
            subtitle: Row(
              children: [
                Text(
                  'Ano:',
                  style: GoogleFonts.dmSans(
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 8),
                Text(widget.ano),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
