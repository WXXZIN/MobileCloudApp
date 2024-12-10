import 'package:flutter/material.dart';

import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import 'package:resume/widgets/categoray.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    final double titleFontSize = isMobile ? 24 : 48;
    final double contentFontSize = isMobile ? 14 : 18;
    final double subTitleFontSize = isMobile ? 16 : 21;

    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Category(
              title: 'Education.',
              titleFontSize: titleFontSize,
              contentFontSize: contentFontSize,
              subTitleFontSize: subTitleFontSize,
              children: [
                Education(
                  contentFontSize: contentFontSize,
                  subTitleFontSize: subTitleFontSize,
                  isMobile: isMobile,
                ),
              ],
            ),
            const Divider(
              color: Color(0xFF374D9A),
              thickness: 1,
            ),
            Category(
              title: 'Skill.',
              titleFontSize: titleFontSize,
              contentFontSize: contentFontSize,
              subTitleFontSize: subTitleFontSize,
              children: [
                Skill(contentFontSize: contentFontSize),
              ],
            ),
            const Divider(
              color: Color(0xFF374D9A),
              thickness: 1,
            ),
            Category(
              title: 'License.',
              titleFontSize: titleFontSize,
              contentFontSize: contentFontSize,
              subTitleFontSize: subTitleFontSize,
              children: [
                License(contentFontSize: contentFontSize),
              ],
            ),
            const Divider(
              color: Color(0xFF374D9A),
              thickness: 1,
            ),
            Category(
              title: 'Self Introduction.',
              titleFontSize: titleFontSize,
              contentFontSize: contentFontSize,
              subTitleFontSize: subTitleFontSize,
              children: [
                const SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/self_introduction');
                  },
                  child: Text(
                    '자기소개서를 보려면 여기를 클릭하세요.',
                    style: TextStyle(
                      fontSize: contentFontSize,
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Education extends StatelessWidget {
  final double contentFontSize;
  final double subTitleFontSize;
  final bool isMobile;

  const Education({
    super.key,
    required this.contentFontSize,
    required this.subTitleFontSize,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildEducationDetails(),
                const SizedBox(height: 30),
                buildProject(),
              ],
            )
          : Wrap(
              spacing: 50,
              runSpacing: 30,
              alignment: WrapAlignment.start,
              runAlignment: WrapAlignment.start,
              children: [
                buildEducationDetails(),
                buildProject(),
              ],
            ),

        const SizedBox(height: 20),
      ],
    );
  }

  Widget buildEducationDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '신라대학교',
          style: TextStyle(
            fontSize: subTitleFontSize,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          '컴퓨터소프트웨어공학부',
          style: TextStyle(
            fontSize: contentFontSize,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          '2019.03 ~ 2025.02',
          style: TextStyle(
            fontSize: contentFontSize,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget buildProject() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Project',
          style: TextStyle(
            fontSize: subTitleFontSize,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 10),
        Project(contentFontSize: contentFontSize),
      ],
    );
  }
}

class Project extends StatelessWidget {
  final double contentFontSize;

  const Project({super.key, required this.contentFontSize});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildProjectSection(
          context,
          title: '태그 기반 팀원 모집 서비스(개인 프로젝트)',
          period: '2024.03 ~ 2024.12',
          skills: 'Java, TypeScript, Spring Boot, React, Flutter, MySQL, Redis',
          functions: 'JWT 인증, JSON 로그인, 소셜 로그인, 태그 검색, 팀원 모집, 일정 관리 등',
          imagePaths: ['assets/1-1.png', 'assets/1-2.png', 'assets/1-3.png', 'assets/1-4.png', 'assets/1-5.png'],
        ),
        const SizedBox(height: 20),
        buildProjectSection(
          context,
          title: '시간표 앱(팀 프로젝트)',
          period: '2023.03 ~ 2023.06',
          skills: 'Java, Android Studio, Oracle',
          functions: '오늘의 시간표, 시간표 등록, 전체 시간표, 강의실 정보 등',
          imagePaths: ['assets/2-1.png', 'assets/2-2.png', 'assets/2-3.png'],
        ),
        const SizedBox(height: 20),
        buildProjectSection(
          context,
          title: 'POS 시스템(팀 프로젝트)',
          period: '2021.09 ~ 2021.12',
          skills: 'Java, Swing, Oracle',
          functions: '상품 판매, 재고 관리, 영수증 조회, 결제 처리 등',
          imagePaths: ['assets/3-1.png', 'assets/3-2.png', 'assets/3-3.png', 'assets/3-4.png'],
        ),
      ],
    );
  }

  Widget buildProjectSection(
    BuildContext context, {
    required String title,
    required String period,
    required String skills,
    required String functions,
    required List<String> imagePaths,
  }) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    final double titleFontSize = isMobile ? 16 : 20;
    final double periodFontSize = isMobile ? 14 : 16;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProjectItem(
          title: title,
          period: period,
          titleFontSize: titleFontSize,
          periodFontSize: periodFontSize,
        ),
        ProjectSkillItem(content: skills, contentFontSize: contentFontSize),
        ProjectFunctionItem(content: functions, contentFontSize: contentFontSize),
        const SizedBox(height: 10),
        buildImageRow(context, imagePaths),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget buildImageRow(BuildContext context, List<String> imagePaths) {
    return Wrap(
      spacing: 20,
      runSpacing: 20,
      children: imagePaths.map((path) {
        return GestureDetector(
          onTap: () => _showImageDialog(context, imagePaths, imagePaths.indexOf(path)),
          child: Image.asset(
            path,
            width: 100,
            height: 100,
          ),
        );
      }).toList(),
    );
  }

  void _showImageDialog(BuildContext context, List<String> imagePaths, int initialPage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ImageDialog(imagePaths: imagePaths, initialPage: initialPage);
      },
    );
  }
}

