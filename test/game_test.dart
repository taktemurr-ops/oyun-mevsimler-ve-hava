import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_mevsimler_ve_hava/oyun_mevsimler_ve_hava.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(mevsimlerConfig.title.length, 33);
    expect(mevsimlerConfig.tagline.length, 33);
    for (final s in mevsimlerConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(mevsimlerConfig.gameId, mevsimlerId);
    expect(mevsimlerRules.gameId, mevsimlerId);
    expect(mevsimlerConfig.kidsMode, isTrue);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(mevsimlerRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: mevsimlerId, optionalMechanics: mevsimlerRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(mevsimlerRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
