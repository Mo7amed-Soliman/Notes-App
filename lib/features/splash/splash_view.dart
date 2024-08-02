import 'package:flutter/material.dart';
import 'package:notes_app/features/notes/presentation/views/notes_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    //* Initialize the animation controller
    //* Initialize the scale animation
    _initAnimation();
    //* Repeat the animation
    _repeatAnimation();
    //* Delay the navigation to the next screen
    _delayAndNavigationToNaxtView();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _scaleAnimation,
              builder: (context, child) {
                return Transform.scale(
                  scale: _scaleAnimation.value,
                  child: Image.asset(
                    'assets/images/logo.png',
                    height: 160,
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            const Text(
              'Notes App',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _delayAndNavigationToNaxtView() {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, NotesView.routeName);
    });
  }

  void _initAnimation() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _scaleAnimation =
        Tween<double>(begin: 1.0, end: 1.2).animate(_animationController);
  }

  void _repeatAnimation() {
    // Repeat the animation
    _animationController.repeat(reverse: true);
  }
}
