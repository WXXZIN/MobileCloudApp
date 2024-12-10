import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  void _launchURL(String url) async {
    Uri uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _sendEmail() async {
    final Uri uri = Uri(
      scheme: 'mailto',
      path: 'wxx.zin3581@gmail.com',
    );

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $uri';
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    final double fontSize = isMobile ? 35 : 70;
    final double descriptionFontSize = isMobile ? 16 : 21;

    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      margin: const EdgeInsets.symmetric(vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(
            TextSpan(
              text: '반갑습니다!\n저는 최원진입니다.',
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 30),
          Text(
            'Backend 개발자로 시작으로, Full-Stack 개발자가 되기 위해 노력하고 있는 최원진입니다. 저는 단순 코드를 작성하는 것아 아닌, 사용자에게 더 나은 경험을 제공하는 것을 목표로 하고 있습니다.',
            style: TextStyle(
              fontSize: descriptionFontSize,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 30),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                ClipOval(
                child: Image.asset(
                  'assets/profile.jpeg',
                  width: 180,
                  height: 180,
                  fit: BoxFit.cover,
                ),
                ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () => _launchURL('http://www.github.com/WXXZIN'),
                        child: Container(
                          width: 80,
                          height: 80,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage('assets/github.png'),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 30),
                      InkWell(
                        onTap: () => _sendEmail(),
                        child: Container(
                          width: 80,
                          height: 80,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage('assets/email.png'),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}