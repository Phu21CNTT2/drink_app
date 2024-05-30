import 'package:drinkapp/view/custom/auth/custom_button.dart';
import 'package:drinkapp/view/pages/auth/signin_page.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int _currentPage = 0;
  final _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: List.generate(
          _onboardingData.length,
          (index) => _buildPage(
            context,
            _onboardingData[index]['title']!,
            _onboardingData[index]['description']!,
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildPage(BuildContext context, String title, String description) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10.0),
          Text(description, textAlign: TextAlign.center, maxLines: 5),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildPreviousButton(),
          _buildIndicator(),
          _buildNextButton(),
        ],
      ),
    );
  }

  Widget _buildPreviousButton() {
    if (_currentPage == 0) {
      return const SizedBox(width: 100.0);
    }
    return CustomButton(
      onPressed: () {
        setState(() {
          if (_currentPage > 0) {
            _currentPage--;
            _pageController.jumpToPage(_currentPage);
          }
        });
      },
      name: 'Quay lại',
    );
  }

  Widget _buildIndicator() {
    return Row(
      children: [
        for (int i = 0; i < 3; i++)
          if (_currentPage == i)
            const Icon(Icons.circle, color: Colors.blue)
          else
            const Icon(Icons.circle, color: Colors.grey)
      ],
    );
  }

  Widget _buildNextButton() {
    if (_currentPage == _onboardingData.length - 1) {
      return CustomButton(
        onPressed: () {
          Navigator.pushNamedAndRemoveUntil(
            context,
            SignInPage.routeName,
            (route) => false,
          );
        },
        name: 'Bắt đầu',
      );
    } else {
      return CustomButton(
        onPressed: () {
          setState(() {
            _currentPage++;
            _pageController.jumpToPage(_currentPage);
          });
        },
        name: 'Tiếp theo',
      );
    }
  }
}

List<Map<String, String>> _onboardingData = [
  {
    'title': 'Chào mừng bạn\nđến với ứng dụng!',
    'description': 'Khám phá những tính năng tuyệt vời của chúng tôi!'
  },
  {
    'title': 'Tìm kiếm truyện yêu thích\ncủa bạn',
    'description':
        'Tìm kiếm truyện yêu thích của bạn một cách dễ dàng với ứng dụng của chúng tôi!'
  },
  {
    'title': 'Đọc truyện mọi lúc\nmọi nơi',
    'description':
        'Đọc truyện mọi lúc mọi nơi, không giới hạn một cách nhanh chóng và dễ dàng!'
  },
];