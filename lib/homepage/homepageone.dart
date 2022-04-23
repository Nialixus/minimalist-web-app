import 'package:flutter/material.dart';
import 'package:typewritertext/typewritertext.dart';
import 'package:url_launcher/url_launcher.dart';

import '../addons/fadein.dart';
import '../addons/texttopainter.dart';
import '../homepage/state/go.dart';

export '../homepage/homepageone.dart' show HomePageOne;

/// Displaying company's logo.
class HomePageOne extends StatelessWidget {
  const HomePageOne({Key? key, required this.done, required this.go})
      : super(key: key);
  final Go go;
  final bool done;

  @override
  Widget build(BuildContext context) {
    /// Animated title.
    const TypeWriterText animTtl = TypeWriterText(
        text: Text('ELLCASE',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 68,
              letterSpacing: 5,
            )),
        duration: Duration(milliseconds: 100),
        alignment: Alignment.centerLeft,
        maintainSize: true);

    /// Animated subtitle.
    const TypeWriterText animSbtl = TypeWriterText(
        text: Text('エルチャセ',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold)),
        duration: Duration(milliseconds: 200),
        alignment: Alignment.center);

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.2),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            logo(done, go),
            title(animTtl, done),
            subtitle(animTtl, animSbtl, done),
            company(done),
            flags(done)
          ]),
    );
  }
}

/// Company's Logo.
Widget logo(bool done, Go go) => FadeIn(
    sequence: 4,
    built: done,
    onFinish: (done) => go.getEnd(go.state.pageOneEnd),
    size: const Size(150, 150),
    child: Image.asset('assets/logo.png'));

/// Company's Nickname.
Widget title(TypeWriterText animTtl, bool done) =>
    FadeIn(built: done, child: animTtl, sequence: 1);

/// Company's Motto.
Widget subtitle(TypeWriterText title, TypeWriterText subtitle, bool done) {
  return LayoutBuilder(
      builder: (builderContext, constrains) => SizedBox(
          width: title.text.toPainter(constrains).width,
          height: subtitle.text.toPainter(constrains).height,
          child: FadeIn(
              built: done,
              sequence: 2,
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                for (int x = 0; x < 3; x++)
                  x.isEven
                      ? Expanded(
                          child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              height: 3,
                              color: Colors.black))
                      : subtitle
              ]))));
}

/// Company's Name.
Widget company(bool done) => FadeIn.text(
    built: done,
    sequence: 4,
    margin: const EdgeInsets.symmetric(vertical: 15.0),
    text: const Text('PT ELCASE SETIA HARAPAN',
        style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 2.5,
            color: Colors.black)));

/// Bottom Arrow.
Widget flags(bool done) => FadeIn(
    built: done,
    sequence: 4,
    size: const Size(120, 50),
    child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      for (int x = 0; x < 2; x++)
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: GestureDetector(
                onTap: () async => launchUrl(
                    Uri.parse('https://ellcase.my.id/${['id', 'ja'][x]}')),
                child: Image.asset('assets/flag_${['id', 'jp'][x]}.png',
                    width: 50, height: 50)))
    ]));
