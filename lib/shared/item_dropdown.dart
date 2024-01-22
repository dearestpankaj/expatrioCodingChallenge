class ItemDropDown {
  String code;
  String label;

  ItemDropDown({required this.code, required this.label });

  factory ItemDropDown.fromJson(Map<String, dynamic> json) => ItemDropDown(
    code: json['code'],
    label: json['label'],
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is ItemDropDown &&
              runtimeType == other.runtimeType &&
              code == other.code &&
              label == other.label;

  @override
  int get hashCode => code.hashCode ^ label.hashCode;

  @override
  String toString() {
    return 'ItemDropDown{code: $code, label: $label}';
  }
}