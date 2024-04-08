import 'package:get/get_navigation/src/root/internacionalization.dart';

import 'Languages/En.dart';
import 'Languages/fr.dart';
import 'Languages/sp.dart';

class LocaleString extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'us_IN': en,
        'sp_SP': sp,
        'fr_FR': fr,
        // 'po_PO': po,
        // 'ru_RU': ru,
        // 'ar_AL': ar,
        // 'ch_CH': ch,
        // 'in_IND': In,
        // 'ja_JA': ja,
      };
}
