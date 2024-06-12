import 'package:desafio_tecnico/components/app_bar_padrao.dart';
import 'package:desafio_tecnico/components/botao_padrao.dart';
import 'package:desafio_tecnico/components/campo_form_padrao.dart';
import 'package:desafio_tecnico/components/card_carro_carrosel.dart';
import 'package:desafio_tecnico/constants/const.dart';
import 'package:desafio_tecnico/models/carro_model.dart';
import 'package:desafio_tecnico/models/lead_model.dart';
import 'package:desafio_tecnico/providers/lead-provider.dart';
import 'package:desafio_tecnico/validation/validation_mixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class CarroDetalhesScreen extends StatefulWidget {
  final CarroModel carro;

  const CarroDetalhesScreen({
    super.key,
    required this.carro,
  });

  @override
  State<CarroDetalhesScreen> createState() => _CarroDetalhesScreenState();
}

class _CarroDetalhesScreenState extends State<CarroDetalhesScreen>
    with ValidacoesMixin {
  final _formKey = GlobalKey<FormState>();

  final _userNameController = TextEditingController();

  final _userContactController = TextEditingController();

  List<String> images = [];

  @override
  void initState() {
    super.initState();
    _loadImages();
  }

  void _loadImages() {
    if (widget.carro.nomeModelo == 'ONIX PLUS') {
      images.addAll([
        'https://s3-sa-east-1.amazonaws.com/revista.mobiauto/ImagensSUVs/Chevrolet/Onix+Plus/Avalia%C3%A7%C3%A3o+vers%C3%A3o+Premier+-+fotos+Renan+Bandeira/Avalia%C3%A7%C3%A3o+Onix+Plus+-+interior1.jpg',
        'https://s2-autoesporte.glbimg.com/GMkBWk5tTVDM4LxdfC7aTaz511I=/0x0:620x413/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_cf9d035bf26b4646b105bd958f32089d/internal_photos/bs/2020/m/0/XfbVibQ1emTTQYBlt12A/2019-11-04-onixrfrente.jpg',
        'https://s2-autoesporte.glbimg.com/sqjKPgmerInSR-gVOXQhddWQbjk=/0x0:1280x854/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_cf9d035bf26b4646b105bd958f32089d/internal_photos/bs/2021/t/q/y66GEYRL6mxxbp714HIQ/chevrolet-2021-onix-premier-8403.jpg',
      ]);
    } else if (widget.carro.nomeModelo == 'JETTA') {
      images.addAll([
        'https://cdn.motor1.com/images/mgl/JYjbJ/s1/4x3/2019-volkswagen-jetta-gli-live.webp',
        'https://uploads.diariodopoder.com.br/2023/05/c10ac0f8-2batch_img_20230201_184702.jpg',
        'https://cdn.motor1.com/images/mgl/vMzeb/s1/2019-volkswagen-jetta-gli.jpg',
      ]);
    } else if (widget.carro.nomeModelo == 'HILLUX SW4') {
      images.addAll([
        'https://quatrorodas.abril.com.br/wp-content/uploads/2022/11/SW4-2023-e1669664266199.jpg?quality=70&strip=info&w=720&h=440&crop=1',
        'https://www.dasautoautomoveis.com.br/carros/194db1cad200670834cc606edfa86430-thumbjpeg-toyota-hilux-sw4-8721605-1000-750-70.jpg',
        'https://media.toyota.com.ar/d4eca76e-8e55-4105-a991-80305bd6bcea.jpeg',
      ]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBarComponente(
        isTitulo: widget.carro.nomeModelo,
        isVoltar: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              cardCarroImagemCarrosel(context, images),
              const SizedBox(height: 20),
              Text(
                'Não só um carro, mas um sonho.',
                style: GoogleFonts.dmSans(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              CampaFormPadrao(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                obscureText: false,
                labelText: 'Nome',
                textInputAction: TextInputAction.next,
                validator: (val) => combine([
                  () => isNotEmpty(val),
                  () => validaNome(val),
                ]),
                controller: _userNameController,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp("[a-zA-ZÀ-ú ]"))
                ],
                prefixIcon: const Icon(
                  Icons.account_circle,
                  color: primaryColor,
                ),
              ),
              const SizedBox(height: 20),
              CampaFormPadrao(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                obscureText: false,
                labelText: 'Email',
                textInputAction: TextInputAction.done,
                validator: (val) => combine([
                  () => isNotEmpty(val),
                  () => validaFormatoEmail(val),
                ]),
                controller: _userContactController,
                keyboardType: TextInputType.emailAddress,
                prefixIcon: const Icon(
                  Icons.email,
                  color: primaryColor,
                ),
              ),
              const SizedBox(height: 20),
              BotaoPadrao(
                nomeBotao: 'EU QUERO',
                padding: const EdgeInsets.fromLTRB(115, 20, 115, 20),
                borderRadius: BorderRadius.circular(10),
                cor: primaryColor,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final newLead = {
                      'id': 0,
                      'userName': _userNameController.text,
                      'userEmail': _userContactController.text,
                      'carId': widget.carro.id,
                    };
                    Provider.of<LeadProvider>(context, listen: false)
                        .addLead(newLead);
                    QuickAlert.show(
                      context: context,
                      type: QuickAlertType.success,
                      text: 'Garantido',
                      title: 'Sucesooo!',
                      confirmBtnText: 'OK',
                      onConfirmBtnTap: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                      },
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget cardCarroImagemCarrosel(BuildContext context, images) {
    return CardCarroCarrosel(
        titulo: widget.carro.cor,
        combustivel: widget.carro.combustivel,
        ano: '${widget.carro.ano}',
        imagens: images);
  }
}
