import 'package:flutter/material.dart';

import 'package:resume/widgets/categoray.dart';

class SelfIntroduction extends StatelessWidget {
  const SelfIntroduction({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    final double titleFontSize = isMobile ? 24 : 48;
    final double contentFontSize = isMobile ? 14 : 18;
    final double subTitleFontSize = isMobile ? 16 : 21;

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: isMobile ? double.infinity : 1000,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Category(
                    title: 'Self Introduction.',
                    titleFontSize: titleFontSize,
                    contentFontSize: contentFontSize,
                    subTitleFontSize: subTitleFontSize,
                    children: [
                      const SizedBox(height: 20),
                      Text(
                        '성장 과정',
                        style: TextStyle(
                          color: Colors.blue[900],
                          fontSize: subTitleFontSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text.rich(
                        TextSpan(
                          style: TextStyle(fontSize: contentFontSize),
                          children: const [
                            TextSpan(
                              text: '저는 초등학교 시절, 우연히 접한 게임의 사설 서버를 통해 프로그래밍에 흥미를 느꼈습니다. '
                            ),
                            TextSpan(
                              text: '그때부터 코드의 동작 원리에 깊은 관심을 가지게 되었고, 고등학교에서 C 프로그래밍을 배우며 기초를 다졌습니다. ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: '이 경험은 대학에서 전공을 선택하는 데 중요한 영향을 미쳤습니다. '
                            ),
                            TextSpan(
                              text: '대학에서는 다양한 전공 강의를 통해 실제 개발 프로젝트를 경험하며 실력을 쌓았고, ',
                            ),
                            TextSpan(
                              text: '특히 JAVA 프로그래밍 II 수업에서 진행한 ',
                            ),
                            TextSpan(
                              text: 'POS 시스템 개발 프로젝트',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: '에서는 팀 리더로서 팀원들과 협력하여 '
                            ),
                            TextSpan(
                              text: '상품 판매, 재고 관리, 결제 처리',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: ' 등의 핵심 기능을 구현했습니다. '
                            ),
                            TextSpan(
                              text: '이 과정에서 ',
                            ),
                            TextSpan(
                              text: '사용자 친화적인 UI/UX 설계',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: '에 중점을 두었으며, 팀원들과의 원활한 협업 덕분에 프로젝트를 성공적으로 마무리할 수 있었습니다. '
                            ),
                            TextSpan(
                              text: '이 경험을 통해 문제 해결 능력, 협업 능력, 리더십을 배웠고, 개발자로서 한층 성장할 수 있었습니다.',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        '성격의 장점',
                        style: TextStyle(
                          color: Colors.blue[900],
                          fontSize: subTitleFontSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text.rich(
                        TextSpan(
                          style: TextStyle(fontSize: contentFontSize),
                          children: const [
                            TextSpan(text: '저는 '),
                            TextSpan(
                              text: '세부 사항에 신경을 많이 쓰는 편',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(text: '입니다. 세부 사항에 신경을 쓰는 덕분에 프로젝트의 품질을 높이고, '),
                            TextSpan(
                              text: '사소한 오류도 방지',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(text: '할 수 있었습니다. 특히 '),
                            TextSpan(
                              text: 'POS 시스템 개발',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(text: '을 주제로 한 팀 프로젝트에서, 다양한 기술적 문제를 해결하며 '),
                            TextSpan(
                              text: '문제 해결 능력',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(text: '을 키웠고, '),
                            TextSpan(
                              text: '팀워크',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(text: '의 중요성을 깊이 이해하게 되었습니다. 이 경험을 통해 팀을 이끌며 '),
                            TextSpan(
                              text: '리더십',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(text: '을 발휘하고, 어려운 상황에서도 팀워크와 협업을 통해 문제를 해결할 수 있었습니다.'),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        '성격의 단점',
                        style: TextStyle(
                          color: Colors.blue[900],
                          fontSize: subTitleFontSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text.rich(
                        TextSpan(
                          style: TextStyle(fontSize: contentFontSize),
                          children: const [
                            TextSpan(text: '세부 사항에 집중하다 보니 작업 시간이 오래 걸리는 경우'),
                            TextSpan(
                              text: '가 있었습니다.',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(text: ' 예를 들어, 프로젝트 초반에 세부 사항에 집중하느라 예상보다 시간이 오래 걸린 경험이 있었습니다. 이를 개선하기 위해, '),
                            TextSpan(
                              text: '우선순위를 설정',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(text: '하고 중요한 핵심 업무를 먼저 처리하는 습관을 기르며, '),
                            TextSpan(
                              text: '시간 관리 툴을 활용',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(text: '하여 일정을 효율적으로 관리하는 방법을 배웠습니다. 이 경험을 통해 업무의 효율성을 높이고, '),
                            TextSpan(
                              text: '협업 능력',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(text: '도 크게 향상되었습니다.'),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
