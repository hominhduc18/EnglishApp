import 'package:appenglish/values/app_assets.dart';
import 'package:appenglish/values/app_colors.dart';
import 'package:appenglish/values/app_styles.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(viewportFraction: 0.9);
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.secondColor,
      appBar: AppBar(
        backgroundColor: AppColors.secondColor,
        elevation: 0, // Đường line của cái app bar muôn mất thì cho bằng 0
        title: Text(
          'English ToDay',
          style: AppStyles.h3.copyWith(
              color: AppColors.textColor,
              fontSize: 36),),
        leading: InkWell(

          onTap: (){},
          child: Image.asset(AppAssets.menu),
        ),
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Container(
            height: size.height * 1 / 10,
              padding: const EdgeInsets.symmetric(horizontal: 24),
            alignment: Alignment.centerLeft,
            child:
                 Text(
                     '"It is amazing how complete is delusion that beauty"',
                   style: AppStyles.h5.copyWith(
                     fontSize: 12,
                     color: AppColors.textColor,
                   ),
                 ),
            ),
            Container(
              height: size.height * 2 / 3,
              child: PageView.builder(//ddeer keo qua lai
                controller: _pageController,
                  onPageChanged: (index){
                      setState(() {
                        _currentIndex  = index ;
                      });
                  },
                  itemCount: 5,
                  itemBuilder: (context, index){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 16),
                        decoration: const BoxDecoration(
                          color: AppColors.primaryColor,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black26,
                                offset: Offset(3, 6),
                                blurRadius: 6)
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(24)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.centerRight,
                              child: Image.asset(AppAssets.heart),
                            ),
                            RichText (
                                maxLines: 1,
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,

                                text: TextSpan(

                              text: 'B',
                              style: TextStyle(
                                fontFamily: FontFamily.sen,
                                  fontSize: 89,
                                  fontWeight: FontWeight.bold,
                                shadows: const [
                                  BoxShadow( // chinh do  bong cua chu
                                    color: Colors.black38,
                                    offset: Offset(3,6),
                                    blurRadius: 6,
                                  )
                                ]
                              ),
                              children: [
                                TextSpan(
                                  text: 'eautiful',
                                  style: TextStyle(
                                      fontFamily: FontFamily.sen,
                                      fontSize: 56,
                                      fontWeight: FontWeight.bold,
                                      shadows: const [
                                        BoxShadow( // chinh do  bong cua chu
                                          color: Colors.black38,
                                          offset: Offset(3,6),
                                          blurRadius: 6,
                                        )
                                      ]
                                  ),
                                ),
                              ]
                            )),
                            Padding(
                              padding: const EdgeInsets.only(top: 24),
                              child: Text(
                                  '"Think off All The Beauty Still left around you and e happy',
                                style: AppStyles.h4.copyWith(
                                  letterSpacing: 1
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SizedBox(
                height: size.height * 1 / 11,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  alignment: Alignment.center,
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return buildIndicator(index == 0, size);
                      }),
                ),
              ),
            ),
          ],
        )
      ),
      floatingActionButton:  FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        onPressed: (){
          print("exchange");
        },
        child: Image.asset(AppAssets.exchange),
      ),
    );
  }
  Widget buildIndicator(bool isActive, Size size) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      height: 8,
      margin: const EdgeInsets.symmetric(horizontal: 12),
      width: isActive ? size.width * 1 / 5 : 24,
      decoration: BoxDecoration(
          color: isActive ? AppColors.lighBlue : AppColors.lightGrey,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          boxShadow: const [
            BoxShadow(
                color: Colors.black38, offset: Offset(2, 3), blurRadius: 3)
          ]),
    );
  }
}
