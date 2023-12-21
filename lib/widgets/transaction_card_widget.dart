import 'package:flutter/material.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.85,
              child: Stack(
                children: [
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.purple.shade800,
                    ),
                  ),
                  Positioned(
                    top: 90,
                    left: 30,
                    right: 30,
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxWidth: 330,
                        minWidth: 300,
                        maxHeight: 500,
                        minHeight: 400,
                      ),
                      child: SizedBox(
                        child: ClipPath(
                          clipper: ZigZagClipper(),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.only(
                                left: 16.0,
                                right: 16.0,
                                top: 40.0,
                                bottom: 20.0,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Text(
                                      'Transaction Details',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'Product: Samsung A05',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    'Date: December 21, 2023',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    'Amount: \$100.00',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 65,
                    left: 100,
                    right: 100,
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.white,
                      child: Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          color: Colors.purple.shade800,
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.check_rounded,
                            size: 32,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      maximumSize: const Size(350, 50),
                      backgroundColor: Colors.white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.send_outlined,
                        size: 24,
                        color: Colors.purple.shade800,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Share',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple.shade800,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      maximumSize: const Size(350, 50),
                      minimumSize: const Size(350, 50),
                      backgroundColor: Colors.purple.shade800),
                  child: const Text(
                    'OK',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class WavyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(0, size.height - 20);

    final firstControlPoint = Offset(size.width / 4, size.height);
    final firstEndPoint = Offset(size.width / 2.25, size.height - 30.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    final secondControlPoint =
        Offset(size.width - (size.width / 3.25), size.height - 65);
    final secondEndPoint = Offset(size.width, size.height - 40);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class ZigZagClipperBottom extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    const double zagWidth = 5.0;
    const double zagHeight = 5.0;

    for (double i = 0; i < size.width / zagWidth; i++) {
      if (i % 2 == 0) {
        path.lineTo(i * zagWidth, size.height - zagHeight);
        path.lineTo((i + 1) * zagWidth, size.height);
      } else {
        path.lineTo((i + 1) * zagWidth, size.height - zagHeight);
        path.lineTo((i + 2) * zagWidth, size.height);
      }
    }

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class ZigZagClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    const double zagWidth = 5.0;
    const double zagHeight = 5.0;

    // Top zigzag
    for (double i = 0; i < size.width / zagWidth; i++) {
      if (i % 2 == 0) {
        path.lineTo(i * zagWidth, 0);
        path.lineTo((i + 1) * zagWidth, zagHeight);
      } else {
        path.lineTo((i + 1) * zagWidth, 0);
        path.lineTo((i + 2) * zagWidth, zagHeight);
      }
    }

    // Move to the bottom
    path.lineTo(size.width, zagHeight);

    // Bottom zigzag
    for (double i = size.width / zagWidth; i > 0; i--) {
      if (i % 2 == 0) {
        path.lineTo(i * zagWidth, size.height - zagHeight);
        path.lineTo((i - 1) * zagWidth, size.height);
      } else {
        path.lineTo((i - 1) * zagWidth, size.height - zagHeight);
        path.lineTo((i - 2) * zagWidth, size.height);
      }
    }

    path.lineTo(0, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