class ProjectItem extends StatelessWidget {
  final String title;
  final String period;
  final double titleFontSize;
  final double periodFontSize;

  const ProjectItem({
    super.key,
    required this.title,
    required this.period,
    required this.titleFontSize,
    required this.periodFontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: titleFontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          period,
          style: TextStyle(
            fontSize: periodFontSize,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}

class ProjectSkillItem extends StatelessWidget {
  final String content;
  final double contentFontSize;

  const ProjectSkillItem({
    super.key,
    required this.content,
    required this.contentFontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '사용 기술: $content',
      style: TextStyle(fontSize: contentFontSize),
    );
  }
}

class ProjectFunctionItem extends StatelessWidget {
  final String content;
  final double contentFontSize;

  const ProjectFunctionItem({
    super.key,
    required this.content,
    required this.contentFontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '주요 기능: $content',
      style: TextStyle(fontSize: contentFontSize),
    );
  }
}

class ImageDialog extends StatelessWidget {
  final List<String> imagePaths;
  final int initialPage;

  const ImageDialog({super.key, required this.imagePaths, required this.initialPage});

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController(initialPage: initialPage);

    return Dialog(
      backgroundColor: Colors.black,
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: Icon(Icons.close, color: Colors.white),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          Expanded(
            child: PhotoViewGallery.builder(
              pageController: pageController,
              itemCount: imagePaths.length,
              builder: (context, index) {
                return PhotoViewGalleryPageOptions(
                  imageProvider: AssetImage(imagePaths[index]),
                  minScale: PhotoViewComputedScale.contained,
                  maxScale: PhotoViewComputedScale.covered,
                  gestureDetectorBehavior: HitTestBehavior.opaque,
                  heroAttributes: PhotoViewHeroAttributes(tag: imagePaths[index]),
                );
              },
              scrollPhysics: const ClampingScrollPhysics(),
              backgroundDecoration: const BoxDecoration(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}

class Skill extends StatelessWidget {
  final double contentFontSize;

  const Skill({super.key, required this.contentFontSize});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        buildSkillCard(
          context,
          icon: Icons.code,
          title: 'Language',
          description: 'Java, JavaScript, TypeScript, Dart',
          contentFontSize: contentFontSize,
        ),
        const SizedBox(height: 20),
        buildSkillCard(
          context,
          icon: Icons.layers,
          title: 'Framework',
          description: 'Spring, React, Flutter',
          contentFontSize: contentFontSize,
        ),
        const SizedBox(height: 20),
        buildSkillCard(
          context,
          icon: Icons.storage,
          title: 'Database',
          description: 'MySQL, Oracle, Redis',
          contentFontSize: contentFontSize,
        ),
        const SizedBox(height: 20),
        buildSkillCard(
          context,
          icon: Icons.build,
          title: 'Tools',
          description: 'Git, Docker',
          contentFontSize: contentFontSize,
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget buildSkillCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String description,
    required double contentFontSize,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(
              icon,
              size: 40,
              color: Theme.of(context).primaryColor,
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: contentFontSize + 3,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: contentFontSize,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class License extends StatelessWidget {
  final double contentFontSize;

  const License({super.key, required this.contentFontSize});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Row(
          children: [
            Text(
              '정보처리기사',
              style: TextStyle(
                fontSize: contentFontSize + 12,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(width: 20),
            Text(
              '2024.09',
              style: TextStyle(
                fontSize: contentFontSize,
                color: Colors.black,
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
