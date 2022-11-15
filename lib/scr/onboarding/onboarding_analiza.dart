
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'onboarding_entrena.dart';

class OnboardingStartAnaliza extends StatelessWidget {
  const OnboardingStartAnaliza({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/analiza.png'),
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
                const SizedBox(height:50),
                Text(
                  "Analiza".toUpperCase(),
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
                  'Monitorea el desempeño de tus atletas, registra \nsus resultados y compártelos en tiempo real.',
  textAlign: TextAlign.center,
                    style: GoogleFonts.rubik(
                 fontWeight: FontWeight.w400,
                 fontSize: 16,
                 color: Colors.white),                  
                ),
              ],
            ),
          ),

         
        ],
      ),
    );
  }
}
