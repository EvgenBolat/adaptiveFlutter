import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Это приложение построено на MediaQuery'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    Size mediaQuerySize = MediaQuery.sizeOf(context);
    String portraitText = 'Это мне для портфолио\n*модельное лицо*';
    String landscapeText = ' — Думаешь, ты клоун?\n— Думаю, я чудо. ';
    print("Ширина экрана: ${mediaQuery.size.width}");
    print("Высота экрана: ${mediaQuery.size.height}");
    print("Коэффициент плотности пикселей: ${mediaQuery.devicePixelRatio}");
    print("Отступ сверху: ${mediaQuery.padding.top}");
    print("Ориентация: ${mediaQuery.orientation}");
    print(
      'Тип устройства: ${mediaQuery.size.shortestSide < 600 ? 'мобильное' : 'планшетное'}',
    );
    print("Цветовая схема устройства: ${mediaQuery.platformBrightness}");
    print("Системные анимации включены: ${!mediaQuery.disableAnimations}");
    bool isPortraitExample =
        MediaQuery.sizeOf(context).width < MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),

      // body: Center(
      //   // child: Container(
      //   //   //example 1
      //   //   width: MediaQuery.sizeOf(context).width * 0.8,
      //   //   height: MediaQuery.sizeOf(context).height * 0.5,
      //   //   color: Colors.amber,
      //   // ),
      //   //
      //   // child: //example 2
      //   //     MediaQuery.of(context).orientation ==
      //   //             Orientation
      //   //                 .portrait // лучше использовать MediaQuery.ofSize(context), как в примере 3
      //   //         ? Container(
      //   //           width: MediaQuery.sizeOf(context).width * 0.5,
      //   //           height: MediaQuery.sizeOf(context).height * 0.8,
      //   //           color: Colors.amber,
      //   //         )
      //   //         : Container(
      //   //           width: MediaQuery.sizeOf(context).width * 0.8,
      //   //           height: MediaQuery.sizeOf(context).height * 0.5,
      //   //           color: Colors.green,
      //   //         ),
      //   child: ListView(
      //     //example 3
      //     scrollDirection: isPortraitExample ? Axis.vertical : Axis.horizontal,
      //     children:
      //         isPortraitExample
      //             ? [
      //               Align(
      //                 alignment: Alignment.center,
      //                 child: SizedBox(
      //                   width: MediaQuery.sizeOf(context).width * 0.7,
      //                   height: MediaQuery.sizeOf(context).height * 0.5,
      //                   child: Container(color: Colors.amber),
      //                 ),
      //               ),
      //               Align(
      //                 child: SizedBox(
      //                   width: MediaQuery.sizeOf(context).width * 0.7,
      //                   height: MediaQuery.sizeOf(context).height * 0.5,
      //                   child: Container(color: Colors.green),
      //                 ),
      //               ),
      //             ]
      //             : [
      //               Align(
      //                 alignment: Alignment.center,
      //                 child: SizedBox(
      //                   width: MediaQuery.sizeOf(context).width * 0.7,
      //                   height: MediaQuery.sizeOf(context).height * 0.4,
      //                   child: Container(color: Colors.amber),
      //                 ),
      //               ),
      //               Align(
      //                 alignment: Alignment.center,
      //                 child: SizedBox(
      //                   width: MediaQuery.sizeOf(context).width * 0.7,
      //                   height: MediaQuery.sizeOf(context).height * 0.4,
      //                   child: Container(color: Colors.green),
      //                 ),
      //               ),
      //             ],
      //   ),
      // ),
      //
      //
      // body: LayoutBuilder(
      //   //example 4
      //   builder: (context, constraints) {
      //     bool isPortrait = constraints.maxHeight > constraints.maxWidth;
      //     return Padding(
      //       padding: const EdgeInsets.all(16.0),
      //       child: Flex(
      //         direction: isPortrait ? Axis.vertical : Axis.horizontal,
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         crossAxisAlignment: CrossAxisAlignment.center,
      //         textDirection: isPortrait ? TextDirection.ltr : TextDirection.rtl,
      //         children: [
      //           Align(
      //             alignment: Alignment.center,
      //             child: SizedBox(
      //               width:
      //                   isPortrait
      //                       ? mediaQuerySize.width * 0.8
      //                       : mediaQuerySize.width * 0.4,
      //               height: mediaQuerySize.height * 0.4,
      //               child: ClipRRect(
      //                 borderRadius: BorderRadius.circular(20.0),
      //                 child: Image.network(
      //                   isPortrait
      //                       ? 'https://i.pinimg.com/736x/e9/35/ba/e935ba4b888242cb4130f9abfe327394.jpg'
      //                       : 'https://i.pinimg.com/736x/5a/e7/25/5ae72564517ce82c0ba19c5267cd5248.jpg',
      //                   fit: BoxFit.cover,
      //                 ),
      //               ),
      //             ),
      //           ),

      //           const SizedBox(height: 16, width: 16),
      //           SizedBox(
      //             width:
      //                 isPortrait
      //                     ? mediaQuerySize.width * 0.8
      //                     : mediaQuerySize.width * 0.4,
      //             child: FittedBox(
      //               fit: BoxFit.contain,
      //               child: Text(
      //                 isPortrait ? portraitText : landscapeText,
      //                 textAlign: TextAlign.center,
      //                 style: const TextStyle(fontSize: 18),
      //               ),
      //             ),
      //           ),
      //         ],
      //       ),
      //     );
      //   },
      // ),
    );
  }
}
