enum NumQuestionsEnum {
  min(7),
  mid(12),
  max(22),
  all(9999);

  const NumQuestionsEnum(this.value);
  final int value;

  String get description {
    if (value == NumQuestionsEnum.all.value) return 'Todos';

    return value.toString();
  }

  static NumQuestionsEnum getByValue(int value) {
    if (value == 7) return NumQuestionsEnum.min;
    if (value == 12) return NumQuestionsEnum.mid;
    if (value == 22) return NumQuestionsEnum.max;
    return NumQuestionsEnum.all;
  }

  static NumQuestionsEnum getByIndex(int index) {
    if (index == 0) return NumQuestionsEnum.min;
    if (index == 1) return NumQuestionsEnum.mid;
    if (index == 2) return NumQuestionsEnum.max;
    return NumQuestionsEnum.all;
  }
}
