import 'package:flutter/material.dart';
import '../service_detail_view.dart';

class HomeHeroSection extends StatelessWidget {
  const HomeHeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFFA90140),
                Color(0xFF550120),
              ],
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: Column(
            children: [
              _buildTopSection(),
              const SizedBox(height: 20),
              const Text(
                'Claim your',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Text(
                'Free Demo',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Lobster",
                  fontSize: 45,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Text(
                'for custom Music Production',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ServiceDetailView(serviceName: "Book Now"),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: const Text(
                  'Book Now',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
        Positioned(
          top: 200,
          right: -35,
          child: Transform.rotate(
            angle: 0,
            child: Image.asset(
              'assets/graphics/piano.png',
              width: 120,
              height: 120,
              fit: BoxFit.contain,
            ),
          ),
        ),
        Positioned(
          top: 210,
          left: -25,
          child: Image.asset(
            'assets/graphics/vinyl.png',
            width: 110,
            height: 110,
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }

  Widget _buildTopSection() {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: const Color(0xFF2F2F39),
                  borderRadius: BorderRadius.all(Radius.elliptical(8, 15)),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.search, color: Colors.white, size: 20),
                    const SizedBox(width: 12),
                    Text(
                      'Search "Punjabi Lyrics"',
                      style: TextStyle(
                        color: const Color(0xFF61616B),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      width: 1,
                      height: 20,
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      color: const Color(0xFF45454F),
                    ),
                    const Icon(Icons.mic, color: Colors.white, size: 20),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 16),
            Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22.5),
              ),
              child: Image.asset(
                'assets/icons/avatar.png',
                width: 24,
                height: 24,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}