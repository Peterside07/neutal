import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'onboarding/onboarding_analiza.dart';
import 'onboarding/onboarding_conecta.dart';
import 'onboarding/onboarding_entrena.dart';
import 'onboarding/onboarding_start.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int _currentPage = 0;
  final PageController _pageController = PageController(
    initialPage: 0,
  );
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Timer.periodic(
        const Duration(seconds: 7),
        (Timer timer) {
          _currentPage < 3 ? _currentPage++ : _currentPage = 0;
          if (_pageController.hasClients) {
            _pageController.animateToPage(
              _currentPage,
              duration: const Duration(milliseconds: 300),
              curve: Curves.ease,
            );
          }
        },
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) => setState(() => _currentPage = index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: Center(
          child: Stack(
            fit: StackFit.loose,
            children: [
              PageView(
                
                scrollDirection: Axis.horizontal,
                controller: _pageController,
                onPageChanged: _onPageChanged,
                children: const [
                  OnboardingStart(),
                  OnboardingStartConecta(),
                  OnboardingStartEntrena(),
                 OnboardingStartAnaliza(),
                ],
              ),
              const SizedBox(
                height: 60,
              ),
              Positioned(
                bottom: 100,
                left: 100,
                child: Padding(
                  padding: const EdgeInsets.all(48.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (int i = 0; i < 4; i++)
                        i == _currentPage
                            ? const PageViewIndicator(true)
                            : const PageViewIndicator(false)
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 40,
                left: 10,
                right: 10,
                child: Padding(
                  padding: const EdgeInsets.only(left: 24.0, right: 24),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0.0),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(27.0),
                            side: BorderSide(
                                width: 1,
                                color:
                                    const Color(0xFF8D9091).withOpacity(0.5)),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.disabled)) {
                              return Colors.grey;
                            }
                            return Colors.green;
                          },
                        ),
                        fixedSize: MaterialStateProperty.all(
                            const Size(double.infinity, 55.0)),
                      ),
                      onPressed: () {},
                      child: Text("iniciar sesión".toUpperCase(),
                          style: GoogleFonts.rubik(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: const Color(0xff1C1C1E))),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PageViewIndicator extends StatelessWidget {
  final bool isActive;

  const PageViewIndicator(this.isActive, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      height: isActive ? 10 : 10,
      width: isActive ? 10 : 10,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xff16F581) : Colors.grey,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
