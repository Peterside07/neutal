import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class OnboardingStartEntrena extends StatelessWidget {
  const OnboardingStartEntrena({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/entrena.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const moveyourmindWidget(),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                              const  SizedBox(height:40),

                Text(
                  "entrena".toUpperCase(),
                   style: GoogleFonts.rubik(fontStyle:
                    FontStyle.italic,
                 fontWeight: FontWeight.w700,
                 fontSize: 40,
                 color: const Color(0xff16F581))
                
                ),
                const SizedBox(
                  height: 15,
                ),
                 Text(
                  'Selecciona una actividad creada por el equipo \nde Neural Trainer o crea tu propio \nentrenamiento específico.',
                  textAlign: TextAlign.center,
                                      style: GoogleFonts.rubik(
                 fontWeight: FontWeight.w400,
                 fontSize: 16,
                 color: Colors.white)
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}

// ignore: camel_case_types
class moveyourmindWidget extends StatelessWidget {
  const moveyourmindWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.only(top: 68.0),
        child: Text(
          "MOVEYOURMIND",
  style: GoogleFonts.rubik(fontStyle: FontStyle.italic,
                 fontWeight: FontWeight.w700,
                 fontSize: 20,
                 color: Colors.white)        ),
      ),
    );
  }
}
