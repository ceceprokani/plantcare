import 'package:material_ui/material_ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rimbun/app.dart';

void main() {
  testWidgets('home renders at phone size without overflow and opens detail',
      (tester) async {
    tester.view.physicalSize = const Size(360, 800);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(const RimbunApp());
    expect(find.text('Temukan Tanaman Terbaikmu'), findsOneWidget);
    expect(find.text('Calathea'), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'zzz');
    await tester.pump();
    expect(find.text('Tanaman tidak ditemukan'), findsOneWidget);

    await tester.enterText(find.byType(TextField), '');
    await tester.pump();

    await tester.tap(find.byIcon(Icons.favorite_border).first);
    await tester.pump();
    expect(find.text('1'), findsOneWidget);
    await tester.tap(find.byTooltip('Daftar Favorit'));
    await tester.pumpAndSettle();
    expect(find.text('Tanaman Favorit (1)'), findsOneWidget);
    await tester.tapAt(const Offset(180, 20));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Lihat Info'));
    await tester.pumpAndSettle();
    expect(find.text('Penyiraman'), findsOneWidget);

    await tester.tap(find.text('Tutup'));
    await tester.pumpAndSettle();
    expect(find.text('Penyiraman'), findsNothing);
  });
}
