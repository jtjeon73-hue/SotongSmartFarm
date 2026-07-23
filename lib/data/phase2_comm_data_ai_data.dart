import '../models/smart_farm_content.dart';

/// Phase-2 deep dive: communication, data pipeline, environment, and AI overrides.
/// Do not invent manufacturer registers, crop setpoints, or AI accuracy percentages.
const Map<String, SmartFarmContent> phase2CommDataAiOverrides = {
  'comm-rs': SmartFarmContent(
    id: 'comm-rs',
    title: 'RS-232 / RS-485 \uc2dc\ub9ac\uc5bc \ud1b5\uc2e0',
    summary:
        '\uc2a4\ub9c8\ud2b8\ud31c \ub2e4\uc7a5\uce58 \ubc84\uc2a4\ub294 \ub300\uac1c RS-485\ub2e4. '
        '2/4\uc120, A/B \uadf9\uc131, \ub370\uc774\uc9c0\uccb4\uc778, \uc885\ub2e8\u00b7\ubc14\uc774\uc5b4\uc2a4\u00b7'
        '\ucc28\ud3d0\u00b7\uc811\uc9c0, \uac70\ub9ac\u00b7\uc18d\ub3c4 \uc808\ucda9\uc744 \ud604\uc7a5 \ud45c\ub85c \uace0\uc815\ud55c\ub2e4.',
    category: '\ud1b5\uc2e0',
    difficulty: Difficulty.practical,
    contentType: ContentType.technology,
    farmTypes: const [
      FarmType.general,
      FarmType.greenhouse,
      FarmType.hydroponics,
    ],
    qualityGrade: 'A',
    verificationStatus: VerificationStatus.educationalExample,
    checkedAt: '2026-07-23',
    sections: [
      ContentSection(
        title: '\ud604\uc7a5\uc5d0\uc11c \uba3c\uc800 \uc774\ud574',
        body:
            'RS-232\ub294 \uc810\ub300\uc810(\uc9e7\uc740 \uac70\ub9ac, 1:1), RS-485\ub294 \ucc28\ub3d9 \ubc84\uc2a4\ub85c '
            '\uc5ec\ub7ec \uc2ac\ub808\uc774\ube0c(\ubcc0\ud658\uae30\u00b7\uc778\ubc84\ud130\u00b7PLC\u00b7\uacc4\uce21\uae30)\ub97c '
            '\ud55c \ubc84\uc2a4\uc5d0 \ubb36\uc744 \uc218 \uc788\ub2e4. \uc778\ud130\ub137\uc774 \ub048\uc5b4\ub3c4 \ub85c\uceec '
            '\uc218\uc9d1\u00b7\uc81c\uc5b4 \uacbd\ub85c\ub294 \ub3d9\uc791\ud574\uc57c \ud55c\ub2e4.',
        kind: SectionKind.practical,
      ),
      ContentSection(
        title: '2\uc120 vs 4\uc120',
        body:
            '\ubc18\uc774\uc911 2\uc120(A/B) \uad6c\uc131\uc774 \uc2a4\ub9c8\ud2b8\ud31c\uc5d0\uc11c \uac00\uc7a5 \ud754\ud558\ub2e4. '
            '\uc804\uc774\uc911 4\uc120\uc740 \uc1a1\uc2e0/\uc218\uc2e0 \uc30d\uc774 \ubd84\ub9ac\ub418\uc5b4 \ud0c0\uc774\ubc0d\uc774 '
            '\uc5ec\uc720\ud560 \uc218 \uc788\uc73c\ub098 \ubc30\uc120\u00b7\uc7a5\uce58 \uc9c0\uc6d0\uc744 \ub9e4\ub274\uc5bc\ub85c '
            '\ud655\uc778\ud574\uc57c \ud55c\ub2e4. \u201c4\uc120\uc774 \ubb34\uc870\uac74 \ub354 \uc88b\ub2e4\u201d\uace0 \ubcf4\uc9c0 \ub9d0\ub77c.',
        bullets: const [
          '2\uc120: \ubc18\uc774\uc911, DE/\uBC29\ud5a5 \uc804\ud658 \ud0c0\uc774\ubc0d \uc911\uc694',
          '4\uc120: TX+/TX-, RX+/RX- \ub77c\ubca8\uacfc \uc885\ub2e8 \uc704\uce58 \ud655\uc778',
          '\uc7a5\uce58 \ub9e4\ub274\uc5bc\uc758 \ubc30\uc120\ub3c4\u00b7\ud54c \uba85\uce6d\uc744 \uc6b0\uc120',
        ],
        kind: SectionKind.important,
      ),
      ContentSection(
        title: 'A/B \uadf9\uc131\u00b7\ub77c\ubca8',
        body:
            '\uc81c\uc870\uc0ac\ub9c8\ub2e4 Data+/Data-, D+/D-, A/B \ud45c\uae30\uac00 \ub2e4\ub974\ub2e4. '
            '\ud55c\ucabd\ub9cc \ubc18\uc804\ub418\uba74 \ud1b5\uc2e0\uc774 \ubd88\uc548\uc815\ud574\uc9c0\uac70\ub098 '
            '\uc804\ud600 \uc548 \ub41c\ub2e4. \ud604\uc7a5 \ud45c\uc5d0 \uc7a5\uce58\ubcc4 A/B(+\u2212) \ub9e4\ud551\uc744 '
            '\uae30\ub85d\ud55c\ub2e4.',
        kind: SectionKind.caution,
      ),
      ContentSection(
        title: '\ub370\uc774\uc9c0\uccb4\uc778 vs \uc2a4\ud0c0',
        body:
            '\ubc84\uc2a4\ub294 \ub370\uc774\uc9c0\uccb4\uc778(\uc77c\uc5f4)\uc774 \ubc18\uc0ac\u00b7\ub178\uc774\uc988\uc5d0 '
            '\uc720\ub9ac\ud558\ub2e4. \uc2a4\ud0c0(\ubcc4\ud615)\ubd84\uae30\ub294 \ubc18\uc0ac\u00b7\uc804\uc704\ucc28\ub97c '
            '\uc27d\uac8c \ub9cc\ub4e0\ub2e4. \uae34 \ub4dc\ub86d\uc120 \ub2e4\uc218\ub294 \ud53c\ud558\uace0, '
            '\ud544\uc694 \uc2dc \ub9ac\ud53c\ud130\u00b7\uc138\uadf8\uba3c\ud2b8\ub97c \uac80\ud1a0\ud55c\ub2e4.',
        kind: SectionKind.practical,
      ),
      ContentSection(
        title:
            '\uc885\ub2e8\u00b7\ubc14\uc774\uc5b4\uc2a4\u00b7\ucc28\ud3d0\u00b7\uc811\uc9c0',
        body:
            '\ubc84\uc2a4 \uc591\ub2e8 \uc885\ub2e8(\ud1b5\uc0c1 120\u03a9 \ubd80\uadfc, \ub9e4\ub274\uc5bc \ud655\uc778), '
            '\uc720\ud734\uc2dc \ubc14\uc774\uc5b4\uc2a4, \ucc28\ud3d0 \ud55c\uc810 \uc811\uc9c0, \uacf5\ud1b5 '
            '\uae30\uc900(SG/\uc811\uc9c0)\uc744 \ub3c4\uba74\u00b7\uc7a5\ube44 \uae30\uc900\uc5d0 \ub9de\ucd98\ub2e4. '
            '\ucc28\ud3d0\ub97c \uc591\ub2e8\uc5d0\uc11c \ub04a\uc73c\uba74 \ub8e8\ud504\uac00 \uc0dd\uae38 \uc218 \uc788\ub2e4.',
        bullets: const [
          '\uc885\ub2e8: \ubc84\uc2a4 \uc591\ub05d, \uc911\uac04 \ub178\ub4dc\uc5d0 \ubb34\ucc28\ubcc4 \uc885\ub2e8 \uae08\uc9c0',
          '\ucc28\ud3d0: \ud55c\uc810 \uc811\uc9c0 \uc6d0\uce59(\ub3c4\uba74 \uae30\uc900)',
          '\uc804\uc6d0\uc120\uacfc \ubb36\uc9c0 \ub9d0\uace0 \uc774\uaca9\u00b7\uad50\ucc28 \uac80\ud1a0',
        ],
        kind: SectionKind.important,
      ),
      ContentSection(
        title: '\uac70\ub9ac\u00b7\uc18d\ub3c4 \uc808\ucda9',
        body:
            '\uc18d\ub3c4\uac00 \ub192\uc744\uc218\ub85d \uc2e4\ud6a8 \uac70\ub9ac\uac00 \uc904\uc5b4\ub4e0\ub2e4. '
            '9600\u00b719200\u00b738400 bps \ub4f1\uc774 \ud754\ud558\ub098, \ud604\uc7a5 \uc7a5\ube44\u00b7\ub178\uc774\uc988'
            '\u00b7\uc7a5\uce58 \uc218\uc5d0 \ub9de\ucdb0 \ud569\uc758\ud55c\ub2e4. \u201c\ucd5c\ub300 \uac70\ub9ac=\ud56d\uc0c1 '
            '\ubcf4\uc7a5\u201d\uc774 \uc544\ub2c8\ub2e4.',
        kind: SectionKind.expertNote,
      ),
      ContentSection(
        title: '\uc9c4\ub2e8 \uccb4\ud06c\ub9ac\uc2a4\ud2b8',
        body:
            '\ud1b5\uc2e0 \ubd88\uc548 \uc2dc \uc544\ub798\ub97c \uc21c\uc11c\ub300\ub85c \ud655\uc778\ud55c\ub2e4.',
        kind: SectionKind.practical,
        copyText:
            '[RS-485 \ud604\uc7a5 \uc9c4\ub2e8]\n'
            '1. A/B(+\u2212) \uadf9\uc131\u00b7\ub77c\ubca8 \uc77c\uce58\n'
            '2. \ubcf4\ub808\uc774\ud2b8/\ud328\ub9ac\ud2f0/\uc2a4\ud1b1\ube44\ud2b8 \uc77c\uce58\n'
            '3. \ubc84\uc2a4 \uc591\ub05d \uc885\ub2e8, \uc911\uac04 \ub178\ub4dc \uc885\ub2e8 \uc720\ubb34\n'
            '4. \ucc28\ud3d0 \uc811\uc9c0 \uc704\uce58(\ud55c\uc810\uc778\uc9c0)\n'
            '5. \uc2ac\ub808\uc774\ube0c \uc804\uc6d0\u00b7\uacf5\ud1b5 \uae30\uc900\n'
            '6. \ub370\uc774\uc9c0\uccb4\uc778 vs \uc2a4\ud0c0/\uae34 \ub4dc\ub86d\uc120\n'
            '7. \uc624\uc2e4\ub85c\uc2a4\ucf54\ud504\u00b7\uc2dc\ub9ac\uc5bc \ubaa8\ub2c8\ud130\ub85c \ud504\ub808\uc784 \ud655\uc778',
        codeLanguage: 'text',
      ),
      ContentSection(
        title: '\uc548\uc804',
        body:
            '\ud1b5\uc2e0 \uc624\ub958\ub97c \uc13c\uc11c \uace0\uc7a5\uc73c\ub85c \uc624\uc778\ud558\uc9c0 \ub9d0\ub77c. '
            '\uac12\uc774 \ube59\uae30\uac70\ub098 \ub3d9\uacb0\ub418\uba74 \uc790\ub3d9\uc744 \uc720\uc9c0\ud558\uc9c0 \ub9d0\uace0 '
            '\uc218\ub3d9 \ubaa8\ub4dc\ub85c \ub3cc\ub9b0 \ub4a4 \ud604\uc7a5\uc744 \ud655\uc778\ud55c\ub2e4.',
        kind: SectionKind.safety,
      ),
      ContentSection(
        title: '\uc704\ud5d8 \uc0c1\ud669',
        body:
            '\ud1b5\uc2e0 \uc911\ub2e8\uc73c\ub85c \ud658\uae30\u00b7\ub0a8\ubc29\u00b7\uc591\uc561 \ud38c\ud504\uac00 '
            '\uba38\ubb34\ub974\uba74 \uc2dc\uc124\u00b7\uac00\ucd95 \uc704\ud5d8\uc774 \uae09\uc99d\ud55c\ub2e4. '
            '\u201c\ub9c8\uc9c0\ub9c9 \uac12 \uc720\uc9c0\u201d\uac00 \ud56d\uc0c1 \uc548\uc804\ud558\uc9c0 \uc54a\ub2e4.',
        kind: SectionKind.danger,
      ),
      ContentSection(
        title: '\ud604\uc7a5\uac80\uc99d \ud544\uc694',
        body:
            '\uc885\ub2e8\u00b7\ubc14\uc774\uc5b4\uc2a4\u00b7\ucd5c\ub300 \uc7a5\uce58 \uc218\u00b7\uc2e4\ud6a8 \uac70\ub9ac\ub294 '
            '\ubc30\uc120\u00b7\ud658\uacbd\uc5d0 \ub530\ub77c \ub2ec\ub77c \ud604\uc7a5 \uac80\uc99d\uc774 \ud544\uc694\ud558\ub2e4.',
        kind: SectionKind.fieldValidation,
      ),
      ContentSection(
        title: '\uc81c\uc870\uc0ac \ub9e4\ub274\uc5bc',
        body:
            'A/B \ud54c \uba85\uce6d, \uc885\ub2e8 \uac12, \ubc14\uc774\uc5b4\uc2a4 \ub0b4\uc7a5 \uc720\ubb34, \ucd5c\ub300 '
            '\uc7a5\uce58 \uc218\ub294 \ubaa8\ub378\ubcc4\ub85c \ub2e4\ub974\ub2e4. \uad50\uc7ac \uc22b\uc790\ub97c '
            '\uc7a5\ube44\uc5d0 \uadf8\ub300\ub85c \ubcf5\uc0ac\ud558\uc9c0 \ub9d0\ub77c.',
        kind: SectionKind.manufacturer,
      ),
    ],
    keywords: const [
      'RS-485',
      '2\uc120',
      '4\uc120',
      'A/B',
      '\uc885\ub2e8',
      '\ubc14\uc774\uc5b4\uc2a4',
      '\ucc28\ud3d0',
      '\ub370\uc774\uc9c0\uccb4\uc778',
    ],
    relatedIds: const ['comm-modbus-rtu', 'comm-diagnostics', 'comm-gateway'],
    sourceIds: const ['src-modbus', 'src-sensor-edu'],
    tocTitles: const [
      '\ud604\uc7a5\uc5d0\uc11c \uba3c\uc800 \uc774\ud574',
      '2\uc120 vs 4\uc120',
      'A/B \uadf9\uc131\u00b7\ub77c\ubca8',
      '\ub370\uc774\uc9c0\uccb4\uc778 vs \uc2a4\ud0c0',
      '\uc885\ub2e8\u00b7\ubc14\uc774\uc5b4\uc2a4\u00b7\ucc28\ud3d0\u00b7\uc811\uc9c0',
      '\uac70\ub9ac\u00b7\uc18d\ub3c4 \uc808\ucda9',
      '\uc9c4\ub2e8 \uccb4\ud06c\ub9ac\uc2a4\ud2b8',
      '\uc548\uc804',
      '\uc704\ud5d8 \uc0c1\ud669',
      '\ud604\uc7a5\uac80\uc99d \ud544\uc694',
      '\uc81c\uc870\uc0ac \ub9e4\ub274\uc5bc',
    ],
  ),

  'comm-modbus-rtu': SmartFarmContent(
    id: 'comm-modbus-rtu',
    title: 'Modbus RTU \uc2e4\ubb34',
    summary:
        'RS-485 \uc704 \uc694\uccad-\uc751\ub2f5 \ud504\ub85c\ud1a0\ucf5c. \uc2ac\ub808\uc774\ube0c ID, '
        '\uae30\ub2a5\ucf54\ub4dc, \uc8fc\uc18c 0/1\uae30\uc900, CRC, \ud0c0\uc784\uc544\uc6c3, '
        '\ubc14\uc774\ud2b8/\uc6cc\ub4dc \uc21c\uc11c\uac00 \ud575\uc2ec\uc774\uba70 \ub808\uc9c0\uc2a4\ud130 \ub9f5\uc740 '
        '\uc81c\uc870\uc0ac \ub9e4\ub274\uc5bc\uc774 \uc720\uc77c \uc18c\uc2a4\ub2e4.',
    category: '\ud1b5\uc2e0',
    difficulty: Difficulty.practical,
    contentType: ContentType.technology,
    farmTypes: const [
      FarmType.general,
      FarmType.greenhouse,
      FarmType.hydroponics,
    ],
    qualityGrade: 'A',
    verificationStatus: VerificationStatus.manufacturerManualRequired,
    checkedAt: '2026-07-23',
    sections: [
      ContentSection(
        title: '\uc5ed\ud560',
        body:
            'PLC\u00b7\uc13c\uc11c \ubcc0\ud658\uae30\u00b7\uc778\ubc84\ud130 \ub4f1\uc758 \ud640\ub529/\uc785\ub825 '
            '\ub808\uc9c0\uc2a4\ud130\ub97c \ub9c8\uc2a4\ud130\uac00 \ud3f4\ub9c1\ud55c\ub2e4. \uc778\ud130\ub137 \uc5c6\uc774\ub3c4 '
            '\ub85c\uceec \ubc84\uc2a4\uc5d0\uc11c \ub3d9\uc791\ud55c\ub2e4.',
        kind: SectionKind.practical,
      ),
      ContentSection(
        title: '\uc2ac\ub808\uc774\ube0c ID\u00b7\uae30\ub2a5\ucf54\ub4dc',
        body:
            '\uac01 \uc7a5\uce58\uc5d0 \uace0\uc720 \uc2ac\ub808\uc774\ube0c ID\ub97c \ubd80\uc5ec \ucda9\ub3cc\uc744 '
            '\ubc29\uc9c0\ud55c\ub2e4. FC01\u201304(\uc77d\uae30), FC05/06/15/16(\uc4f0\uae30) \ub4f1\uc774 \ud754\ud558\ub098 '
            '\uc7a5\uce58\uac00 \uc9c0\uc6d0\ud558\ub294 FC\ub9cc \uc4f0\ub77c.',
        kind: SectionKind.important,
      ),
      ContentSection(
        title: '\uc8fc\uc18c 0\uae30\uc900 vs 1\uae30\uc900 \ud63c\ub780',
        body:
            '\ub9e4\ub274\uc5bc\uc758 \u201c\ub808\uc9c0\uc2a4\ud130 40001\u201d\uacfc \ud504\ub808\uc784\uc758 '
            '\uc2dc\uc791 \uc8fc\uc18c(0\uae30\uc900)\uac00 \uc5b4\uae43\ub0a0 \uc218 \uc788\ub2e4. '
            '\uad50\uc7ac\uc5d0\uc11c \ud2b9\uc815 \uc81c\uc870\uc0ac \ub808\uc9c0\uc2a4\ud130 \ubc88\ud638\ub97c '
            '\uc81c\uc2dc\ud558\uc9c0 \uc54a\ub294\ub2e4. \ud604\uc7a5 \ub9e4\ud551\ud45c\uc5d0 \ub9e4\ub274\uc5bc '
            '\ud45c\uae30\uc640 \uc2e4\uc81c \uc694\uccad \uc8fc\uc18c\ub97c \ud568\uaed8 \uae30\ub85d\ud55c\ub2e4.',
        kind: SectionKind.caution,
      ),
      ContentSection(
        title: '\uad50\uc721\uc6a9 \ud504\ub808\uc784 \uac1c\ub150',
        body:
            '\uc694\uccad \ud504\ub808\uc784\uc740 [\uc2ac\ub808\uc774\ube0c][FC][\uc8fc\uc18c Hi/Lo][\uc218\ub7c9 Hi/Lo][CRC Lo/Hi] '
            '\ud615\ud0dc\uac00 \uc77c\ubc18\uc801\uc774\ub2e4. CRC\ub294 \ubc18\ub4dc\uc2dc \uac80\uc99d\ud574\uc57c \ud558\uba70, '
            '\uc544\ub798\ub294 \uad50\uc721\uc6a9 \uc758\uc0ac\ucf54\ub2e4.',
        kind: SectionKind.expertNote,
        copyText:
            '# Educational pseudocode (CRC MUST be verified)\n'
            '# Request: slaveId, functionCode, startAddr, quantity\n'
            'pdu = [slaveId, fc, addrHi, addrLo, qtyHi, qtyLo]\n'
            'crc = crc16_modbus(pdu)  # verify against Modbus spec / library\n'
            'frame = pdu + [crcLo, crcHi]\n'
            '# Response: check slaveId, fc, byteCount, CRC before scaling\n'
            '# Do NOT invent manufacturer register maps here',
        codeLanguage: 'text',
      ),
      ContentSection(
        title: '\ud0c0\uc784\uc544\uc6c3\u00b7\uc7ac\uc2dc\ub3c4',
        body:
            '\uc751\ub2f5 \uc5c6\uc74c\u00b7CRC \uc624\ub958\u00b7\uc608\uc678 \uc751\ub2f5\uc744 \uad6c\ubd84\ud55c\ub2e4. '
            '\ubb34\uc870\uac74 \uc7ac\uc2dc\ub3c4\ub294 \ubc84\uc2a4\ub97c \ub354 \ub9c9\ud790 \uc218 \uc788\ub2e4. '
            '\ud3f4\ub9c1 \uc8fc\uae30\u00b7\ud0c0\uc784\uc544\uc6c3\u00b7\uc7ac\uc2dc \ud69f\uc218\ub97c \ud604\uc7a5 '
            '\ud45c\ub85c \uace0\uc815\ud55c\ub2e4.',
        kind: SectionKind.practical,
      ),
      ContentSection(
        title: '\ubc14\uc774\ud2b8\u00b7\uc6cc\ub4dc \uc21c\uc11c',
        body:
            '16\ube44\ud2b8 \ub808\uc9c0\uc2a4\ud130 2\uac1c\ub85c 32\ube44\ud2b8 float/\uc815\uc218\ub97c '
            '\ub9cc\ub4e4 \ub54c \uc6cc\ub4dc \uc2a4\uc651\u00b7\ubc14\uc774\ud2b8 \uc21c\uc11c\uac00 '
            '\uc7a5\ube44\ub9c8\ub2e4 \ub2e4\ub974\ub2e4. \uc2a4\ucf00\uc77c\u00b7\ubd80\ud638\uac00 '
            '\uc774\uc0c1\ud558\uba74 \uba3c\uc800 \uc5d4\ub514\uc548\uc744 \uc758\uc2ec\ud55c\ub2e4.',
        kind: SectionKind.caution,
      ),
      ContentSection(
        title: '\uc9c4\ub2e8 \uc21c\uc11c',
        body:
            '\ud1b5\uc2e0 \uc2e4\ud328 \uc2dc \ubb3c\ub9ac\uce35(RS-485)\u2192ID/FC/\uc8fc\uc18c\u2192CRC\u2192\uc2a4\ucf00\uc77c \uc21c.',
        kind: SectionKind.flow,
        bullets: const [
          '1\ub300\ub9cc \ud3f4\ub9c1\ud574 \uc751\ub2f5 \uc720\ubb34 \ud655\uc778',
          'CRC \uc624\ub958 vs \ud0c0\uc784\uc544\uc6c3 vs \uc608\uc678\ucf54\ub4dc \ubd84\ub958',
          '\uc2ac\ub808\uc774\ube0c ID \ucda9\ub3cc\u00b7\ubcf4\ub808\uc774\ud2b8 \uc7ac\ud655\uc778',
        ],
      ),
      ContentSection(
        title: '\uc548\uc804',
        body:
            '\uc4f0\uae30(FC) \uc804\uc5d0 \ub300\uc0c1 \ub808\uc9c0\uc2a4\ud130\u00b7\ub2e8\uc704\u00b7\uc601\ud5a5 '
            '\uc7a5\uce58\ub97c \ud655\uc778\ud55c\ub2e4. \uc798\ubabb\ub41c \uc4f0\uae30\ub294 \ud38c\ud504\u00b7'
            '\ub2e4\ud37c\u00b7\ubc30\uae30\ub97c \uc624\ub3d9\uc791\uc2dc\ud0ac \uc218 \uc788\ub2e4.',
        kind: SectionKind.safety,
      ),
      ContentSection(
        title: '\uc704\ud5d8',
        body:
            '\uc81c\uc870\uc0ac \ub9e4\ub274\uc5bc \uc5c6\uc774 \ucd94\uc815\ud55c \uc8fc\uc18c\ub85c '
            '\uc4f0\uae30\ud558\uc9c0 \ub9d0\ub77c. \uad50\uc7ac \uc608\uc2dc \uc8fc\uc18c\ub294 \ud604\uc7a5 '
            '\uc7a5\ube44\uc5d0 \ubcf5\uc0ac\ud560 \uac12\uc774 \uc544\ub2c8\ub2e4.',
        kind: SectionKind.danger,
      ),
      ContentSection(
        title: '\uc81c\uc870\uc0ac \ub9e4\ub274\uc5bc',
        body:
            '\ub808\uc9c0\uc2a4\ud130 \ub9f5, \uc2a4\ucf00\uc77c, \ub370\uc774\ud130\ud615, \uc9c0\uc6d0 FC, '
            '\uc608\uc678 \ucf54\ub4dc\ub294 \ubaa8\ub378\ubcc4 \ub9e4\ub274\uc5bc\uc774 \uc720\uc77c \uae30\uc900\uc774\ub2e4.',
        kind: SectionKind.manufacturer,
      ),
      ContentSection(
        title: '\ud604\uc7a5\uac80\uc99d',
        body:
            '\uc2e4\uc81c \uc7a5\uce58\uc640 \uc5f0\uacb0\ud574 \uc77d\uae30/\uc4f0\uae30\u00b7CRC\u00b7\uc2a4\ucf00\uc77c\uc744 '
            '\uac80\uc99d\ud55c \ub4a4\uc5d0\ub9cc \uc81c\uc5b4\u00b7\ubaa8\ub2c8\ud130\ub9c1\uc5d0 \uc5f0\ub3d9\ud55c\ub2e4.',
        kind: SectionKind.fieldValidation,
      ),
    ],
    keywords: const [
      'Modbus',
      'RTU',
      'CRC',
      '\uc2ac\ub808\uc774\ube0c',
      'FC03',
      '\uc5d4\ub514\uc548',
      '\ud0c0\uc784\uc544\uc6c3',
    ],
    relatedIds: const [
      'comm-rs',
      'comm-modbus-tcp',
      'comm-diagnostics',
      'sw-collection',
    ],
    sourceIds: const ['src-modbus', 'src-sensor-edu'],
    tocTitles: const [
      '\uc5ed\ud560',
      '\uc2ac\ub808\uc774\ube0c ID\u00b7\uae30\ub2a5\ucf54\ub4dc',
      '\uc8fc\uc18c 0\uae30\uc900 vs 1\uae30\uc900 \ud63c\ub780',
      '\uad50\uc721\uc6a9 \ud504\ub808\uc784 \uac1c\ub150',
      '\ud0c0\uc784\uc544\uc6c3\u00b7\uc7ac\uc2dc\ub3c4',
      '\ubc14\uc774\ud2b8\u00b7\uc6cc\ub4dc \uc21c\uc11c',
      '\uc9c4\ub2e8 \uc21c\uc11c',
      '\uc548\uc804',
      '\uc704\ud5d8',
      '\uc81c\uc870\uc0ac \ub9e4\ub274\uc5bc',
      '\ud604\uc7a5\uac80\uc99d',
    ],
  ),

  'comm-farm-network': SmartFarmContent(
    id: 'comm-farm-network',
    title: '\ub18d\uc7a5 \ub124\ud2b8\uc6cc\ud06c \uc124\uacc4',
    summary:
        '\ub85c\uceec \uc81c\uc5b4\ub9dd\uacfc \uc6d0\uaca9/\ud074\ub77c\uc6b0\ub4dc\ub97c \ubd84\ub9ac\ud55c\ub2e4. '
        '\uc778\ud130\ub137 \uc911\ub2e8 \uc2dc\uc5d0\ub3c4 \ud604\uc7a5 \uc81c\uc5b4\u00b7\uacbd\ubcf4\u00b7\uc218\uc9d1\uc740 '
        '\uacc4\uc18d\ub418\uc5b4\uc57c \ud558\uba70, PLC\ub97c \uc778\ud130\ub137\uc5d0 \uc9c1\uc811 \uacf5\uac1c\ud558\uc9c0 '
        '\uc54a\ub294\ub2e4.',
    category: '\ud1b5\uc2e0',
    difficulty: Difficulty.practical,
    contentType: ContentType.procedure,
    farmTypes: const [
      FarmType.general,
      FarmType.greenhouse,
      FarmType.livestock,
    ],
    qualityGrade: 'A',
    verificationStatus: VerificationStatus.educationalExample,
    checkedAt: '2026-07-23',
    sections: [
      ContentSection(
        title: '\uc124\uacc4 \uc6d0\uce59',
        body:
            '\uc81c\uc5b4 \ub124\ud2b8\uc6cc\ud06c(\ud604\uc7a5 LAN)\uc640 \uc5c5\ubb34/\uc778\ud130\ub137 '
            '\uad6c\uac04\uc744 \ub098\ub204\ub294 \uac83\uc774 \uae30\ubcf8\uc774\ub2e4. '
            '\uba38\uc2e0\u00b7\ubaa8\ub2c8\ud130\ub9c1\uc740 \ud544\ud130\u00b7VPN\u00b7\uac8c\uc774\ud2b8\uc6e8\uc774\ub97c '
            '\uac70\uce58\uac8c \uc5f0\uacb0\ud55c\ub2e4.',
        kind: SectionKind.important,
      ),
      ContentSection(
        title: '\ub85c\uceec \uc81c\uc5b4 \uc6b0\uc120',
        body:
            '\uc778\ud130\ub137\uc774 \ub048\uc5b4\ub3c4 PLC\u00b7\ub85c\uceec HMI\u00b7\uc13c\uc11c \uc218\uc9d1\uc740 '
            '\ub3d9\uc791\ud574\uc57c \ud55c\ub2e4. \ud074\ub77c\uc6b0\ub4dc\ub97c \uc81c\uc5b4 \ub8e8\ud504\uc758 '
            '\ud544\uc218 \uc870\uac74\uc73c\ub85c \ub450\uc9c0 \ub9d0\ub77c.',
        kind: SectionKind.practical,
      ),
      ContentSection(
        title: 'PLC \uacf5\uac1c \uae08\uc9c0',
        body:
            'PLC/\uc81c\uc5b4\uae30\ub97c \uacf5\uacf5 \uc778\ud130\ub137\uc5d0 \uc9c1\uc811 \ub178\ucd9c\ud558\uc9c0 '
            '\ub9d0\ub77c. \uc6d0\uaca9 \uc811\uc18d\uc774 \ud544\uc694\ud558\uba74 VPN\u00b7\uc811\uc18d \uc81c\uc5b4\u00b7'
            '\uac10\uc0ac \ub85c\uadf8\ub97c \ub3c4\uba74\u00b7\ubcf4\uc548 \uae30\uc900\uc5d0 \ub530\ub978\ub2e4.',
        kind: SectionKind.danger,
      ),
      ContentSection(
        title: '\uad6c\ubd84 \uc608',
        body:
            '\ud604\uc7a5 \uc81c\uc5b4 VLAN/\ubb3c\ub9ac \ub124\ud2b8, \uc0ac\ubb34\uc6a9 PC \ub124\ud2b8, '
            '\uac8c\uc2a4\ud2b8/IoT \ub124\ud2b8\ub97c \ubd84\ub9ac\ud558\uace0 \ud544\ud130 \uaddc\uce59\uc73c\ub85c '
            '\ud544\uc694 \ud2b8\ub798\ud53d\ub9cc \ud5c8\uc6a9\ud55c\ub2e4.',
        kind: SectionKind.flow,
        bullets: const [
          '\uc81c\uc5b4\ub9dd: PLC, I/O, \ub85c\uceec HMI',
          '\uc218\uc9d1\ub9dd: \uac8c\uc774\ud2b8\uc6e8\uc774, \ub85c\uceec DB/\ub85c\uac70',
          '\uc5c5\ubb34\ub9dd: \uc0ac\ubb34\uc6a9 PC, \uba38\uc2e0 \ub2e8\ub9d0(\uc81c\ud55c\uc801)',
        ],
      ),
      ContentSection(
        title: '\uc720\uc120\u00b7\ubb34\uc120 \ud63c\uc6a9',
        body:
            '\ube44\uc2e4\uc2dc\uac04\u00b7\uc548\uc804 \uacbd\ub85c\ub294 \uc720\uc120\uc744 \uc6b0\uc120\ud558\uace0, '
            '\ubb34\uc120\uc740 \ubcf4\uc870\u00b7\ud655\uc7a5\uc6a9\uc73c\ub85c \uc4f0\ub41c\ub2e4. '
            '\ubb34\uc120\uc774 \ud56d\uc0c1 \ub354 \uc88b\ub2e4\uace0 \ub2e8\uc815\ud558\uc9c0 \ub9d0\ub77c.',
        kind: SectionKind.caution,
      ),
      ContentSection(
        title: '\uccb4\ud06c\ub9ac\uc2a4\ud2b8',
        body:
            '\uc124\uacc4\u00b7\ubcc0\uacbd \uc2dc \ud655\uc778\ud560 \ud56d\ubaa9.',
        kind: SectionKind.practical,
        copyText:
            '[\ub18d\uc7a5 \ub124\ud2b8\uc6cc\ud06c \uccb4\ud06c]\n'
            '- \uc778\ud130\ub137 \uc911\ub2e8 \uc2dc\ubbac\ub808\uc774\uc158: \ub85c\uceec \uc81c\uc5b4/\uacbd\ubcf4 OK?\n'
            '- PLC/\uc81c\uc5b4\uae30 \uacf5\uacf5 IP \uc9c1\uc811 \uacf5\uac1c \uc5c6\ub294\uc9c0\n'
            '- \uc81c\uc5b4\ub9dd\u00b7\uc5c5\ubb34\ub9dd \ubd84\ub9ac\u00b7\ud544\ud130 \uaddc\uce59\n'
            '- \uc6d0\uaca9 \uc811\uc18d: VPN/\uacc4\uc815\u00b7\uad8c\ud55c/\uac10\uc0ac\n'
            '- \uc2a4\uc704\uce58\u00b7DNS\u00b7\uc2dc\uac04\ub3d9\uae30 \ubb38\uc11c\ud654',
        codeLanguage: 'text',
      ),
      ContentSection(
        title: '\uc548\uc804',
        body:
            '\ub124\ud2b8\uc6cc\ud06c \uc7a5\ube44 \ubcc0\uacbd\uc740 \uc81c\uc5b4 \uc911\ub2e8\u00b7\uc624\ub3d9\uc791 '
            '\uc704\ud5d8\uc774 \uc788\ub2e4. \uc720\uc9c0\ubcf4\uc218 \ucc3d\uad6c\uc5d0\uc11c \uc791\uc5c5\ud558\uace0 '
            '\ubcf5\uad6c \uacc4\ud68d\uc744 \ub450\ub77c.',
        kind: SectionKind.safety,
      ),
      ContentSection(
        title: '\ud604\uc7a5\uac80\uc99d',
        body:
            '\ub9dd \ubd84\ub9ac\u00b7\ubc29\ud654\ubcbd \uaddc\uce59\u00b7\uc6d0\uaca9 \uc811\uc18d \uc815\ucc45\uc740 '
            '\uc2dc\uc124 \uaddc\ubaa8\u00b7\ubcf4\uc548 \uc694\uad6c\uc5d0 \ub530\ub77c \ud604\uc7a5 \uac80\uc99d\uc774 '
            '\ud544\uc694\ud558\ub2e4.',
        kind: SectionKind.fieldValidation,
      ),
      ContentSection(
        title: '\uc81c\uc870\uc0ac\u00b7\uacf5\uae09\uc790',
        body:
            '\ub77c\uc6b0\ud130\u00b7\ubc29\ud654\ubcbd\u00b7VPN \uc7a5\ube44\uc758 \uc124\uc815\u00b7\ub85c\uadf8 '
            '\ubcf4\uc874 \uae30\uac04\uc740 \uc81c\ud488\u00b7\uc6b4\uc601 \uc815\ucc45\uc744 \ub530\ub978\ub2e4.',
        kind: SectionKind.manufacturer,
      ),
    ],
    keywords: const [
      '\ub124\ud2b8\uc6cc\ud06c',
      '\ub9dd\ubd84\ub9ac',
      '\ub85c\uceec\uc81c\uc5b4',
      'VPN',
      '\ubc29\ud654\ubcbd',
    ],
    relatedIds: const [
      'comm-offline',
      'comm-gateway',
      'safety-remote',
      'comm-modbus-tcp',
    ],
    sourceIds: const ['src-kesco', 'src-farm-safety'],
    tocTitles: const [
      '\uc124\uacc4 \uc6d0\uce59',
      '\ub85c\uceec \uc81c\uc5b4 \uc6b0\uc120',
      'PLC \uacf5\uac1c \uae08\uc9c0',
      '\uad6c\ubd84 \uc608',
      '\uc720\uc120\u00b7\ubb34\uc120 \ud63c\uc6a9',
      '\uccb4\ud06c\ub9ac\uc2a4\ud2b8',
      '\uc548\uc804',
      '\ud604\uc7a5\uac80\uc99d',
      '\uc81c\uc870\uc0ac\u00b7\uacf5\uae09\uc790',
    ],
  ),

  'comm-offline': SmartFarmContent(
    id: 'comm-offline',
    title: '\uc624\ud504\ub77c\uc778\u00b7\ub85c\uceec \uc81c\uc5b4',
    summary:
        '\ud1b5\uc2e0\u00b7\ud074\ub77c\uc6b0\ub4dc \uc911\ub2e8\uc740 \uc804\uc81c\ub41c\ub2e4. '
        '\ub85c\uceec \uc81c\uc5b4\u00b7\uacbd\ubcf4\u00b7\ub85c\uac70 \ubc84\ud37c\u00b7\ub3d9\uae30 '
        '\uc804\ub7b5\uc744 \uba38\uc800 \uc124\uacc4\ud55c\ub2e4.',
    category: '\ud1b5\uc2e0',
    difficulty: Difficulty.practical,
    contentType: ContentType.procedure,
    farmTypes: const [
      FarmType.general,
      FarmType.greenhouse,
      FarmType.livestock,
    ],
    qualityGrade: 'A',
    verificationStatus: VerificationStatus.educationalExample,
    applicationValidationStatus:
        ApplicationValidationStatus.fieldValidationRequired,
    checkedAt: '2026-07-23',
    sections: [
      ContentSection(
        title: '\uc6d0\uce59',
        body:
            '\uc778\ud130\ub137\uc740 \ud3b8\uc758\uae30\ub2a5\uc774\uc9c0 \uc81c\uc5b4\uc758 \ud544\uc218 \uc870\uac74\uc774 '
            '\uc544\ub2c8\ub2e4. \uc624\ud504\ub77c\uc778 \uc2dc\ub098\ub9ac\uc624\ub97c \uc815\uae30\uc801\uc73c\ub85c '
            '\uc5f0\uc2b5\ud574\uc57c \ud55c\ub2e4.',
        kind: SectionKind.important,
      ),
      ContentSection(
        title: '\ub85c\uceec\uc5d0 \ub0a8\uc544\uc57c \ud560 \uc77c',
        body:
            '\uc548\uc804 \uc778\ud130\ub85d, E-Stop, \uc218\ub3d9/\uc790\ub3d9 \uc804\ud658, '
            '\ud544\uc218 \uacbd\ubcf4(\uace0\uc628\u00b7\ud658\uae30\uc815\uc9c0\u00b7\ub204\uc561 \ub4f1), '
            '\uc13c\uc11c \uc218\uc9d1\u00b7\ub85c\uac70\ub294 \ud604\uc7a5\uc5d0\uc11c \ub3d9\uc791\ud574\uc57c \ud55c\ub2e4.',
        kind: SectionKind.practical,
        bullets: const [
          'PLC/\ub85c\uceec \ucee8\ud2b8\ub864\ub7ec \ub3d9\uc791',
          '\ub85c\uceec HMI\u00b7\uc218\ub3d9 \uc870\uc791',
          '\ub85c\uceec \uc800\uc7a5(\uc644\ucda9 \uc2dc \uc0c1\uc2e0 \ub300\uae30)',
        ],
      ),
      ContentSection(
        title: '\ub3d9\uae30 \uc804\ub7b5',
        body:
            '\uc5f0\uacb0 \ubcf5\uad6c \ud6c4 \uc2dc\uac04\uc2a4\ud0ec\ud504\u00b7\uc124\uc815\u00b7\uba85\ub839 '
            '\ucda9\ub3cc\uc744 \uc5b4\ub5bb\uac8c \ud574\uc18c\ud560\uc9c0 \uc815\uc758\ud55c\ub2e4. '
            '\ud074\ub77c\uc6b0\ub4dc \uba85\ub839\uc774 \ub85c\uceec \uc548\uc804 \uc0c1\ud0dc\ub97c '
            '\ub36e\uc5b4\uc4f0\uc9c0 \ubabb\ud558\uac8c \ud55c\ub2e4.',
        kind: SectionKind.caution,
      ),
      ContentSection(
        title: '\ud488\uc9c8 \ud50c\ub798\uadf8',
        body:
            '\uc624\ud504\ub77c\uc778 \uad6c\uac04 \ub370\uc774\ud130\ub294 stale/missing/'
            'communicationError \ub4f1\uc73c\ub85c \ud45c\uc2dc\ud558\uace0, '
            '\ubcf5\uad6c \ud6c4 \ucd94\uc815\uac12\uacfc \ud63c\ub3d9\ud558\uc9c0 \ub9d0\ub77c.',
        kind: SectionKind.practical,
      ),
      ContentSection(
        title: '\uc2dc\ub098\ub9ac\uc624 \ud750\ub984',
        body: '\uc624\ud504\ub77c\uc778 \ub300\uc751 \ud750\ub984 \uc608.',
        kind: SectionKind.flow,
        copyText:
            '[\uc624\ud504\ub77c\uc778 \ub300\uc751]\n'
            '1. \ud604\uc7a5 \uc548\uc804 \ud655\uc778(E-Stop/\uc218\ub3d9)\n'
            '2. \ub85c\uceec \uc81c\uc5b4\u00b7\uacbd\ubcf4 \ub3d9\uc791 \ud655\uc778\n'
            '3. \ud1b5\uc2e0 \uad6c\uac04 \ub85c\uac70 \ubc84\ud37c\u00b7\ud488\uc9c8\ud50c\ub798\uadf8\n'
            '4. \ubcf5\uad6c \ud6c4: \uc2dc\uac04\ub3d9\uae30 \u2192 \uc124\uc815 \ube44\uad50 \u2192 \uc870\uc2ec\uc2a4\ub7ec\uc6b4 \uc0c1\uc2e0\n'
            '5. \uc0ac\uace0/\uc870\uce58 \uae30\ub85d',
        codeLanguage: 'text',
      ),
      ContentSection(
        title: '\uc548\uc804',
        body:
            '\uc6d0\uaca9\uc73c\ub85c \uc548\uc804\uc815\uc9c0\ub97c \ud574\uc81c\ud558\uac70\ub098, '
            '\ud1b5\uc2e0 \ubd88\uc548 \uc911 \uc790\ub3d9\uc744 \uac15\uc81c \uc720\uc9c0\ud558\uc9c0 \ub9d0\ub77c.',
        kind: SectionKind.safety,
      ),
      ContentSection(
        title: '\uc704\ud5d8',
        body:
            '\ucd95\uc0ac\u00b7\ubc00\ud3d0 \uc628\uc2e4\uc5d0\uc11c \ud658\uae30\u00b7\ub0a8\ubc29 \uc911\ub2e8\uc740 '
            '\uce58\uba85\uc801\uc77c \uc218 \uc788\ub2e4. \ube44\uc0c1 \uc804\uc6d0\u00b7\ub85c\uceec \uae34\uae09 '
            '\ud658\uae30 \uacbd\ub85c\ub97c \ubcc4\ub3c4\ub85c \ud655\ubcf4\ud55c\ub2e4.',
        kind: SectionKind.danger,
      ),
      ContentSection(
        title: '\ud604\uc7a5\uac80\uc99d',
        body:
            '\uc624\ud504\ub77c\uc778 \uc720\uc9c0 \uc2dc\uac04, \ub85c\uac70 \uc6a9\ub7c9, \uacbd\ubcf4 '
            '\uc804\ub2ec \ubc29\uc2dd(\uc2dc\ub9ac\uc5bc/\uc2a4\ub9c8\ud2b8\ud3f0 \ub4f1)\uc740 '
            '\uc2dc\uc124\ubcc4\ub85c \uac80\uc99d\ud55c\ub2e4.',
        kind: SectionKind.fieldValidation,
      ),
      ContentSection(
        title: '\uc81c\uc870\uc0ac',
        body:
            '\uac8c\uc774\ud2b8\uc6e8\uc774\u00b7PLC \uc624\ud504\ub77c\uc778 \ubc84\ud37c\u00b7'
            '\ub3d9\uae30 \ub3d9\uc791\uc740 \uc81c\ud488 \uc124\uba85\uc744 \ud655\uc778\ud55c\ub2e4.',
        kind: SectionKind.manufacturer,
      ),
    ],
    keywords: const [
      '\uc624\ud504\ub77c\uc778',
      '\ub85c\uceec\uc81c\uc5b4',
      '\ub85c\uac70',
      '\ub3d9\uae30',
      '\ube44\uc0c1\uc804\uc6d0',
    ],
    relatedIds: const [
      'comm-farm-network',
      'comm-gateway',
      'sw-alarm',
      'sw-storage',
    ],
    sourceIds: const ['src-farm-safety', 'src-control-safety'],
    tocTitles: const [
      '\uc6d0\uce59',
      '\ub85c\uceec\uc5d0 \ub0a8\uc544\uc57c \ud560 \uc77c',
      '\ub3d9\uae30 \uc804\ub7b5',
      '\ud488\uc9c8 \ud50c\ub798\uadf8',
      '\uc2dc\ub098\ub9ac\uc624 \ud750\ub984',
      '\uc548\uc804',
      '\uc704\ud5d8',
      '\ud604\uc7a5\uac80\uc99d',
      '\uc81c\uc870\uc0ac',
    ],
  ),

  'comm-diagnostics': SmartFarmContent(
    id: 'comm-diagnostics',
    title: '\ud1b5\uc2e0 \uc9c4\ub2e8 \uc2e4\ubb34',
    summary:
        '\uc99d\uc0c1\uc744 \uc13c\uc11c/\uc81c\uc5b4/\ud1b5\uc2e0/\uc804\uc6d0\uc73c\ub85c \ubd84\ud560\ud55c\ub2e4. '
        '\ud55c \ubc88\uc5d0 \uc5ec\ub7ec \uc124\uc815\uc744 \ubc14\uafb8\uc9c0 \ub9d0\uace0, '
        '\ubcc0\uacbd\u00b7\uacb0\uacfc\ub97c \uae30\ub85d\ud55c\ub2e4.',
    category: '\ud1b5\uc2e0',
    difficulty: Difficulty.practical,
    contentType: ContentType.troubleshooting,
    farmTypes: const [FarmType.general],
    qualityGrade: 'A',
    verificationStatus: VerificationStatus.educationalExample,
    checkedAt: '2026-07-23',
    sections: [
      ContentSection(
        title: '\ubd84\ud560 \uc6d0\uce59',
        body:
            '\uac12\uc774 \uc774\uc0c1\uc774\uba74 (1) \ud604\uc7a5 \uc2e4\uce21 (2) \uc13c\uc11c/\ubc30\uc120 '
            '(3) \uc2a4\ucf00\uc77c/\ub2e8\uc704 (4) \ud1b5\uc2e0 (5) \uc81c\uc5b4 \ub85c\uc9c1 \uc21c\uc73c\ub85c '
            '\uc88b\uc544\uc9c0\ub978\ub2e4.',
        kind: SectionKind.practical,
      ),
      ContentSection(
        title: '\uc99d\uc0c1 \ud328\ud134',
        body:
            '\uc804\ud600 \uc5c6\uc74c, \uac04\ud5d8 \ud0c0\uc784\uc544\uc6c3, CRC \uc624\ub958, '
            '\uac12 \uace0\uc815(\ud50c\ub7ab\ub77c\uc778), \uac12 \ud3ed\uc8fc, \ub2e8\uc704 \uc774\uc0c1\uc744 '
            '\uad6c\ubd84\ud55c\ub2e4.',
        kind: SectionKind.important,
      ),
      ContentSection(
        title: '\uc9c4\ub2e8 \ud750\ub984',
        body: '\uc77c\ubc18 \uc9c4\ub2e8 \ud750\ub984.',
        kind: SectionKind.flow,
        copyText:
            '[\ud1b5\uc2e0 \uc9c4\ub2e8]\n'
            '1. \ub2e4\uc77c \uc911 \ubcc0\uacbd(\ubc30\uc120/\uc124\uc815/\uc804\uc6d0)\n'
            '2. LED/\uc804\uc6d0/\uc5d0\ub7ec\ucf54\ub4dc\n'
            '3. 1\ub3001 \uc5f0\uacb0\ub85c \ubc84\uc2a4 \ubd84\ub9ac\n'
            '4. \ubcf4\ub808\uc774\ud2b8\u00b7ID\u00b7A/B\u00b7\uc885\ub2e8\n'
            '5. \uc2dc\ub9ac\uc5bc \ubaa8\ub2c8\ud130/\uc624\uc2a4\ucf54\ud504\n'
            '6. CRC\u00b7\ud0c0\uc784\uc544\uc6c3\u00b7\uc608\uc678 \ubd84\ub958\n'
            '7. \uc2a4\ucf00\uc77c\u00b7\ud488\uc9c8\ud50c\ub798\uadf8\n'
            '8. \uacb0\uacfc\u00b7\ubcf5\uad6c \ub0b4\uc6a9 \uae30\ub85d',
        codeLanguage: 'text',
      ),
      ContentSection(
        title:
            '\ud55c \ubc88\uc5d0 \ub9ce\uc774 \ubc14\uafb8\uc9c0 \ub9d0\uae30',
        body:
            'ID\u00b7\ubcf4\ub808\uc774\ud2b8\u00b7\uadf9\uc131\u00b7\uc885\ub2e8\uc744 \ub3d9\uc2dc\uc5d0 '
            '\ubc14\uafb8\uba74 \uc6d0\uc778 \ucd94\uc801\uc774 \uc5b4\ub824\uc6cc\uc9c4\ub2e4. '
            '\ud55c \ud56d\ubaa9\uc529 \ubcc0\uacbd\u00b7\ud655\uc778\ud55c\ub2e4.',
        kind: SectionKind.caution,
      ),
      ContentSection(
        title: '\ub3c4\uad6c',
        body:
            '\ub9e4\ub274\uc5bc, \ubc30\uc120\ub3c4, \ub9e4\ud551\ud45c, \uc2dc\ub9ac\uc5bc \ubaa8\ub2c8\ud130, '
            '\uba40\ud2f0\ubbf8\ud130/\uc624\uc2a4\ucf54\ud504(\ud544\uc694 \uc2dc), \ubcf5\uad6c '
            '\uc804 \ubc31\uc5c5\uc774 \ub3c4\uc6c0\uc774 \ub41c\ub2e4.',
        kind: SectionKind.practical,
      ),
      ContentSection(
        title: '\uc548\uc804',
        body:
            '\ud65c\uc120 \uc791\uc5c5 \uc804 \uc804\uc6d0\u00b7\uc7a0\uae08\u00b7\uc811\uc9c0\ub97c '
            '\ud655\uc778\ud55c\ub2e4. \uc81c\uc5b4 \uc911 \ubb34\ub2e8 \ubc30\uc120 \ubd84\ub9ac\ub294 '
            '\uc704\ud5d8\ud558\ub2e4.',
        kind: SectionKind.safety,
      ),
      ContentSection(
        title: '\uc704\ud5d8',
        body:
            '\uc9c4\ub2e8 \uc911 \uc4f0\uae30 \uba85\ub839\uc744 \ub0a8\ubc1c\ud558\uac70\ub098 '
            '\uc778\ud130\ub85d\uc744 \uc6b0\ud68c\ud558\uc9c0 \ub9d0\ub77c.',
        kind: SectionKind.danger,
      ),
      ContentSection(
        title: '\ud604\uc7a5\uac80\uc99d',
        body:
            '\ud5c8\uc6a9 \uc624\ub958\uc728\u00b7\uc751\ub2f5\uc2dc\uac04\u00b7\uc7ac\uc2dc \uc815\ucc45\uc740 '
            '\uc2dc\uc124\ubcc4\ub85c \uac80\uc99d\ud55c\ub2e4.',
        kind: SectionKind.fieldValidation,
      ),
      ContentSection(
        title: '\uc81c\uc870\uc0ac',
        body:
            '\uc5d0\ub7ec\ucf54\ub4dc\u00b7LED \uc758\ubbf8\u00b7\uc9c4\ub2e8 \uba54\ub274\uc5bc\uc740 '
            '\uc7a5\ube44 \ub9e4\ub274\uc5bc\uc744 \ub530\ub978\ub2e4.',
        kind: SectionKind.manufacturer,
      ),
    ],
    keywords: const [
      '\uc9c4\ub2e8',
      '\ud0c0\uc784\uc544\uc6c3',
      'CRC',
      '\ubd84\ud560',
      '\ub9e4\ud551\ud45c',
    ],
    relatedIds: const [
      'comm-rs',
      'comm-modbus-rtu',
      'comm-gateway',
      'sw-monitoring',
    ],
    sourceIds: const ['src-modbus', 'src-sensor-edu'],
    tocTitles: const [
      '\ubd84\ud560 \uc6d0\uce59',
      '\uc99d\uc0c1 \ud328\ud134',
      '\uc9c4\ub2e8 \ud750\ub984',
      '\ud55c \ubc88\uc5d0 \ub9ce\uc774 \ubc14\uafb8\uc9c0 \ub9d0\uae30',
      '\ub3c4\uad6c',
      '\uc548\uc804',
      '\uc704\ud5d8',
      '\ud604\uc7a5\uac80\uc99d',
      '\uc81c\uc870\uc0ac',
    ],
  ),

  'comm-gateway': SmartFarmContent(
    id: 'comm-gateway',
    title:
        '\uac8c\uc774\ud2b8\uc6e8\uc774\u00b7\ud504\ub85c\ud1a0\ucf5c \ubcc0\ud658',
    summary:
        '\ud604\uc7a5 \ubc84\uc2a4(Modbus RTU \ub4f1)\uc640 \uc0c1\uc704(MQTT/TCP/\ud074\ub77c\uc6b0\ub4dc)\ub97c '
        '\uc774\uc5b4 \uc900\ub2e4. \ubcc0\ud658\u00b7\ubc84\ud37c\u00b7\ub3d9\uae30 \uc2e4\ud328\uac00 '
        '\uc81c\uc5b4\ub97c \uba39\uc9c0 \uc54a\uac8c \uc124\uacc4\ud55c\ub2e4.',
    category: '\ud1b5\uc2e0',
    difficulty: Difficulty.expert,
    contentType: ContentType.technology,
    farmTypes: const [FarmType.general, FarmType.greenhouse],
    qualityGrade: 'B',
    verificationStatus: VerificationStatus.manufacturerManualRequired,
    checkedAt: '2026-07-23',
    sections: [
      ContentSection(
        title: '\uc5ed\ud560',
        body:
            '\ud504\ub85c\ud1a0\ucf5c \ubcc0\ud658, \ud3f4\ub9c1\u2192\uc774\ubca4\ud2b8, \ub85c\uac70 \ubc84\ud37c, '
            '\uc2dc\uac04\uc2a4\ud0ec\ud504\u00b7\ud488\uc9c8\ud50c\ub798\uadf8 \ubd80\uc5ec\ub97c \ub9e4\uac1c\ud55c\ub2e4. '
            '\uac8c\uc774\ud2b8\uc6e8\uc774 \uc7a5\uc560\uac00 \ud604\uc7a5 \uc81c\uc5b4 \uc911\ub2e8\uc744 '
            '\uc758\ubbf8\ud558\uba74 \uc548 \ub41c\ub2e4.',
        kind: SectionKind.practical,
      ),
      ContentSection(
        title: '\ubc30\uce58',
        body:
            '\uc804\uc6d0 \uc548\uc815, \uc628\u00b7\uc2b5\ub3c4, \uc720\uc120/\ubb34\uc120 \uc5f0\uacb0, '
            '\uc6d0\uaca9 \uc811\uc18d \uacbd\ub85c\ub97c \ub3c4\uba74\ud654\ud55c\ub2e4. '
            '\ud604\uc7a5 \ubc84\uc2a4\uc640 \ud074\ub77c\uc6b0\ub4dc \uce21\uc744 \ubd84\ub9ac\ud55c\ub2e4.',
        kind: SectionKind.important,
      ),
      ContentSection(
        title: '\ub370\uc774\ud130 \ud750\ub984',
        body: '\uc77c\ubc18 \ub370\uc774\ud130 \ud750\ub984.',
        kind: SectionKind.flow,
        bullets: const [
          '\uc7a5\uce58 \u2192 RS-485/Modbus \u2192 \uac8c\uc774\ud2b8\uc6e8\uc774',
          '\uac8c\uc774\ud2b8\uc6e8\uc774 \u2192 \ub85c\uceec \uc800\uc7a5/\uacbd\ubcf4',
          '(\uc120\ud0dd) MQTT/TCP \u2192 \uc0c1\uc704 \uc11c\ube44\uc2a4',
        ],
      ),
      ContentSection(
        title: '\ubc84\ud37c\u00b7\ub3d9\uae30',
        body:
            '\uc0c1\uc704 \uc911\ub2e8 \uc2dc \ub85c\uceec \ubc84\ud37c \ud6c4 \uc7ac\uc804\uc1a1\ud55c\ub2e4. '
            '\uc911\ubcf5\u00b7\uc21c\uc11c \uc5ed\uc804\u00b7\uc2dc\uac04\ucd1d\ub3cc\uc744 \ucc98\ub9ac\ud560 '
            '\uaddc\uce59\uc774 \ud544\uc694\ud558\ub2e4.',
        kind: SectionKind.caution,
      ),
      ContentSection(
        title: '\uc124\uc815 \uccb4\ud06c',
        body: '\uac8c\uc774\ud2b8\uc6e8\uc774 \ub3c4\uc785 \uccb4\ud06c.',
        kind: SectionKind.practical,
        copyText:
            '[\uac8c\uc774\ud2b8\uc6e8\uc774 \uccb4\ud06c]\n'
            '- \ud558\uc704: \ubcf4\ub808\uc774\ud2b8, \uc2ac\ub808\uc774\ube0c \ub9e4\ud551, \ud3f4\ub9c1\uc8fc\uae30\n'
            '- \uc0c1\uc704: \ube0c\ub85c\ucee4/URL, \uc778\uc99d, \ud1a0\ud53d, TLS \uc720\ubb34\n'
            '- \ubc84\ud37c \uacbd\ub85c\u00b7\uc6a9\ub7c9\u00b7\uc0c1\uc2e0 \uc815\ucc45\n'
            '- \uc2dc\uac04\ub3d9\uae30(\uac8c\uc774\ud2b8\uc6e8\uc774/\uc7a5\uce58/\uc11c\ubc84)\n'
            '- \uc7a5\uc560 \uc2dc \ub85c\uceec \uc81c\uc5b4 \uc720\uc9c0 \ud655\uc778',
        codeLanguage: 'text',
      ),
      ContentSection(
        title: '\uc548\uc804',
        body:
            '\uae30\ubcf8 \ube44\ubc00\ubc88\ud638\u00b7\uc5f4\ub9b0 \uc6d0\uaca9 \ud3ec\ud2b8\ub97c '
            '\uadf8\ub300\ub85c \ub450\uc9c0 \ub9d0\ub77c. \uc5c5\ub370\uc774\ud2b8\u00b7\uc124\uc815 '
            '\ubcc0\uacbd\uc740 \uad8c\ud55c\u00b7\uac10\uc0ac\ub97c \ub454\ub2e4.',
        kind: SectionKind.safety,
      ),
      ContentSection(
        title: '\uc704\ud5d8',
        body:
            '\uac8c\uc774\ud2b8\uc6e8\uc774\ub97c \ud1b5\ud55c \uc4f0\uae30\uac00 \uc548\uc804 PLC '
            '\ucd9c\ub825\uc744 \uc9c1\uc811 \uc870\uc791\ud558\uac8c \ub450\uc9c0 \ub9d0\ub77c. '
            '\uc548\uc804 \uacbd\ub85c\ub294 \ub85c\uceec \uc778\ud130\ub85d\uc774 \uc6b0\uc120\ub2e4.',
        kind: SectionKind.danger,
      ),
      ContentSection(
        title: '\uc81c\uc870\uc0ac \ub9e4\ub274\uc5bc',
        body:
            '\ud504\ub85c\ud1a0\ucf5c \ub9e4\ud551, \ubc84\ud37c \ud55c\ub3c4, \uc778\uc99d \ubc29\uc2dd\uc740 '
            '\uc81c\ud488 \ub9e4\ub274\uc5bc\uc774 \uc720\uc77c \uae30\uc900\uc774\ub2e4.',
        kind: SectionKind.manufacturer,
      ),
      ContentSection(
        title: '\ud604\uc7a5\uac80\uc99d',
        body:
            '\ubc84\ud37c \uc6a9\ub7c9\u00b7\uc7ac\uc804\uc1a1 \uc2dc\uac04\u00b7\uc7a5\uc560 \uc2dc '
            '\ub85c\uceec \ub3d9\uc791\uc744 \ud604\uc7a5\uc5d0\uc11c \uac80\uc99d\ud55c\ub2e4.',
        kind: SectionKind.fieldValidation,
      ),
    ],
    keywords: const [
      '\uac8c\uc774\ud2b8\uc6e8\uc774',
      'MQTT',
      '\ubc84\ud37c',
      '\ud504\ub85c\ud1a0\ucf5c\ubcc0\ud658',
      '\ud3f4\ub9c1',
    ],
    relatedIds: const [
      'comm-modbus-rtu',
      'comm-offline',
      'comm-farm-network',
      'sw-collection',
    ],
    sourceIds: const ['src-mqtt', 'src-modbus', 'src-flutter'],
    tocTitles: const [
      '\uc5ed\ud560',
      '\ubc30\uce58',
      '\ub370\uc774\ud130 \ud750\ub984',
      '\ubc84\ud37c\u00b7\ub3d9\uae30',
      '\uc124\uc815 \uccb4\ud06c',
      '\uc548\uc804',
      '\uc704\ud5d8',
      '\uc81c\uc870\uc0ac \ub9e4\ub274\uc5bc',
      '\ud604\uc7a5\uac80\uc99d',
    ],
  ),

  'ai-data-quality': SmartFarmContent(
    id: 'ai-data-quality',
    title: '\ub370\uc774\ud130 \ud488\uc9c8',
    summary:
        '\ub098\uc050 \ub370\uc774\ud130\ub85c \ud559\uc2b5\u00b7\ucd94\ub860\ud558\uba74 \uc798\ubabb\ub41c '
        '\ud655\uc2e0\uc744 \ub9cc\ub4e0\ub2e4. \ud488\uc9c8 \uc0c1\ud0dc(good/stale/missing \ub4f1)\uc640 '
        '\uc6d0\ubcf8\uac12\u00b7\ubcf4\uc815\uac12 \ubd84\ub9ac\uac00 \ubaa8\ub378\ubcf4\ub2e4 \uba3c\uc800\ub2e4.',
    category: 'AI\u00b7\ubd84\uc11d',
    difficulty: Difficulty.practical,
    contentType: ContentType.procedure,
    farmTypes: const [FarmType.general],
    qualityGrade: 'A',
    verificationStatus: VerificationStatus.educationalExample,
    checkedAt: '2026-07-23',
    sections: [
      ContentSection(
        title: '\uc6d0\uce59',
        body:
            '\ud488\uc9c8\uc774 \ub098\uc050 \uc785\ub825\uc740 \uaddc\uce59\u00b7\ud1b5\uacc4\u00b7ML '
            '\ubaa8\ub450\ub97c \ub9dd\uce5c\ub2e4. \uad50\uc815\u00b7\uc124\uce58\u00b7\uc2dc\uacc4\u00b7\ub2e8\uc704\ub97c '
            '\uba3c\uc800 \ub9de\ucd98\ub2e4.',
        kind: SectionKind.important,
      ),
      ContentSection(
        title: '\ud488\uc9c8 \uc0c1\ud0dc',
        body:
            '\uac01 \uc0d8\ud50c\uc5d0 \ud488\uc9c8 \uc0c1\ud0dc\ub97c \ubd80\uc5ec \ubaa8\ub2c8\ud130\ub9c1\u00b7'
            '\uc54c\ub78c\u00b7AI\uac00 \uac19\uc740 \uc758\ubbf8\ub85c \uc774\ud574\ud558\uac8c \ud55c\ub2e4. '
            '\uc6d0\ubcf8(raw)\uac12\uacfc \ubcf4\uc815/\ucd94\uc815\uac12\uc740 \ubd84\ub9ac \ubcf4\uad00\ud55c\ub2e4.',
        kind: SectionKind.practical,
        copyText:
            'Quality states (keep raw separate from corrected):\n'
            '- good\n'
            '- stale\n'
            '- missing\n'
            '- outOfRange\n'
            '- spike\n'
            '- flatline\n'
            '- communicationError\n'
            '- calibrationRequired\n'
            '- manualValue\n'
            '- estimated',
        codeLanguage: 'text',
      ),
      ContentSection(
        title: '\uac80\uc0ac \ud56d\ubaa9',
        body: '\uc218\uc9d1 \uc804\u00b7\ud6c4 \uc815\uae30 \uc810\uac80.',
        bullets: const [
          '\uad50\uc815\u00b7\uc124\uce58 \uc704\uce58',
          '\ub2e8\uc704\u00b7\uc2a4\ucf00\uc77c \uc77c\uce58',
          '\uc2dc\uacc4 \ub3d9\uae30',
          '\uacb0\uce21\ub960\u00b7\uc9c0\uc5f0',
          '\uc911\ubcf5\u00b7\uc5ed\uc804 \uc2dc\uac01',
        ],
        kind: SectionKind.practical,
      ),
      ContentSection(
        title: '\ucc98\ub9ac \uc6d0\uce59',
        body:
            '\uc774\uc0c1\uce58\ub97c \uc790\ub3d9\uc73c\ub85c \uaf2d \uace0\uce58\uae30\ubcf4\ub2e4\ub294 '
            '\ud50c\ub798\uadf8\u00b7\uacbd\ubcf4\u00b7\uc218\ub3d9 \ud655\uc778\uc774 \uc6b0\uc120\uc774\ub2e4. '
            '\ubcf4\uc815\ud55c \uac12\uc73c\ub85c \uc6d0\ubcf8\uc744 \ub36e\uc5b4\uc4f0\uc9c0 \ub9d0\ub77c.',
        kind: SectionKind.caution,
      ),
      ContentSection(
        title: '\ud750\ub984',
        body: '\ud488\uc9c8 \uac80\uc0ac \ud750\ub984.',
        kind: SectionKind.flow,
        bullets: const [
          '\uc218\uc9d1 \u2192 \ud488\uc9c8 \ud3c9\uac00 \u2192 \uc800\uc7a5',
          '\ub098\uc056 \u2192 \uacbd\ubcf4/\ubcf4\ub958(\uc81c\uc5b4 \ubbf8\uc5f0\ub3d9 \uae30\ubcf8)',
          '\uc6d0\ubcf8 \ubcf4\uad00 + \uc120\ud0dd\uc801 \ubcf4\uc815\ubcf8',
        ],
      ),
      ContentSection(
        title: '\uc548\uc804',
        body:
            'calibrationRequired\u00b7communicationError \uc0c1\ud0dc\ub97c \uc815\uc0c1\uac12\ucc98\ub7fc '
            '\uc81c\uc5b4\ud558\uc9c0 \ub9d0\ub77c.',
        kind: SectionKind.safety,
      ),
      ContentSection(
        title: '\uc704\ud5d8',
        body:
            '\ud50c\ub7ab\ub77c\uc778\u00b7\uc2a4\ud30c\uc774\ud06c\ub97c \ubb34\uc2dc\ud558\uace0 '
            '\uc790\ub3d9 \uc81c\uc5b4\ud558\uba74 \ud658\uae30\u00b7\uad00\uc218\u00b7\ub0a8\ubc29\uc774 '
            '\uc624\ub3d9\uc791\ud560 \uc218 \uc788\ub2e4.',
        kind: SectionKind.danger,
      ),
      ContentSection(
        title: '\ud604\uc7a5\uac80\uc99d',
        body:
            '\ud5c8\uc6a9 \uacb0\uce21\ub960\u00b7\uc9c0\uc5f0\u00b7\uc774\uc0c1\uce58 \uae30\uc900\uc740 '
            '\uc2dc\uc124\u00b7\uc13c\uc11c\ubcc4\ub85c \uac80\uc99d\ud55c\ub2e4.',
        kind: SectionKind.fieldValidation,
      ),
      ContentSection(
        title: '\uc804\ubb38 \uba54\ubaa8',
        body:
            'AI \ud559\uc2b5 \uc804\uc5d0 \ud488\uc9c8 \ud544\ud130\ub97c \uace0\uc815\ud558\uace0, '
            '\ud544\ud130 \uc804\u00b7\ud6c4 \ub370\uc774\ud130\uc14b\uc744 \ubaa8\ub450 \ubcf4\uad00\ud55c\ub2e4.',
        kind: SectionKind.expertNote,
      ),
    ],
    keywords: const [
      '\ub370\uc774\ud130\ud488\uc9c8',
      'stale',
      'missing',
      'flatline',
      'spike',
      '\uc6d0\ubcf8\uac12',
    ],
    relatedIds: const [
      'sw-collection',
      'sw-storage',
      'sw-alarm',
      'ai-anomaly',
      'sensor-calibration',
    ],
    sourceIds: const ['src-ai-caution', 'src-sensor-edu'],
    tocTitles: const [
      '\uc6d0\uce59',
      '\ud488\uc9c8 \uc0c1\ud0dc',
      '\uac80\uc0ac \ud56d\ubaa9',
      '\ucc98\ub9ac \uc6d0\uce59',
      '\ud750\ub984',
      '\uc548\uc804',
      '\uc704\ud5d8',
      '\ud604\uc7a5\uac80\uc99d',
      '\uc804\ubb38 \uba54\ubaa8',
    ],
  ),

  'sw-collection': SmartFarmContent(
    id: 'sw-collection',
    title: '\ub370\uc774\ud130 \uc218\uc9d1',
    summary:
        'PLC\u00b7\uc13c\uc11c\uc5d0\uc11c \uac12\uc744 \uc77d\uace0 \ud0c0\uc784\uc2a4\ud0ec\ud504\u00b7'
        '\ud488\uc9c8 \ud50c\ub798\uadf8\uc640 \ud568\uaed8 \ub118\uae34\ub2e4. \ud3f4\ub9c1 \uc8fc\uae30\uc640 '
        '\uc2e4\ud328 \ucc98\ub9ac\ub97c \uba85\uc2dc\ud55c\ub2e4.',
    category: '\uc18c\ud504\ud2b8\uc6e8\uc5b4',
    difficulty: Difficulty.practical,
    contentType: ContentType.technology,
    farmTypes: const [FarmType.general],
    qualityGrade: 'A',
    verificationStatus: VerificationStatus.educationalExample,
    checkedAt: '2026-07-23',
    sections: [
      ContentSection(
        title: '\uc5ed\ud560',
        body:
            '\uc8fc\uae30\uc801 \ud3f4\ub9c1 \ub610\ub294 \uc774\ubca4\ud2b8 \uc218\uc2e0\uc73c\ub85c '
            'raw \ub370\uc774\ud130\ub97c \ud655\ubcf4\ud55c\ub2e4. \uc218\uc9d1 \uc2e4\ud328\ub97c '
            '\uc228\uae30\uc9c0 \ub9d0\uace0 \ud488\uc9c8\u00b7\uacbd\ubcf4\ub85c \uc5f0\ub3d9\ud55c\ub2e4.',
        kind: SectionKind.practical,
      ),
      ContentSection(
        title: '\uad6c\ud604 \ud3ec\uc778\ud2b8',
        body: '\uc218\uc9d1 \uad6c\ud604 \uc2dc \ud544\uc218 \ud56d\ubaa9.',
        bullets: const [
          '\uc7a5\uce58 ID\u00b7\ud0dc\uadf8\u00b7\ub2e8\uc704',
          '\uc218\uc9d1 \uc2dc\uac01(\uc7a5\uce58/\uac8c\uc774\ud2b8\uc6e8\uc774/\uc11c\ubc84)',
          '\ud488\uc9c8 \ud50c\ub798\uadf8',
          '\ud0c0\uc784\uc544\uc6c3\u00b7\uc7ac\uc2dc \uc815\ucc45',
        ],
        kind: SectionKind.important,
      ),
      ContentSection(
        title: '\ud3f4\ub9c1 vs \uc774\ubca4\ud2b8',
        body:
            '\ud3f4\ub9c1\uc740 \uad6c\ud604\uc774 \ub2e8\uc21c\ud558\uc9c0\ub9cc \ubd80\ud558\uac00 \ud06c\ub2e4. '
            '\uc774\ubca4\ud2b8\ub294 \uc9c0\uc5f0\uc740 \uc801\uc9c0\ub9cc \ub193\uce5c \ud504\ub808\uc784\u00b7'
            '\uc911\ubcf5 \ucc98\ub9ac\uac00 \ud544\uc694\ud558\ub2e4. \ud63c\ud569\uc774 \ud754\ud558\ub2e4.',
        kind: SectionKind.expertNote,
      ),
      ContentSection(
        title: '\uc2e4\ud328 \ucc98\ub9ac',
        body:
            '\ud0c0\uc784\uc544\uc6c3\u00b7CRC \uc624\ub958\u00b7\uc5f0\uacb0 \uac70\ubd80\ub97c '
            'communicationError/\uacbd\ubcf4\ub85c \ub0a8\uae30\uace0, \ub9c8\uc9c0\ub9c9 \uc815\uc0c1\uac12\uc744 '
            '\ubb34\ud55c\uc815 \uc7ac\uc0ac\uc6a9\ud558\uc9c0 \ub9d0\ub77c.',
        kind: SectionKind.caution,
      ),
      ContentSection(
        title: '\uccb4\ud06c\ub9ac\uc2a4\ud2b8',
        body: '\uc218\uc9d1 \uc810\uac80 \ubaa9\ub85d.',
        kind: SectionKind.practical,
        copyText:
            '[\uc218\uc9d1 \uccb4\ud06c]\n'
            '- \ud0dc\uadf8\u00b7\ub2e8\uc704\u00b7\uc2a4\ucf00\uc77c \ubb38\uc11c\n'
            '- \ud3f4\ub9c1 \uc8fc\uae30\u00b7\ud0c0\uc784\uc544\uc6c3\u00b7\uc7ac\uc2dc\n'
            '- \uc2e4\ud328 \uc2dc \ud488\uc9c8\ud50c\ub798\uadf8/\uacbd\ubcf4\n'
            '- \uc2dc\uacc4 \ub3d9\uae30 \uc18c\uc2a4\n'
            '- \uc624\ud504\ub77c\uc778 \ubc84\ud37c \uc5f0\ub3d9',
        codeLanguage: 'text',
      ),
      ContentSection(
        title: '\ud750\ub984',
        body:
            '\uc7a5\uce58 \u2192 \uc218\uc9d1 \u2192 \ud488\uc9c8 \u2192 \uc800\uc7a5/\ubaa8\ub2c8\ud130\ub9c1.',
        kind: SectionKind.flow,
      ),
      ContentSection(
        title: '\uc548\uc804',
        body:
            '\uc218\uc9d1 \ud504\ub85c\uc138\uc2a4\uac00 \uc81c\uc5b4 \ub8e8\ud504\ub97c \ub9c9\uc9c0 '
            '\uc54a\uac8c, \uc4f0\uae30\ub294 \ubcc4\ub3c4 \uad8c\ud55c\u00b7\uc778\ud130\ub85d\uc744 \ub454\ub2e4.',
        kind: SectionKind.safety,
      ),
      ContentSection(
        title: '\uc704\ud5d8',
        body:
            '\uc218\uc9d1 \uc624\ub958\ub97c \ubb34\uc2dc\ud55c \uc81c\uc5b4\ub294 \uc704\ud5d8\ud558\ub2e4. '
            '\uc2e4\ud328 \uc2dc \uc218\ub3d9/\uc548\uc804 \uc815\ucc45\uc73c\ub85c \uc804\ud658\ud55c\ub2e4.',
        kind: SectionKind.danger,
      ),
      ContentSection(
        title: '\ud604\uc7a5\uac80\uc99d',
        body:
            '\ud3f4\ub9c1 \ubd80\ud558\u00b7\uc2e4\ud328\uc728\uc740 \uc7a5\uce58 \uc218\u00b7\ub124\ud2b8\uc6cc\ud06c\uc5d0 '
            '\ub530\ub77c \uac80\uc99d\ud55c\ub2e4.',
        kind: SectionKind.fieldValidation,
      ),
      ContentSection(
        title: '\uc81c\uc870\uc0ac',
        body:
            '\uc7a5\uce58 \ud1b5\uc2e0 \ub9e4\ud551\u00b7\ub808\uc9c0\uc2a4\ud130\ub294 \ub9e4\ub274\uc5bc\uc744 '
            '\ub530\ub978\ub2e4. \uad50\uc7ac\uc5d0 \uac00\uc9dc \uc8fc\uc18c\ub97c \ub123\uc9c0 \ub9d0\ub77c.',
        kind: SectionKind.manufacturer,
      ),
    ],
    keywords: const [
      '\uc218\uc9d1',
      '\ud3f4\ub9c1',
      '\ud0c0\uc784\uc2a4\ud0ec\ud504',
      '\ud488\uc9c8',
      '\ud0c0\uc784\uc544\uc6c3',
    ],
    relatedIds: const [
      'sw-storage',
      'ai-data-quality',
      'comm-modbus-rtu',
      'comm-gateway',
    ],
    sourceIds: const ['src-modbus', 'src-flutter'],
    tocTitles: const [
      '\uc5ed\ud560',
      '\uad6c\ud604 \ud3ec\uc778\ud2b8',
      '\ud3f4\ub9c1 vs \uc774\ubca4\ud2b8',
      '\uc2e4\ud328 \ucc98\ub9ac',
      '\uccb4\ud06c\ub9ac\uc2a4\ud2b8',
      '\ud750\ub984',
      '\uc548\uc804',
      '\uc704\ud5d8',
      '\ud604\uc7a5\uac80\uc99d',
      '\uc81c\uc870\uc0ac',
    ],
  ),

  'sw-storage': SmartFarmContent(
    id: 'sw-storage',
    title: '\ub370\uc774\ud130 \uc800\uc7a5',
    summary:
        'CSV\u00b7SQLite\u00b7DB\u00b7\ud074\ub77c\uc6b0\ub4dc\ub97c \ubaa9\uc801\ubcc4\ub85c \uc4f0\uace0, '
        '\ubcf4\uc874 \uae30\uac04\u00b7\ubc31\uc5c5\u00b7\uc6d0\ubcf8/\ubcf4\uc815 \ubd84\ub9ac\ub97c \uc815\uc758\ud55c\ub2e4.',
    category: '\uc18c\ud504\ud2b8\uc6e8\uc5b4',
    difficulty: Difficulty.practical,
    contentType: ContentType.technology,
    farmTypes: const [FarmType.general],
    qualityGrade: 'A',
    verificationStatus: VerificationStatus.educationalExample,
    checkedAt: '2026-07-23',
    sections: [
      ContentSection(
        title: '\uc120\ud0dd \uae30\uc900',
        body:
            '\uc2e4\uc2dc\uac04\uc131\u00b7\uc6a9\ub7c9\u00b7\uc624\ud504\ub77c\uc778 \uac00\ub2a5\uc131\u00b7'
            '\ubc31\uc5c5\u00b7\uac80\uc0c9 \ud544\uc694\uc5d0 \ub530\ub77c \uc800\uc7a5\uc18c\ub97c \uace0\ub978\ub2e4.',
        kind: SectionKind.practical,
        bullets: const [
          '\ub85c\uceec: \ube60\ub978 \uae30\ub85d\u00b7\uc624\ud504\ub77c\uc778',
          '\uc11c\ubc84/DB: \uac80\uc0c9\u00b7\uacf5\uc720\u00b7\ubcf4\uace0',
          '\ud074\ub77c\uc6b0\ub4dc: \ubc31\uc5c5\u00b7\uc6d0\uaca9(\ub124\ud2b8\uc6cc\ud06c \uc758\uc874)',
        ],
      ),
      ContentSection(
        title: '\uc2a4\ud0a4\ub9c8',
        body:
            '\ud0dc\uadf8, \uc2dc\uac01, \uac12, \ub2e8\uc704, \ud488\uc9c8, \uc218\uc9d1\uc18c\ub97c '
            '\ud3ec\ud568\ud55c\ub2e4. \ubcf4\uc815\uac12\uc774 \uc788\uc73c\uba74 \uc6d0\ubcf8\uacfc '
            '\ubcc4\ub3c4 \uceec\ub7fc/\ud544\ub4dc\ub85c \ub454\ub2e4.',
        kind: SectionKind.important,
      ),
      ContentSection(
        title: '\ubcf4\uc874\u00b7\ubc31\uc5c5',
        body:
            '\ubcf4\uc874 \uae30\uac04, \ubc31\uc5c5 \uc8fc\uae30, \ubcf5\uad6c \ud14c\uc2a4\ud2b8\ub97c '
            '\uc815\uc758\ud55c\ub2e4. \ubc31\uc5c5\ub9cc \ud558\uace0 \ubcf5\uad6c\ub97c \uc548 \ud574\ubcf4\uba74 '
            '\uc758\ubbf8\uac00 \uc5c6\ub2e4.',
        kind: SectionKind.caution,
      ),
      ContentSection(
        title: '\uccb4\ud06c',
        body: '\uc800\uc7a5\u00b7\ubc31\uc5c5 \uccb4\ud06c.',
        kind: SectionKind.practical,
        copyText:
            '[\uc800\uc7a5 \uccb4\ud06c]\n'
            '- raw vs corrected \ubd84\ub9ac\n'
            '- \ubcf4\uc874 \uae30\uac04\u00b7\uc0ad\uc81c \uc815\ucc45\n'
            '- \ubc31\uc5c5 \uc704\uce58\u00b7\uc8fc\uae30\u00b7\ubcf5\uad6c \uc5f0\uc2b5\n'
            '- \uc2dc\uacc4/\ud0c0\uc784\uc874/\ud0c0\uc784\uc874\n'
            '- \uac1c\uc778\uc815\ubcf4\u00b7\uc811\uadfc \uad8c\ud55c',
        codeLanguage: 'text',
      ),
      ContentSection(
        title: '\ud750\ub984',
        body:
            '\uc218\uc9d1 \u2192 \ub85c\uceec \uc800\uc7a5 \u2192 (\uc120\ud0dd) \uc0c1\uc704 \ub3d9\uae30.',
        kind: SectionKind.flow,
      ),
      ContentSection(
        title: '\uc548\uc804',
        body:
            '\uc6d0\uaca9 \uc800\uc7a5\uc18c \uc811\uadfc \uad8c\ud55c\u00b7\uc554\ud638\ud654\ub97c '
            '\uac80\ud1a0\ud55c\ub2e4. \ubbf8\uc2b9\uc778 \uacf5\uc720\ub97c \ud53c\ud55c\ub2e4.',
        kind: SectionKind.safety,
      ),
      ContentSection(
        title: '\uc704\ud5d8',
        body:
            '\ubc31\uc5c5 \uc5c6\uc774 \ub514\uc2a4\ud06c \uc7a5\uc560 \uc2dc \uc774\ub825\u00b7'
            '\uc54c\ub78c \uae30\ub85d\uc774 \uc0ac\ub77c\uc9c8 \uc218 \uc788\ub2e4.',
        kind: SectionKind.danger,
      ),
      ContentSection(
        title: '\ud604\uc7a5\uac80\uc99d',
        body:
            '\ubcf4\uc874\uae30\uac04\u00b7\uc6a9\ub7c9\u00b7\ub3d9\uae30 \uc9c0\uc5f0\uc740 '
            '\uc2dc\uc124 \uaddc\ubaa8\uc5d0 \ub9de\uac8c \uac80\uc99d\ud55c\ub2e4.',
        kind: SectionKind.fieldValidation,
      ),
      ContentSection(
        title: '\uc81c\uc870\uc0ac',
        body:
            'DB/\ud074\ub77c\uc6b0\ub4dc \uc81c\ud488\uc758 \ubc31\uc5c5\u00b7\ubcf5\uc81c \uc808\ucc28\ub294 '
            '\uacf5\uc2dd \ubb38\uc11c\ub97c \ub530\ub978\ub2e4.',
        kind: SectionKind.manufacturer,
      ),
    ],
    keywords: const [
      '\uc800\uc7a5',
      'SQLite',
      'CSV',
      '\ubc31\uc5c5',
      '\ubcf4\uc874',
    ],
    relatedIds: const [
      'sw-collection',
      'ai-data-quality',
      'comm-offline',
      'sw-monitoring',
    ],
    sourceIds: const ['src-flutter', 'src-firebase'],
    tocTitles: const [
      '\uc120\ud0dd \uae30\uc900',
      '\uc2a4\ud0a4\ub9c8',
      '\ubcf4\uc874\u00b7\ubc31\uc5c5',
      '\uccb4\ud06c',
      '\ud750\ub984',
      '\uc548\uc804',
      '\uc704\ud5d8',
      '\ud604\uc7a5\uac80\uc99d',
      '\uc81c\uc870\uc0ac',
    ],
  ),
  'sw-monitoring': SmartFarmContent(
    id: 'sw-monitoring',
    title: '\ubaa8\ub2c8\ud130\ub9c1',
    summary:
        '\ud604\uc7ac\uac12\u00b7\ucd94\uc138\u00b7\ud1b5\uc2e0\u00b7\ud488\uc9c8 \uc0c1\ud0dc\ub97c '
        '\uc0ac\ub78c\uc774 \ube60\ub974\uac8c \ud310\ub2e8\ud560 \uc218 \uc788\uac8c \ubcf4\uc5ec \uc90d\ub2e4. '
        '\uc774\uc068\ub9ac\ub2e4\uace0 \uc790\ub3d9 \uc870\uce58\ub97c \ub300\uccb4\ud558\uc9c0 \ub54a\ub294\ub2e4.',
    category: '\uc18c\ud504\ud2b8\uc6e8\uc5b4',
    difficulty: Difficulty.practical,
    contentType: ContentType.technology,
    farmTypes: const [FarmType.general, FarmType.greenhouse],
    qualityGrade: 'A',
    verificationStatus: VerificationStatus.educationalExample,
    checkedAt: '2026-07-23',
    sections: [
      ContentSection(
        title: '\ud544\uc218 \ud45c\uc2dc',
        body:
            '\ud654\uba74\uc5d0 \uae30\ubcf8\uc73c\ub85c \ub113\uc5b4\uc57c \ud560 \ud56d\ubaa9.',
        bullets: const [
          '\ud604\uc7ac\uac12\u00b7\ub2e8\uc704\u00b7\uc218\uc9d1 \uc2dc\uac01',
          '\ud488\uc9c8 \uc0c1\ud0dc(good/stale/missing \ub4f1)',
          '\ud1b5\uc2e0/\uc7a5\uce58 \uc0c1\ud0dc',
          '\ucd5c\uadfc \uacbd\ubcf4\u00b7\uc778\uc99d \uc5ec\ubd80',
        ],
        kind: SectionKind.important,
      ),
      ContentSection(
        title: '\ucd94\uc138\u00b7\ube44\uad50',
        body:
            '\ub2e8\uc77c \uc22b\uc790\ubcf4\ub2e4 \ucd94\uc138\u00b7\ub2e4\uc911 \uad50\ucc28\ud655\uc778\uc774 '
            '\uc624\ud310\uc744 \uc904\uc778\ub2e4. \ud488\uc9c8\uc774 \ub098\uc050 \uad6c\uac04\uc740 '
            '\uadf8\ub798\ud504\uc5d0 \ubcc4\ub3c4 \ud45c\uc2dc\ud55c\ub2e4.',
        kind: SectionKind.practical,
      ),
      ContentSection(
        title: '\uacbd\uace0 UI',
        body:
            '\ube75\uac04 \uc0c9\ub9cc \ub298\ub9ac\uc9c0 \ub9d0\uace0, \uc2dc\uac01\u00b7\ub4f1\uae09\u00b7'
            '\ud655\uc778/\ubbf8\ud655\uc778\u00b7\uad00\ub828 \ud0dc\uadf8\ub97c \ud568\uaed8 \ubcf4\uc778\ub2e4.',
        kind: SectionKind.caution,
      ),
      ContentSection(
        title: '\uccb4\ud06c',
        body: '\ubaa8\ub2c8\ud130\ub9c1 \ud654\uba74 \uc810\uac80.',
        kind: SectionKind.practical,
        copyText:
            '[\ubaa8\ub2c8\ud130\ub9c1 \uccb4\ud06c]\n'
            '- \ud604\uc7ac\uac12+\ub2e8\uc704+\uc2dc\uac01\n'
            '- \ud488\uc9c8 \uc0c1\ud0dc \ud45c\uc2dc\n'
            '- \ud1b5\uc2e0 \uc911\ub2e8/\uc9c0\uc5f0 \ud45c\uc2dc\n'
            '- \uacbd\ubcf4 \ub4f1\uae09\u00b7\uc778\uc99d \uc0c1\ud0dc\n'
            '- \uc218\ub3d9 \ubaa8\ub4dc \uc9c4\uc785 \uacbd\ub85c',
        codeLanguage: 'text',
      ),
      ContentSection(
        title: '\ud750\ub984',
        body:
            '\uc218\uc9d1 \u2192 \ud488\uc9c8 \u2192 \ud654\uba74/\uacbd\ubcf4 \u2192 \uc6b4\uc601\uc790 \ud310\ub2e8.',
        kind: SectionKind.flow,
      ),
      ContentSection(
        title: '\uc548\uc804',
        body:
            '\uc6d0\uaca9 \ubaa8\ub2c8\ud130\ub9c1\ub9cc\uc73c\ub85c \ud604\uc7a5 \ud655\uc778\uc744 '
            '\uc0dd\ub7b5\ud558\uc9c0 \ub9d0\ub77c. \uc704\ud5d8 \uc2dc\uac04\ub300\ub294 \ud604\uc7a5 '
            '\uc218\ub3d9\uc774 \uc6b0\uc120\ub2e4.',
        kind: SectionKind.safety,
      ),
      ContentSection(
        title: '\uc704\ud5d8',
        body:
            '\ud488\uc9c8 \ub098\uc056 \uac12\uc744 \uc815\uc0c1\ucc98\ub7fc \ubcf4\uc5ec \uc8fc\uba74 '
            '\uc798\ubabb\ub41c \uc870\uc791\uc73c\ub85c \uc774\uc5b4\uc9c8 \uc218 \uc788\ub2e4.',
        kind: SectionKind.danger,
      ),
      ContentSection(
        title: '\ud604\uc7a5\uac80\uc99d',
        body:
            '\uc0c8\ub85c\uace0\uce68 \uc8fc\uae30\u00b7\ud45c\uc2dc \ud56d\ubaa9\uc740 \uc6b4\uc601 '
            '\uc2b5\uad00\uc5d0 \ub9de\uac8c \uac80\uc99d\ud55c\ub2e4.',
        kind: SectionKind.fieldValidation,
      ),
      ContentSection(
        title: '\uc804\ubb38 \uba54\ubaa8',
        body:
            '\ub300\uc2dc\ubcf4\ub4dc\ub294 \uacb0\uc815 \uc9c0\uc6d0\uc774\uc9c0 \uc81c\uc5b4\uae30\uac00 '
            '\uc544\ub2c8\ub2e4. \uc4f0\uae30/\ubaa8\ub4dc \uc804\ud658\uc740 \ubcc4\ub3c4 \uad8c\ud55c\uc73c\ub85c '
            '\ubd84\ub9ac\ud55c\ub2e4.',
        kind: SectionKind.expertNote,
      ),
    ],
    keywords: const [
      '\ubaa8\ub2c8\ud130\ub9c1',
      '\uc2e4\uc2dc\uac04',
      '\ud488\uc9c8\ud45c\uc2dc',
      '\ucd94\uc138',
      '\ub300\uc2dc\ubcf4\ub4dc',
    ],
    relatedIds: const [
      'sw-alarm',
      'sw-collection',
      'ai-data-quality',
      'comm-diagnostics',
    ],
    sourceIds: const ['src-flutter', 'src-ai-caution'],
    tocTitles: const [
      '\ud544\uc218 \ud45c\uc2dc',
      '\ucd94\uc138\u00b7\ube44\uad50',
      '\uacbd\uace0 UI',
      '\uccb4\ud06c',
      '\ud750\ub984',
      '\uc548\uc804',
      '\uc704\ud5d8',
      '\ud604\uc7a5\uac80\uc99d',
      '\uc804\ubb38 \uba54\ubaa8',
    ],
  ),

  'sw-alarm': SmartFarmContent(
    id: 'sw-alarm',
    title: '\uc54c\ub78c \uc124\uacc4',
    summary:
        '\uc784\uacc4\u00b7\ud1b5\uc2e0\ub450\uc808\u00b7\ud488\uc9c8\ubd88\ub7c9\u00b7\uc548\uc804 '
        '\uc778\ud130\ub85d\uc744 \uad6c\ubd84\ud558\uace0, \uc54c\ub78c \ud64d\uc218(alarm flood)\ub97c '
        '\ub9c9\ub294\ub2e4. \uc0c1\ud0dc\ub294 raised/acked/inProgress/cleared/closed\ub97c \uc4f0\ub2e4.',
    category: '\uc18c\ud504\ud2b8\uc6e8\uc5b4',
    difficulty: Difficulty.practical,
    contentType: ContentType.procedure,
    farmTypes: const [FarmType.general],
    qualityGrade: 'A',
    verificationStatus: VerificationStatus.educationalExample,
    applicationValidationStatus:
        ApplicationValidationStatus.fieldValidationRequired,
    checkedAt: '2026-07-23',
    sections: [
      ContentSection(
        title: '\ub4f1\uae09',
        body:
            '\uc54c\ub78c\uc744 \uc815\ubcf4/\uc8fc\uc758/\uc704\ud5d8/\uc548\uc804\uc815\uc9c0\ub85c \ub098\ub204\ub2e4.',
        bullets: const [
          '\uc815\ubcf4: \uae30\ub85d\u00b7\uc54c\ub9bc',
          '\uc8fc\uc758: \ud655\uc778 \ud544\uc694',
          '\uc704\ud5d8: \uc989\uc2dc \ub300\uc751',
          '\uc548\uc804\uc815\uc9c0: \uc778\ud130\ub85d\u00b7E-Stop \uc5f0\ub3d9',
        ],
        kind: SectionKind.important,
      ),
      ContentSection(
        title: '\uc0dd\uba85\uc8fc\uae30',
        body:
            'raised \u2192 acked \u2192 inProgress \u2192 cleared \u2192 closed. '
            '\ud655\uc778(ack) \uc5c6\uc774 \uc0ac\ub77c\uc9c0\uac8c \ud558\uc9c0 \ub9d0\ub77c.',
        kind: SectionKind.flow,
        copyText:
            'Alarm lifecycle:\n'
            'raised -> acked -> inProgress -> cleared -> closed\n'
            'Controls: deadband, onDelay, offDelay, suppress (maintenance)',
        codeLanguage: 'text',
      ),
      ContentSection(
        title: 'deadband\u00b7delay\u00b7suppress',
        body:
            '\ub370\ub4dc\ubc34\ub4dc(\ubd80\uadfc\ub300)\ub85c \ucc44\ud130\ub9c1\uc744 \uc904\uc774\uace0, '
            '\uc9c0\uc5f0(on/off delay)\ub85c \uc21c\uac04 \ub178\uc774\uc988\ub97c \uac70\ub978\ub2e4. '
            '\uc720\uc9c0\ubcf4\uc218 \uc911 suppress\ub294 \uae30\ub85d\u00b7\uc2b9\uc778\uc744 \ub0a8\uae34\ub2e4.',
        kind: SectionKind.practical,
      ),
      ContentSection(
        title: '\uc54c\ub78c \ud64d\uc218 \ubc29\uc9c0',
        body:
            '\ud558\ub098\uc758 \uc6d0\uc778\uc73c\ub85c \uc218\uc2ed \uac1c \uacbd\ubcf4\uac00 '
            '\ud3ed\uc8fc\ud558\uba74 \uc911\uc694 \uc54c\ub78c\uc774 \ubb3b\ud78c\ub2e4. '
            '\uad00\ub828 \uacbd\ubcf4 \ubd81\uae08\u00b7\uc6b0\uc120\uc21c\uc704\ub97c \uc124\uacc4\ud55c\ub2e4.',
        kind: SectionKind.caution,
      ),
      ContentSection(
        title: '\uccb4\ud06c',
        body: '\uc54c\ub78c \uc124\uacc4 \uc810\uac80.',
        kind: SectionKind.practical,
        copyText:
            '[\uc54c\ub78c \uccb4\ud06c]\n'
            '- \ub4f1\uae09\u00b7\ub300\uc751 \ucc45\uc784\n'
            '- deadband / onDelay / offDelay\n'
            '- raised/acked/inProgress/cleared/closed\n'
            '- suppress(\uc720\uc9c0) \uc2b9\uc778\u00b7\uae30\ub85d\n'
            '- \ud1b5\uc2e0\ub450\uc808 vs \uac12\uc774\uc0c1 vs \uc548\uc804\uc778\ud130\ub85d \ubd84\ub9ac',
        codeLanguage: 'text',
      ),
      ContentSection(
        title: '\uc548\uc804',
        body:
            '\uc548\uc804\uc815\uc9c0\u00b7E-Stop \uacbd\ubcf4\ub294 \uba38\uc2e0/\uc74c\uc131 \uc77c\ubc18 '
            '\uc54c\ub78c\uacfc \ub3d9\uc77c \ucc44\ub110\uc5d0 \ubb3b\ud788\uc9c0 \ub9d0\ub77c.',
        kind: SectionKind.safety,
      ),
      ContentSection(
        title: '\uc704\ud5d8',
        body:
            '\uc54c\ub78c\uc744 \ubb34\uc2dc\ud558\uac70\ub098 \uc790\ub3d9 \ud655\uc778(ack) '
            '\uc2a4\ud06c\ub9bd\ud2b8\ub294 \uc704\ud5d8\ud558\ub2e4.',
        kind: SectionKind.danger,
      ),
      ContentSection(
        title: '\ud604\uc7a5\uac80\uc99d',
        body:
            '\uc784\uacc4\u00b7\uc9c0\uc5f0\u00b7\ub300\uc751 \uc808\ucc28\ub294 \uc791\ubb3c\u00b7\ucd95\uc885\u00b7'
            '\uc2dc\uc124\ubcc4\ub85c \uac80\uc99d\ud55c\ub2e4. \uad50\uc7ac\uc5d0 \uace0\uc815 \uc22b\uc790\ub97c '
            '\ub123\uc9c0 \ub9d0\ub77c.',
        kind: SectionKind.fieldValidation,
      ),
      ContentSection(
        title: '\uc81c\uc870\uc0ac',
        body:
            'HMI/\uc54c\ub78c \uc11c\ubc84\uc758 \uc0c1\ud0dc\uba85\u00b7\uc804\uc1a1 \ubc29\uc2dd\uc740 '
            '\uc81c\ud488 \ub9e4\ub274\uc5bc\uc744 \ud655\uc778\ud55c\ub2e4.',
        kind: SectionKind.manufacturer,
      ),
    ],
    keywords: const [
      '\uc54c\ub78c',
      'deadband',
      'acked',
      'suppress',
      '\ud64d\uc218',
    ],
    relatedIds: const [
      'sw-monitoring',
      'ai-data-quality',
      'control-interlock',
      'safety-remote',
      'comm-offline',
    ],
    sourceIds: const ['src-control-safety', 'src-kosha'],
    tocTitles: const [
      '\ub4f1\uae09',
      '\uc0dd\uba85\uc8fc\uae30',
      'deadband\u00b7delay\u00b7suppress',
      '\uc54c\ub78c \ud64d\uc218 \ubc29\uc9c0',
      '\uccb4\ud06c',
      '\uc548\uc804',
      '\uc704\ud5d8',
      '\ud604\uc7a5\uac80\uc99d',
      '\uc81c\uc870\uc0ac',
    ],
  ),

  'env-hydroponics': SmartFarmContent(
    id: 'env-hydroponics',
    title: '\uc218\uacbd\uc7ac\ubc30 \uc2e4\ubb34',
    summary:
        '\uc591\uc561 pH\u00b7EC\u00b7\uc218\uc704\u00b7\uc720\ub7c9\u00b7\ud38c\ud504\u00b7\ubc30\uc561\uacfc '
        '\ud654\ud559 \uc548\uc804\uc774 \ud575\uc2ec\uc774\ub2e4. \uc791\ubb3c\ubcc4 \uace0\uc815 '
        '\ubaa9\ud45c\uac12\uc744 \uad50\uc7ac\uac00 \uacf5\uc2dd \uc81c\uc2dc\ud558\uc9c0 \uc54a\ub294\ub2e4.',
    category: '\ud658\uacbd',
    difficulty: Difficulty.practical,
    contentType: ContentType.technology,
    farmTypes: const [FarmType.hydroponics],
    qualityGrade: 'A',
    verificationStatus: VerificationStatus.educationalExample,
    applicationValidationStatus:
        ApplicationValidationStatus.fieldValidationRequired,
    checkedAt: '2026-07-23',
    sections: [
      ContentSection(
        title: '\uad00\ub9ac \ub300\uc0c1',
        body:
            '\ubc30\uc9c0\u00b7\uadfc\uad8c, \uc591\uc561 \ud0f1\ud06c, \uacf5\uae09\u00b7\ubc30\uc561, '
            '\ud38c\ud504\u00b7\ud544\ud130, \uc628\uc2b5\ub3c4\u00b7\uad11\uc744 \uad00\ub9ac\ud55c\ub2e4. '
            '\uc591\uc561\ub9cc \ub9de\uc73c\uba74 \ub05d\uc774 \uc544\ub2c8\ub2e4.',
        kind: SectionKind.practical,
      ),
      ContentSection(
        title: 'pH\u00b7EC \uc13c\uc11c',
        body:
            'pH\u00b7EC\ub294 \uad50\uc815\u00b7\uc628\ub3c4\u00b7\uc624\uc5fc\u00b7\uc804\uadf9 '
            '\uc720\uc9c0\uc5d0 \ubbfc\uac10\ud558\ub2e4. \uad50\uc815\uc77c\u00b7\ud45c\uc900\uc561\u00b7'
            '\uc804\uadf9 \uad50\uccb4\ub97c \uae30\ub85d\ud55c\ub2e4.',
        kind: SectionKind.important,
        bullets: const [
          '\uad50\uc815 \uc804\ud6c4 \uac12\u00b7\uc628\ub3c4 \uae30\ub85d',
          '\ub2e8\uc120\u00b7\uae30\ud3ec \uc2dc \ud488\uc9c8\ud50c\ub798\uadf8',
          '\uc218\ub3d9 \ud3ec\ud2b8\ube14\uacfc \uad50\ucc28\ud655\uc778',
        ],
      ),
      ContentSection(
        title: '\ud654\ud559 \uc548\uc804',
        body:
            'pH \uc870\uc808\uc81c\u00b7\uc591\uc561\uc6d0\uc740 \ud654\ud559\ubb3c\uc9c8\uc774\ub2e4. '
            '\ud638\ud658\u00b7PPE\u00b7\ud76c\uc11d\u00b7\ud45c\uc2dc\u00b7\ud63c\ud569 \uae08\uc9c0\ub97c '
            '\uc900\uc218\ud55c\ub2e4. \uc790\ub3d9 \ud22c\uc785\uc804 \ubc30\uad00\u00b7\uc7a0\uae08\uc744 '
            '\ud655\uc778\ud55c\ub2e4.',
        kind: SectionKind.safety,
      ),
      ContentSection(
        title: '\uc778\ud130\ub85d',
        body:
            '\uc218\uc704 \uc800\ud558\ud55c\u00b7\uacf5\uc6b4\uc804\u00b7\ub204\uc561\u00b7\uacfc\uc9d1\uc911 '
            '\uc2dc \ud38c\ud504\uc815\uc9c0\u00b7\uacbd\ubcf4\u00b7\uc218\ub3d9 \uc804\ud658\uc744 '
            '\uc5f0\ub3d9\ud55c\ub2e4. \uc81c\uc5b4\ub9cc\uc73c\ub85c \ud654\ud559\ubb3c \ud22c\uc785\uc744 '
            '\ubc29\uce58\ud558\uc9c0 \ub9d0\ub77c.',
        kind: SectionKind.caution,
      ),
      ContentSection(
        title: '\ubaa9\ud45c\uac12\uc5d0 \ub300\ud55c \uc785\uc7a5',
        body:
            'pH\u00b7EC \ubaa9\ud45c\ub294 \ud488\uc885\u00b7\uc0dd\uc721\ub2e8\uacc4\u00b7\uc2dc\uc808\u00b7'
            '\uc218\uc6d0\u00b7\uc2dc\uc124\uc5d0 \ub530\ub77c \ub2ec\ub77c, \uacf5\uc2dd/\uc804\ubb38\uac00 '
            '\ud655\uc778 \uc5c6\uc774 \uace0\uc815\uac12\uc744 \uc4f0\uc9c0 \ub9d0\ub77c.',
        kind: SectionKind.fieldValidation,
      ),
      ContentSection(
        title: '\uccb4\ud06c',
        body: '\uc218\uacbd \uc77c\uc77c \uc810\uac80 \uc608.',
        kind: SectionKind.practical,
        copyText:
            '[\uc218\uacbd \uccb4\ud06c]\n'
            '- pH/EC \uad50\uc815\uc77c\u00b7\ud45c\uc900\uc561\n'
            '- \uc218\uc704/\uc720\ub7c9/\ud38c\ud504 \uc0c1\ud0dc\n'
            '- \ub204\uc561\u00b7\ud544\ud130 \ucc28\uc555\n'
            '- \ud654\ud559\ubb3c PPE\u00b7\ud76c\uc11d\u00b7\ud45c\uc2dc\n'
            '- \uacf5\uc6b4\uc804\u00b7\uc800\uc218\uc704 \uc778\ud130\ub85d \ud14c\uc2a4\ud2b8',
        codeLanguage: 'text',
      ),
      ContentSection(
        title: '\uc704\ud5d8',
        body:
            '\ud654\ud559\ubb3c \ub204\ucd9c\u00b7\ud63c\ud569 \uc624\ub958\u00b7\uc7a0\uae08 \uc5c6\ub294 '
            '\uc790\ub3d9 \ud22c\uc785\uc740 \uc911\ub300 \uc0ac\uace0\ub85c \uc774\uc5b4\uc9c8 \uc218 \uc788\ub2e4.',
        kind: SectionKind.danger,
      ),
      ContentSection(
        title: '\uad00\ub828 \uc13c\uc11c',
        body:
            'pH\u00b7EC \uc13c\uc11c \uc124\uce58\u00b7\uad50\uc815\u00b7\uc2a4\ucf00\uc77c\uc740 '
            '\uc13c\uc11c \uc2e4\ubb34 \ud56d\ubaa9\uacfc \ud568\uaed8 \ubcf4\ub77c.',
        kind: SectionKind.practical,
      ),
      ContentSection(
        title: '\uc81c\uc870\uc0ac',
        body:
            '\uc13c\uc11c\u00b7\ub3c4\uc785\uae30\u00b7\ud38c\ud504 \ub9e4\ub274\uc5bc\uc758 '
            '\ubc30\uc120\u00b7\uad50\uc815 \uc808\ucc28\ub97c \ub530\ub978\ub2e4.',
        kind: SectionKind.manufacturer,
      ),
    ],
    keywords: const [
      '\uc218\uacbd',
      'pH',
      'EC',
      '\uc591\uc561',
      '\ud654\ud559\uc548\uc804',
      '\uad50\uc815',
    ],
    relatedIds: const [
      'sensor-ph-ec',
      'sensor-calibration',
      'control-env',
      'safety-chemical',
      'sw-alarm',
    ],
    sourceIds: const ['src-hydroponics', 'src-env-edu', 'src-sensor-edu'],
    tocTitles: const [
      '\uad00\ub9ac \ub300\uc0c1',
      'pH\u00b7EC \uc13c\uc11c',
      '\ud654\ud559 \uc548\uc804',
      '\uc778\ud130\ub85d',
      '\ubaa9\ud45c\uac12\uc5d0 \ub300\ud55c \uc785\uc7a5',
      '\uccb4\ud06c',
      '\uc704\ud5d8',
      '\uad00\ub828 \uc13c\uc11c',
      '\uc81c\uc870\uc0ac',
    ],
  ),

  'env-livestock': SmartFarmContent(
    id: 'env-livestock',
    title: '\ucd95\uc0ac \ud658\uacbd\u00b7\ubcf5\uc9c0 \uc2e4\ubb34',
    summary:
        '\ub3d9\ubb3c\ubcf5\uc9c0\u00b7\ud658\uae30\u00b7\uc628\uc5f4\ud658\uacbd\u00b7\uae09\uc774\u00b7'
        '\uae09\uc218\u00b7\uc9c8\ubcd1 \uc9d5\ud6c4\u00b7\uc0ac\ub78c\u00b7\uac00\ucd95 \uc548\uc804\uc744 '
        '\ud568\uaed8 \ubcf8\ub2e4. \ucd95\uc885\u00b7\uc77c\ub839\uc5d0 \ub530\ub77c \uae30\uc900\uc774 '
        '\ub2ec\ub77c \uace0\uc815 \uc124\uc815\uac12\uc744 \ub123\uc9c0 \ub54a\ub294\ub2e4.',
    category: '\ud658\uacbd',
    difficulty: Difficulty.practical,
    contentType: ContentType.technology,
    farmTypes: const [FarmType.livestock],
    qualityGrade: 'A',
    verificationStatus: VerificationStatus.educationalExample,
    applicationValidationStatus:
        ApplicationValidationStatus.fieldValidationRequired,
    checkedAt: '2026-07-23',
    sections: [
      ContentSection(
        title: '\ub3d9\ubb3c\ubcf5\uc9c0',
        body:
            '\uc2a4\ub9c8\ud2b8 \uc7a5\ube44\ub294 \ubcf5\uc9c0\u00b7\uc548\uc804\uc744 \ub3d5\ub294 '
            '\uc218\ub2e8\uc774\uba70, \ub3d9\ubb3c \uc0c1\ud0dc\ub97c \uc0ac\ub78c\uc774 \uc815\uae30 '
            '\uad00\ucc30\ud558\ub294 \uc77c\uc744 \ub300\uccb4\ud558\uc9c0 \uc54a\ub294\ub2e4.',
        kind: SectionKind.important,
      ),
      ContentSection(
        title: '\uae34\uae09 \ud658\uae30(\ub85c\uceec)',
        body:
            '\ud658\uae30 \uc815\uc9c0\ub294 \uce58\uba85\uc801\uc77c \uc218 \uc788\ub2e4. '
            '\ube44\uc0c1 \uc804\uc6d0\u00b7\ub85c\uceec \uae34\uae09 \ud658\uae30\u00b7\uacbd\ubcf4\ub294 '
            '\ud074\ub77c\uc6b0\ub4dc\uc640 \ubb34\uad00\ud558\uac8c \ub3d9\uc791\ud574\uc57c \ud55c\ub2e4.',
        kind: SectionKind.danger,
      ),
      ContentSection(
        title: '\ucd95\uc885\u00b7\uc77c\ub839 \ubcc0\uc774',
        body:
            '\uc628\ub3c4\u00b7\ud658\uae30\u00b7\ubc00\uc0ac\u00b7\uac00\uc2a4 \uae30\uc900\uc740 '
            '\ucd95\uc885\u00b7\uc131\uc7a5\ub2e8\uacc4\u00b7\ubc00\uc0ac\uc5d0 \ub530\ub77c \ub2ec\ub77c '
            '\ud604\uc7a5\u00b7\uc804\ubb38\uac00 \uae30\uc900\uc744 \ub530\ub978\ub2e4.',
        kind: SectionKind.fieldValidation,
      ),
      ContentSection(
        title: '\uc13c\uc11c\u00b7\uacbd\ubcf4',
        body:
            '\uc628\uc2b5\ub3c4\u00b7\uc720\ud574\uac00\uc2a4\u00b7\uc804\ub825/\ud658\uae30 \uc0c1\ud0dc\ub97c '
            '\uac10\uc2dc\ud558\uace0, \ud1b5\uc2e0 \uc624\ub958 \uc2dc\uc5d0\ub294 \uc218\ub3d9 '
            '\ud655\uc778\uc744 \uc6b0\uc120\ud55c\ub2e4.',
        kind: SectionKind.practical,
      ),
      ContentSection(
        title: '\uccb4\ud06c',
        body: '\ucd95\uc0ac \uc77c\uc77c/\ube44\uc0c1 \uccb4\ud06c \uc608.',
        kind: SectionKind.practical,
        copyText:
            '[\ucd95\uc0ac \uccb4\ud06c]\n'
            '- \ub3d9\ubb3c \uad00\ucc30(\ud638\ud761\u00b7\uc74c\uc218\u00b7\uc2a4\ud2b8\ub808\uc2a4)\n'
            '- \ud658\uae30/\ube44\uc0c1\uc804\uc6d0 \ub85c\uceec \ub3d9\uc791\n'
            '- \uc628\uc2b5\ub3c4\u00b7\uac00\uc2a4 \uc13c\uc11c \ud488\uc9c8\n'
            '- \uae09\uc774\u00b7\uae09\uc218 \uc7a5\uc560 \uc5ec\ubd80\n'
            '- \uacbd\ubcf4 \ud655\uc778(ack)\u00b7\ub300\uc751 \uae30\ub85d',
        codeLanguage: 'text',
      ),
      ContentSection(
        title: '\uc548\uc804',
        body:
            '\uc0ac\ub78c\u00b7\uac00\ucd95 \ucd9c\uc785 \uc2dc \uae30\uacc4 \uac00\ub3d9\ubd80\ub97c '
            '\ud655\uc778\ud55c\ub2e4. \uc6d0\uaca9 \uc870\uc791\ub9cc\uc73c\ub85c \ud604\uc7a5 '
            '\ud655\uc778\uc744 \uc0dd\ub7b5\ud558\uc9c0 \ub9d0\ub77c.',
        kind: SectionKind.safety,
      ),
      ContentSection(
        title: '\uc8fc\uc758',
        body:
            '\uc13c\uc11c \uac12\uc774 \uc815\uc0c1\uc774\uc5b4\ub3c4 \ub3d9\ubb3c \ud589\ud0dc\uac00 '
            '\uc774\uc0c1\ud558\uba74 \ud604\uc7a5 \ud655\uc778\uc774 \uc6b0\uc120\ub2e4.',
        kind: SectionKind.caution,
      ),
      ContentSection(
        title: '\ud750\ub984',
        body:
            '\uacbd\ubcf4 \u2192 \ud604\uc7a5 \ud655\uc778 \u2192 \ub85c\uceec \uc218\ub3d9/\uae34\uae09 \u2192 \uae30\ub85d.',
        kind: SectionKind.flow,
      ),
      ContentSection(
        title: '\uc81c\uc870\uc0ac',
        body:
            '\ud658\uae30\uae30\u00b7\ucee8\ud2b8\ub864\ub7ec \uc124\uc815\u00b7\ube44\uc0c1 '
            '\ub3d9\uc791\uc740 \uc81c\ud488 \ub9e4\ub274\uc5bc\u00b7\uc124\uacc4\ub3c4\ub97c \ub530\ub978\ub2e4.',
        kind: SectionKind.manufacturer,
      ),
    ],
    keywords: const [
      '\ucd95\uc0ac',
      '\ub3d9\ubb3c\ubcf5\uc9c0',
      '\ud658\uae30',
      '\ube44\uc0c1\uc804\uc6d0',
      '\uae34\uae09\ud658\uae30',
    ],
    relatedIds: const [
      'sw-alarm',
      'comm-offline',
      'control-interlock',
      'control-env',
      'safety-remote',
    ],
    sourceIds: const [
      'src-livestock-welfare',
      'src-env-edu',
      'src-farm-safety',
    ],
    tocTitles: const [
      '\ub3d9\ubb3c\ubcf5\uc9c0',
      '\uae34\uae09 \ud658\uae30(\ub85c\uceec)',
      '\ucd95\uc885\u00b7\uc77c\ub839 \ubcc0\uc774',
      '\uc13c\uc11c\u00b7\uacbd\ubcf4',
      '\uccb4\ud06c',
      '\uc548\uc804',
      '\uc8fc\uc758',
      '\ud750\ub984',
      '\uc81c\uc870\uc0ac',
    ],
  ),
  'ai-anomaly': SmartFarmContent(
    id: 'ai-anomaly',
    title: '\uc774\uc0c1 \uac10\uc9c0',
    summary:
        '\ud3c9\uc18c\uc640 \ub2e4\ub978 \ud328\ud134\uc744 \uc54c\ub9b0\ub2e4. '
        '\uc6d0\uc778 \ud655\uc815\uc774\ub098 \uc790\ub3d9 \uc870\uce58 \uad8c\ud55c\uc774 \uc544\ub2c8\ub2e4. '
        '\uaddc\uce59\u00b7\ud1b5\uacc4\u00b7ML\uc744 \ube44\uad50\ud558\uace0, \uc815\ud655\ub3c4 %\ub97c '
        '\ub0b4\uc138\uc6b0\uc9c0 \uc54a\ub294\ub2e4.',
    category: 'AI\u00b7\ubd84\uc11d',
    difficulty: Difficulty.practical,
    contentType: ContentType.technology,
    farmTypes: const [FarmType.general],
    qualityGrade: 'A',
    verificationStatus: VerificationStatus.educationalExample,
    checkedAt: '2026-07-23',
    sections: [
      ContentSection(
        title: '\ubaa9\uc801',
        body:
            '\uc13c\uc11c \uace0\uc7a5\u00b7\ud1b5\uc2e0 \uc774\uc0c1\u00b7\uae09\uaca9\ud55c \ud658\uacbd '
            '\ubcc0\ud654\ub97c \uc870\uae30\uc5d0 \ud45c\uc2dc\ud55c\ub2e4. \uacbd\ubcf4 \ud6c4 '
            '\ud604\uc7a5 \ud655\uc778\uc774 \ud544\uc218\ub2e4.',
        kind: SectionKind.practical,
      ),
      ContentSection(
        title: '\uaddc\uce59 vs \ud1b5\uacc4 vs ML',
        body:
            '\uc784\uacc4\u00b7\ubcc0\ud654\uc728 \ub4f1 \uaddc\uce59\uc740 \uc124\uba85\uc774 \uc26c\uc6b0\ub2e4. '
            '\ud1b5\uacc4(\uc774\ub3d9\ud3c9\uade0\u00b7\ubd84\uc0b0)\ub294 \uac04\ub2e8\ud558\ub098 '
            '\uacc4\uc808\u00b7\uc791\uae30 \ubcc0\ud654\uc5d0 \ubbfc\uac10\ud558\ub2e4. ML\uc740 '
            '\ubcf5\uc7a1 \ud328\ud134\uc5d0 \uc720\ub9ac\ud560 \uc218 \uc788\uc73c\ub098 \ub370\uc774\ud130 '
            '\ud488\uc9c8\u00b7\ubd84\ud3ec \ubcc0\ud654\uc5d0 \ucde8\uc57d\ud558\ub2e4.',
        kind: SectionKind.expertNote,
        bullets: const [
          '\uaddc\uce59: \uba85\ud655\u00b7\uac10\uc0ac \uc26c\uc6c0',
          '\ud1b5\uacc4: \uae30\uc900\uc120 \uc7ac\uc124\uc815 \ud544\uc694',
          'ML: \ud6c4\ubcf4\uc218/\uac80\uc99d \uc5c6\uc774 \uc0ac\uc6a9 \uae08\uc9c0',
        ],
      ),
      ContentSection(
        title: '\uc81c\uc5b4 \uc5f0\ub3d9 \uae08\uc9c0',
        body:
            '\uc774\uc0c1 \uc810\uc218\ub97c \uc548\uc804 PLC \ucd9c\ub825\uc5d0 \uc9c1\uacb0\ud558\uc9c0 '
            '\ub9d0\ub77c. \uacbd\ubcf4\u00b7\uac80\ud1a0 \uc694\uccad\uae4c\uc9c0\ub9cc \uc790\ub3d9\ud654\ud55c\ub2e4.',
        kind: SectionKind.danger,
      ),
      ContentSection(
        title: '\ud488\uc9c8\uacfc\uc758 \uc5f0\ub3d9',
        body:
            'missing/stale/communicationError \uc785\ub825\uc740 \uc774\uc0c1 \ubaa8\ub378\uc5d0 '
            '\ub123\uc9c0 \ub9d0\uac70\ub098, \ubcc4\ub3c4 \uacbd\ubcf4\ub85c \ubd84\ub9ac\ud55c\ub2e4.',
        kind: SectionKind.caution,
      ),
      ContentSection(
        title: '\uccb4\ud06c',
        body: '\uc774\uc0c1 \uac10\uc9c0 \ub3c4\uc785 \uccb4\ud06c.',
        kind: SectionKind.practical,
        copyText:
            '[\uc774\uc0c1 \uac10\uc9c0 \uccb4\ud06c]\n'
            '- \uaddc\uce59/\ud1b5\uacc4/ML \uc911 \ubb34\uc5c7\uc744 \uc4f0\ub294\uc9c0\n'
            '- \ud488\uc9c8 \ub098\uc056 \uc785\ub825 \ucc98\ub9ac\n'
            '- \uacbd\ubcf4\ub9cc / \uc790\ub3d9 \uc81c\uc5b4 \ubbf8\uc5f0\ub3d9\n'
            '- \uac80\uc99d \uae30\ub85d(\uc624\ud0d0/\ubbf8\ud0d0)\n'
            '- \uc815\ud655\ub3c4 % \ud6c4\ubcf4 \uae08\uc9c0',
        codeLanguage: 'text',
      ),
      ContentSection(
        title: '\ud750\ub984',
        body:
            '\ub370\uc774\ud130 \u2192 \ud488\uc9c8 \u2192 \uac10\uc9c0 \u2192 \uacbd\ubcf4 \u2192 \uc0ac\ub78c \ud655\uc778.',
        kind: SectionKind.flow,
      ),
      ContentSection(
        title: '\uc548\uc804',
        body:
            '\uc774\uc0c1 \uacbd\ubcf4\ub97c \ubb34\uc2dc\ud558\uace0 \uc790\ub3d9\uc744 \uac15\uc81c '
            '\uc720\uc9c0\ud558\uc9c0 \ub9d0\ub77c.',
        kind: SectionKind.safety,
      ),
      ContentSection(
        title: '\ud604\uc7a5\uac80\uc99d',
        body:
            '\uac10\ub3c4\u00b7\uc624\ud0d0\uc728\uc740 \uc2dc\uc124\u00b7\uc2dc\uc808\ubcc4\ub85c '
            '\uac80\uc99d\ud558\uba70, \uad50\uc7ac\uc5d0 \uc22b\uc790\ub97c \ub0b4\uc138\uc6b0\uc9c0 \uc54a\ub294\ub2e4.',
        kind: SectionKind.fieldValidation,
      ),
      ContentSection(
        title: '\uc911\uc694',
        body:
            '\uc774\uc0c1 \uac10\uc9c0\ub294 \uac80\uc0ac \ub3c4\uad6c\uc774\uc9c0 \uc9c4\ub2e8\uc11c\uac00 '
            '\uc544\ub2c8\ub2e4.',
        kind: SectionKind.important,
      ),
    ],
    keywords: const [
      '\uc774\uc0c1\uac10\uc9c0',
      'anomaly',
      '\uaddc\uce59',
      '\ud1b5\uacc4',
      'ML',
    ],
    relatedIds: const [
      'ai-data-quality',
      'sw-alarm',
      'ai-limits',
      'ai-prediction',
    ],
    sourceIds: const ['src-ai-caution', 'src-sensor-edu'],
    tocTitles: const [
      '\ubaa9\uc801',
      '\uaddc\uce59 vs \ud1b5\uacc4 vs ML',
      '\uc81c\uc5b4 \uc5f0\ub3d9 \uae08\uc9c0',
      '\ud488\uc9c8\uacfc\uc758 \uc5f0\ub3d9',
      '\uccb4\ud06c',
      '\ud750\ub984',
      '\uc548\uc804',
      '\ud604\uc7a5\uac80\uc99d',
      '\uc911\uc694',
    ],
  ),

  'ai-prediction': SmartFarmContent(
    id: 'ai-prediction',
    title: '\uc608\uce21 \ubaa8\ub378',
    summary:
        '\ub2e8\uae30 \uacbd\ud5a5\u00b7\ubd80\ud558 \uc608\uce21 \ub4f1\uc5d0 \uc4f8 \uc218 \uc788\ub2e4. '
        '\ud655\uc815 \uc608\ubcf4\u00b7\uc218\uc775 \ubcf4\uc7a5\uc744 \uc8fc\uc7a5\ud558\uc9c0 \uc54a\uace0, '
        '\ubd88\ud655\uc2e4\uc131\uc744 \ud568\uaed8 \ud45c\uc2dc\ud55c\ub2e4.',
    category: 'AI\u00b7\ubd84\uc11d',
    difficulty: Difficulty.practical,
    contentType: ContentType.technology,
    farmTypes: const [FarmType.general, FarmType.greenhouse],
    qualityGrade: 'B',
    verificationStatus: VerificationStatus.educationalExample,
    checkedAt: '2026-07-23',
    sections: [
      ContentSection(
        title: '\ubaa9\uc801',
        body:
            '\ud658\uae30\u00b7\ub0a8\ubc29\u00b7\uc778\ub825 \uc900\ube44 \ud310\ub2e8\uc744 \ubcf4\uc870\ud55c\ub2e4. '
            '\uc608\uce21\uac12\uc744 \uc81c\uc5b4 \uba85\ub839\uc73c\ub85c \uc9c1\uacb0\ud558\uc9c0 \ub9d0\ub77c.',
        kind: SectionKind.practical,
      ),
      ContentSection(
        title: '\ud544\uc218 \ud45c\uc2dc',
        body: '\uc608\uce21 UI\uc5d0 \ud3ec\ud568\ud560 \ud56d\ubaa9.',
        bullets: const [
          '\uc608\uce21 \uad6c\uac04\u00b7\ub300\uc0c1 \ubcc0\uc218',
          '\ubd88\ud655\uc2e4\uc131/\uad6c\uac04 \ud45c\uc2dc',
          '\uc785\ub825 \ub370\uc774\ud130 \ud488\uc9c8',
          '\ubaa8\ub378 \ubc84\uc804\u00b7\ud559\uc2b5 \uae30\uac04',
        ],
        kind: SectionKind.important,
      ),
      ContentSection(
        title: '\uaddc\uce59\u00b7\ud1b5\uacc4\u00b7ML',
        body:
            '\ub2e8\uc21c \ucd94\uc138\u00b7\uacc4\uc808\ud3c9\uade0\ub3c4 \uc720\uc6a9\ud560 \uc218 \uc788\ub2e4. '
            'ML\uc740 \ub370\uc774\ud130\uac00 \ucda9\ubd84\ud560 \ub54c\ub9cc \uac80\ud1a0\ud558\uace0, '
            '\uc815\ud655\ub3c4 %\ub97c \uad11\uace0\ud558\uc9c0 \ub9d0\ub77c.',
        kind: SectionKind.expertNote,
      ),
      ContentSection(
        title: '\uc81c\uc5b4 \ubbf8\uc5f0\ub3d9',
        body:
            '\uc608\uce21 \uacb0\uacfc\ub97c \uc548\uc804/\ud658\uacbd PLC \ucd9c\ub825\uc5d0 '
            '\uc790\ub3d9 \uc5f0\uacb0\ud558\uc9c0 \ub9d0\ub77c. \uad8c\uace0\ub294 \uc2b9\uc778 \ud6c4 '
            '\uc218\ub3d9\u00b7\ubc18\uc790\ub3d9 \uacbd\ub85c\ub85c \ub454\ub2e4.',
        kind: SectionKind.danger,
      ),
      ContentSection(
        title: '\uccb4\ud06c',
        body: '\uc608\uce21 \ub3c4\uc785 \uccb4\ud06c.',
        kind: SectionKind.practical,
        copyText:
            '[\uc608\uce21 \uccb4\ud06c]\n'
            '- \ubd88\ud655\uc2e4\uc131 \ud45c\uc2dc \uc5ec\ubd80\n'
            '- \uc785\ub825 \ud488\uc9c8 \uc0c1\ud0dc\n'
            '- \uc790\ub3d9 \uc81c\uc5b4 \ubbf8\uc5f0\ub3d9\n'
            '- \uc218\uc775/\uc218\ud655 \ubcf4\uc7a5 \ud45c\ud604 \uae08\uc9c0\n'
            '- \uac80\uc99d\u00b7\uc7ac\ud559\uc2b5 \uacc4\ud68d',
        codeLanguage: 'text',
      ),
      ContentSection(
        title: '\uc8fc\uc758',
        body:
            '\ubd84\ud3ec \uc774\uc0c1(null/\uc2dc\uc124 \uac1c\uc870/\uc2e0\uaddc \uc791\uae30)\uc5d0\uc11c '
            '\uc624\ucc28\uac00 \ucee4\uc9c8 \uc218 \uc788\ub2e4.',
        kind: SectionKind.caution,
      ),
      ContentSection(
        title: '\uc548\uc804',
        body:
            '\uc608\uce21 \uc2e4\ud328\ub97c \uac00\uc815\ud55c \ubc31\uc5c5 \uc6b4\uc601 '
            '\uc808\ucc28\ub97c \ub450\ub77c.',
        kind: SectionKind.safety,
      ),
      ContentSection(
        title: '\ud604\uc7a5\uac80\uc99d',
        body:
            '\uc720\uc6a9\uc131\uc740 \ud604\uc7a5 \ub370\uc774\ud130\ub85c \uac80\uc99d\ud558\uace0, '
            '\uad50\uc7ac \uc22b\uc790\ub97c \uc131\ub2a5\uc73c\ub85c \uc4f0\uc9c0 \ub9d0\ub77c.',
        kind: SectionKind.fieldValidation,
      ),
      ContentSection(
        title: '\ud750\ub984',
        body:
            '\ub370\uc774\ud130 \u2192 \uc608\uce21 \u2192 \ubd88\ud655\uc2e4\uc131 \ud45c\uc2dc \u2192 \uc6b4\uc601\uc790 \uacb0\uc815.',
        kind: SectionKind.flow,
      ),
    ],
    keywords: const [
      '\uc608\uce21',
      '\ubd88\ud655\uc2e4\uc131',
      '\uacbd\ud5a5',
      '\uad8c\uace0',
    ],
    relatedIds: const [
      'ai-limits',
      'ai-data-quality',
      'ai-anomaly',
      'ai-recommendations',
    ],
    sourceIds: const ['src-ai-caution', 'src-rda'],
    tocTitles: const [
      '\ubaa9\uc801',
      '\ud544\uc218 \ud45c\uc2dc',
      '\uaddc\uce59\u00b7\ud1b5\uacc4\u00b7ML',
      '\uc81c\uc5b4 \ubbf8\uc5f0\ub3d9',
      '\uccb4\ud06c',
      '\uc8fc\uc758',
      '\uc548\uc804',
      '\ud604\uc7a5\uac80\uc99d',
      '\ud750\ub984',
    ],
  ),

  'ai-vision': SmartFarmContent(
    id: 'ai-vision',
    title: '\ube44\uc804\u00b7\uc601\uc0c1 \ud65c\uc6a9',
    summary:
        '\uc0dd\uc721 \uae30\ub85d\u00b7\uc774\uc0c1 \uc678\uad00 \uad00\ucc30\uc5d0 \ubcf4\uc870\ub85c '
        '\uc4f4\ub2e4. \ubaa8\ub4e0 \ubcd1\ud574\ucda9\uc744 \uc790\ub3d9 \ud655\uc9c4\ud55c\ub2e4\uace0 '
        '\ubcf4\uc9c0 \ub9d0\uba70, \uc815\ud655\ub3c4 %\ub97c \ub0b4\uc138\uc6b0\uc9c0 \uc54a\ub294\ub2e4.',
    category: 'AI\u00b7\ubd84\uc11d',
    difficulty: Difficulty.practical,
    contentType: ContentType.technology,
    farmTypes: const [
      FarmType.greenhouse,
      FarmType.orchard,
      FarmType.openField,
    ],
    qualityGrade: 'B',
    verificationStatus: VerificationStatus.needsReview,
    checkedAt: '2026-07-23',
    sections: [
      ContentSection(
        title: '\ubaa9\uc801',
        body:
            '\ub3d9\uc77c \uac01\ub3c4\u00b7\uc870\uba85 \uc870\uac74\uc758 \uc2dc\uacc4\uc5f4 '
            '\uc774\ubbf8\uc9c0 \uae30\ub85d\uacfc \ubcc0\ud654 \ube44\uad50\uc5d0 \uc4f0\ub294\ub2e4.',
        kind: SectionKind.practical,
      ),
      ContentSection(
        title: '\ud55c\uacc4',
        body:
            '\uc870\uba85\u00b7\uc774\uc2ac\u00b7\uba3c\uc9c0\u00b7\uac00\ub9bc\uc5d0 \ucde8\uc57d\ud558\ub2e4. '
            '\ud604\uc7a5 \ud310\uc815\u00b7\uc804\ubb38\uac00 \ud655\uc778\uc774 \ud544\uc694\ud558\ub2e4.',
        kind: SectionKind.caution,
      ),
      ContentSection(
        title: '\uaddc\uce59\u00b7\ud1b5\uacc4\u00b7ML',
        body:
            '\uc0c9\ucc28/\ud06c\uae30 \uc784\uacc4 \ub4f1 \uac04\ub2e8 \uaddc\uce59\ub3c4 \uc720\uc6a9\ud560 '
            '\uc218 \uc788\ub2e4. ML \ubd84\ub958\ub294 \ub77c\ubca8\u00b7\ub370\uc774\ud130\uc14b\uc5d0 '
            '\uc758\uc874\ud558\uba70 \uc131\ub2a5 %\ub97c \ub2e8\uc815\ud558\uc9c0 \ub9d0\ub77c.',
        kind: SectionKind.expertNote,
      ),
      ContentSection(
        title: '\uc81c\uc5b4 \ubbf8\uc5f0\ub3d9',
        body:
            '\ube44\uc804 \uacb0\uacfc\ub85c \ubc29\uc81c/\ud658\uae30/\uad00\uc218\ub97c '
            '\uc790\ub3d9 \uc2e4\ud589\ud558\uc9c0 \ub9d0\ub77c. \uad8c\uace0\u2192\uc2b9\uc778\u2192'
            '\uc218\ub3d9/\ubc18\uc790\ub3d9\uc774 \uc6d0\uce59\uc774\ub2e4.',
        kind: SectionKind.danger,
      ),
      ContentSection(
        title: '\uccb4\ud06c',
        body: '\ube44\uc804 \ub3c4\uc785 \uccb4\ud06c.',
        kind: SectionKind.practical,
        copyText:
            '[\ube44\uc804 \uccb4\ud06c]\n'
            '- \uce74\uba54\ub77c \uac01\ub3c4\u00b7\uc870\uba85\u00b7\uc624\uc5fc \uace0\uc815\n'
            '- \ub77c\ubca8\u00b7\ud504\ub808\uc784 \ub808\uc774\ud2b8/\ub2e8\uc704\n'
            '- \uacb0\uacfc=\uad8c\uace0(\ud655\uc9c4 \uc544\ub2d8)\n'
            '- \uc790\ub3d9 \uc81c\uc5b4 \ubbf8\uc5f0\ub3d9\n'
            '- \uac1c\uc778\uc815\ubcf4/\uc601\uc0c1 \ubcf4\uad00 \uc815\ucc45',
        codeLanguage: 'text',
      ),
      ContentSection(
        title: '\ud504\ub77c\uc774\ubc84\uc2dc',
        body:
            '\uc791\uc5c5\uc790\u00b7\ubc29\ubb38\uc790 \uc601\uc0c1\uc774 \ud3ec\ud568\ub420 \uc218 '
            '\uc788\uc73c\uba74 \ub3d9\uc758\u00b7\ubcf4\uad00\u00b7\uc811\uadfc \uc81c\uc5b4\ub97c '
            '\ud655\uc778\ud55c\ub2e4.',
        kind: SectionKind.safety,
      ),
      ContentSection(
        title: '\ud750\ub984',
        body:
            '\ucd2c\uc601 \u2192 \uc804\ucc98/\ub77c\ubca8 \u2192 \uad8c\uace0 \u2192 \uc0ac\ub78c \ud655\uc778.',
        kind: SectionKind.flow,
      ),
      ContentSection(
        title: '\ud604\uc7a5\uac80\uc99d',
        body:
            '\uac80\ucd9c/\uc624\ud0d0\uc740 \uc791\ubb3c\u00b7\uad11\ud658\uacbd\ubcc4\ub85c '
            '\uac80\uc99d\ud558\uace0, \uacf5\uc2dd \uc131\ub2a5\uce58\ub85c \uc120\uc804\ud558\uc9c0 \ub9d0\ub77c.',
        kind: SectionKind.fieldValidation,
      ),
      ContentSection(
        title: '\uc911\uc694',
        body:
            '\ube44\uc804\uc740 \ubcf4\uc870 \uae30\ub85d\uc774\uba70 \ubaa8\ub4e0 \uacb0\uc815\uc744 '
            '\ub300\uccb4\ud558\uc9c0 \uc54a\ub294\ub2e4.',
        kind: SectionKind.important,
      ),
    ],
    keywords: const [
      '\ube44\uc804',
      '\uce74\uba54\ub77c',
      '\uc0dd\uc721\uae30\ub85d',
      '\uc601\uc0c1',
    ],
    relatedIds: const [
      'ai-limits',
      'ai-recommendations',
      'ai-data-quality',
      'comm-farm-network',
    ],
    sourceIds: const ['src-ai-caution', 'src-rda'],
    tocTitles: const [
      '\ubaa9\uc801',
      '\ud55c\uacc4',
      '\uaddc\uce59\u00b7\ud1b5\uacc4\u00b7ML',
      '\uc81c\uc5b4 \ubbf8\uc5f0\ub3d9',
      '\uccb4\ud06c',
      '\ud504\ub77c\uc774\ubc84\uc2dc',
      '\ud750\ub984',
      '\ud604\uc7a5\uac80\uc99d',
      '\uc911\uc694',
    ],
  ),

  'ai-limits': SmartFarmContent(
    id: 'ai-limits',
    title: 'AI \ud55c\uacc4\uc640 \uc624\uc6a9 \ubc29\uc9c0',
    summary:
        '\ub370\uc774\ud130 \ubd80\uc871\u00b7\ubd84\ud3ec \ubcc0\ud654\u00b7\uc13c\uc11c \uc624\ub958\u00b7'
        '\uacfc\uc2e0\uc744 \uba85\uc2dc\ud558\uace0, \uc81c\uc5b4 \uc5f0\uacb0 \uaddc\uce59\uc744 \uace0\uc815\ud55c\ub2e4. '
        'AI\ub97c \uc548\uc804 PLC \ucd9c\ub825\uc5d0 \uc790\ub3d9 \uc5f0\uacb0\ud558\uc9c0 \ub54a\ub294\ub2e4.',
    category: 'AI\u00b7\ubd84\uc11d',
    difficulty: Difficulty.expert,
    contentType: ContentType.checklist,
    farmTypes: const [FarmType.general],
    qualityGrade: 'A',
    verificationStatus: VerificationStatus.educationalExample,
    checkedAt: '2026-07-23',
    sections: [
      ContentSection(
        title: '\ud55c\uacc4',
        body: 'AI\uac00 \uc57d\ud55c \uc810.',
        bullets: const [
          '\ud559\uc2b5\uc5d0 \uc5c6\ub294 \uc0c1\ud669(\uc2e0\uaddc \uc791\uae30\u00b7\uacf5\uc0ac) \ucde8\uc57d',
          '\ud488\uc9c8 \ub098\uc050 \uc785\ub825\uc5d0 \ucde8\uc57d',
          '\uc0c1\uad00\uc744 \uc778\uacfc\ub85c \uc624\ud574\ud558\uae30 \uc26c\uc6c0',
        ],
        kind: SectionKind.important,
      ),
      ContentSection(
        title: '\uc81c\uc5b4 \uc5f0\uacb0 \uaddc\uce59',
        body:
            'AI \ucd9c\ub825 \u2192 \uad8c\uace0/\uc54c\ub9bc. \uc548\uc804\u00b7\uc778\ud130\ub85d\u00b7'
            'E-Stop\u00b7\uc218\ub3d9 \uc6b0\uc120\uc740 \ub85c\uceec \uaddc\uce59/\ud558\ub4dc\uc6e8\uc5b4\uac00 '
            '\ub2f4\ub2f9\ud55c\ub2e4.',
        kind: SectionKind.danger,
        copyText:
            '[AI control rules]\n'
            '1. AI output = recommendation/alert only by default\n'
            '2. Never auto-wire AI to safety PLC outputs\n'
            '3. Interlock / E-Stop / manual override always local\n'
            '4. Any write path needs human approval + audit log\n'
            '5. Bad quality input => suppress AI action',
        codeLanguage: 'text',
      ),
      ContentSection(
        title: '\uacfc\uc2e0 \ubc29\uc9c0',
        body:
            '\uc815\ud655\ub3c4 %\u00b7\uc218\uc775 \ubcf4\uc7a5\u00b7\uc644\uc804 \uc790\ub3d9\ud654 '
            '\ud45c\ud604\uc744 \ud53c\ud55c\ub2e4. \ubd88\ud655\uc2e4\uc131\u00b7\ud55c\uacc4\ub97c '
            'UI\uc5d0 \ud45c\uc2dc\ud55c\ub2e4.',
        kind: SectionKind.caution,
      ),
      ContentSection(
        title: '\uccb4\ud06c',
        body: 'AI \uc624\uc6a9 \ubc29\uc9c0 \uccb4\ud06c.',
        kind: SectionKind.practical,
        copyText:
            '[AI \ud55c\uacc4 \uccb4\ud06c]\n'
            '- \uc548\uc804 PLC \uc9c1\uacb0 \uc5c6\ub294\uc9c0\n'
            '- \uad8c\uace0=\uc2b9\uc778 \ud6c4 \uc2e4\ud589\n'
            '- \ud488\uc9c8 \ub098\uc056 \uc2dc AI \uc870\uce58 \uc5b5\uc81c\n'
            '- \uac10\uc0ac\u00b7\ub85c\uadf8\n'
            '- \uc815\ud655\ub3c4 % \ud6c4\ubcf4 \uae08\uc9c0',
        codeLanguage: 'text',
      ),
      ContentSection(
        title: '\ud750\ub984',
        body:
            'AI \uad8c\uace0 \u2192 \uc6b4\uc601\uc790 \uc2b9\uc778 \u2192 \ub85c\uceec \uc81c\uc5b4/\uc778\ud130\ub85d.',
        kind: SectionKind.flow,
      ),
      ContentSection(
        title: '\uc548\uc804',
        body:
            '\uc6d0\uaca9 AI \uad8c\uace0\uac00 \ud604\uc7a5 \uc548\uc804\uc815\uc9c0\ub97c '
            '\ud574\uc81c\ud560 \uc218 \uc5c6\ub2e4.',
        kind: SectionKind.safety,
      ),
      ContentSection(
        title: '\ud604\uc7a5\uac80\uc99d',
        body:
            '\uc2b9\uc778 \uc808\ucc28\u00b7\ub85c\uadf8 \ubcf4\uc874\uc740 \uc870\uc9c1 '
            '\uc815\ucc45\uc5d0 \ub9de\uac8c \uac80\uc99d\ud55c\ub2e4.',
        kind: SectionKind.fieldValidation,
      ),
      ContentSection(
        title: '\uc2e4\ubb34',
        body:
            '\uc0c8 \ubaa8\ub378/\uc0c8 \uc791\uae30 \ub3c4\uc785 \uc2dc A/B \ud14c\uc2a4\ud2b8\uc640 '
            '\ub864\ubc31 \uacc4\ud68d\uc744 \ub450\ub77c.',
        kind: SectionKind.practical,
      ),
      ContentSection(
        title: '\uc804\ubb38 \uba54\ubaa8',
        body:
            '\uc131\ub2a5 \ud3c9\uac00\ub294 \ud604\uc7a5 \ub370\uc774\ud130\u00b7\uc5c5\ubb34 '
            'KPI\ub85c \ud558\ub418, \uad50\uc7ac\uc5d0 \uac00\uc9dc \uc22b\uc790\ub97c \uc4f0\uc9c0 '
            '\ub9d0\ub77c.',
        kind: SectionKind.expertNote,
      ),
    ],
    keywords: const [
      '\ud55c\uacc4',
      '\uacfc\uc2e0',
      '\uc778\ud130\ub85d',
      '\uc2b9\uc778',
      '\uc624\uc6a9\ubc29\uc9c0',
    ],
    relatedIds: const [
      'ai-recommendations',
      'ai-prediction',
      'ai-anomaly',
      'safety-remote',
      'control-interlock',
    ],
    sourceIds: const ['src-ai-caution', 'src-control-safety', 'src-kosha'],
    tocTitles: const [
      '\ud55c\uacc4',
      '\uc81c\uc5b4 \uc5f0\uacb0 \uaddc\uce59',
      '\uacfc\uc2e0 \ubc29\uc9c0',
      '\uccb4\ud06c',
      '\ud750\ub984',
      '\uc548\uc804',
      '\ud604\uc7a5\uac80\uc99d',
      '\uc2e4\ubb34',
      '\uc804\ubb38 \uba54\ubaa8',
    ],
  ),

  'ai-recommendations': SmartFarmContent(
    id: 'ai-recommendations',
    title: '\uad8c\uace0\u00b7\uc758\uc0ac\uacb0\uc815 \uc9c0\uc6d0',
    summary:
        '\uad8c\uace0\ub294 \uc120\ud0dd\uc9c0\uc640 \uadfc\uac70\ub97c \ubcf4\uc5ec \uc90d\ub2e4. '
        '\ucd5c\uc885 \ud310\ub2e8\uacfc \ucc45\uc784\uc740 \uc6b4\uc601\uc790\uc5d0\uac8c \uc788\ub2e4. '
        '\uc790\ub3d9 \uc2e4\ud589\uacfc \uad8c\uace0\ub97c \ud63c\ub3d9\ud558\uc9c0 \ub9d0\ub77c.',
    category: 'AI\u00b7\ubd84\uc11d',
    difficulty: Difficulty.practical,
    contentType: ContentType.concept,
    farmTypes: const [FarmType.general],
    qualityGrade: 'A',
    verificationStatus: VerificationStatus.educationalExample,
    checkedAt: '2026-07-23',
    sections: [
      ContentSection(
        title: '\uc88b\uc740 \uad8c\uace0 UI',
        body:
            '\uad8c\uace0 \ud654\uba74\uc5d0 \ub113\uc5b4\uc57c \ud560 \ud56d\ubaa9.',
        bullets: const [
          '\uadfc\uac70 \ub370\uc774\ud130 \ub9c1\ud06c',
          '\ubd88\ud655\uc2e4\uc131 \ud45c\uc2dc',
          '\ub300\uc548(\ub300\uae30/\uc218\ub3d9/\uc790\ub3d9\uc81c\uc548)',
          '\uc2e4\ud589 \uc804 \ud655\uc778 \ub2e8\uacc4',
        ],
        kind: SectionKind.important,
      ),
      ContentSection(
        title: '\uad8c\uace0 vs \uba85\ub839',
        body:
            '\uad8c\uace0\ub294 \uc81c\uc548\uc774\uace0, \uba85\ub839\uc740 \uc2b9\uc778\ub41c '
            '\uc81c\uc5b4 \uc785\ub825\uc774\ub2e4. \ub450 \uac1c\ub150\uc744 UI\u00b7\ub85c\uadf8\uc5d0\uc11c '
            '\ubd84\ub9ac\ud55c\ub2e4.',
        kind: SectionKind.practical,
      ),
      ContentSection(
        title: '\uc790\ub3d9\ud654 \uae08\uc9c0',
        body:
            '\uad8c\uace0\ub97c \uc548\uc804/\ud658\uacbd \ucd9c\ub825\uc5d0 \uc790\ub3d9 '
            '\uc5f0\uacb0\ud558\uc9c0 \ub9d0\ub77c. \ud544\uc694 \uc2dc \ubc18\uc790\ub3d9+'
            '\uc2b9\uc778+\uc778\ud130\ub85d\uc744 \ub454\ub2e4.',
        kind: SectionKind.danger,
      ),
      ContentSection(
        title: '\uccb4\ud06c',
        body: '\uad8c\uace0 \uae30\ub2a5 \uccb4\ud06c.',
        kind: SectionKind.practical,
        copyText:
            '[\uad8c\uace0 \uccb4\ud06c]\n'
            '- \uadfc\uac70/\ub300\uc548/\ubd88\ud655\uc2e4\uc131 \ud45c\uc2dc\n'
            '- \uc2e4\ud589 \uc804 \ud655\uc778\n'
            '- \uad8c\uace0\u2260\uc790\ub3d9 \uba85\ub839\n'
            '- \uac70\uc808/\uc2b9\uc778 \ub85c\uadf8\n'
            '- \ud488\uc9c8 \ub098\uc056 \uc2dc \uad8c\uace0 \uc5b5\uc81c \ub610\ub294 \uacbd\uace0',
        codeLanguage: 'text',
      ),
      ContentSection(
        title: '\ud750\ub984',
        body:
            '\ubd84\uc11d \u2192 \uad8c\uace0 \u2192 \uc6b4\uc601\uc790 \uc120\ud0dd \u2192 (\uc120\ud0dd) \uc2e4\ud589.',
        kind: SectionKind.flow,
      ),
      ContentSection(
        title: '\uc8fc\uc758',
        body:
            '\ud55c \uac00\uc9c0 \uad8c\uace0\ub9cc \ubcf4\uc774\uba74 \uacfc\uc2e0\uc744 '
            '\uc720\ub3c4\ud55c\ub2e4. \ub300\uc548\uacfc \ubbf8\uc2e4\ud589 \uc635\uc158\uc744 '
            '\ud568\uaed8 \ub450\ub77c.',
        kind: SectionKind.caution,
      ),
      ContentSection(
        title: '\uc548\uc804',
        body:
            '\uc6d0\uaca9 \uc2b9\uc778\uc774\ub77c\ub3c4 \ud604\uc7a5 \uc548\uc804 \uc0c1\ud0dc\ub97c '
            '\ud655\uc778\ud560 \uc218 \uc788\ub294 \uacbd\ub85c\ub97c \ub0a8\uae34\ub2e4.',
        kind: SectionKind.safety,
      ),
      ContentSection(
        title: '\ud604\uc7a5\uac80\uc99d',
        body:
            '\uad8c\uace0 \uc218\ub77d\u00b7\uac70\ubd80\uc728\u00b7\uc0ac\ud6c4 \ud3c9\uac00\ub97c '
            '\uae30\ub85d\ud574 \uac1c\uc120\ud558\ub418, \uc815\ud655\ub3c4 %\ub85c '
            '\ub300\uccb4\ud558\uc9c0 \ub9d0\ub77c.',
        kind: SectionKind.fieldValidation,
      ),
      ContentSection(
        title: '\uc804\ubb38 \uba54\ubaa8',
        body:
            '\uc124\uba85 \uac00\ub2a5\uc131(XAI)\uc740 \uc120\ud0dd\uc774\uc9c0, \uc124\uba85\uc774 '
            '\uc788\ub2e4\uace0 \uc815\ud655\ud558\ub2e4\ub294 \ub73b\uc774 \uc544\ub2c8\ub2e4.',
        kind: SectionKind.expertNote,
      ),
    ],
    keywords: const [
      '\uad8c\uace0',
      '\uc758\uc0ac\uacb0\uc815',
      '\uc124\uba85\uac00\ub2a5',
      '\uc2b9\uc778',
    ],
    relatedIds: const [
      'ai-limits',
      'ai-prediction',
      'ai-vision',
      'safety-remote',
      'sw-monitoring',
    ],
    sourceIds: const ['src-ai-caution', 'src-control-safety'],
    tocTitles: const [
      '\uc88b\uc740 \uad8c\uace0 UI',
      '\uad8c\uace0 vs \uba85\ub839',
      '\uc790\ub3d9\ud654 \uae08\uc9c0',
      '\uccb4\ud06c',
      '\ud750\ub984',
      '\uc8fc\uc758',
      '\uc548\uc804',
      '\ud604\uc7a5\uac80\uc99d',
      '\uc804\ubb38 \uba54\ubaa8',
    ],
  ),
};
