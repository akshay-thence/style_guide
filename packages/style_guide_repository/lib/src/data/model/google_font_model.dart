class GoogleFontModel {
  String? family;
  List<String>? variants;
  List<String>? subsets;
  String? version;
  String? lastModified;
  Map<String, String>? files;
  String? category;
  String? kind;

  GoogleFontModel({
    this.family,
    this.variants,
    this.subsets,
    this.version,
    this.lastModified,
    this.files,
    this.category,
    this.kind,
  });

  GoogleFontModel.fromJson(Map<String, dynamic> json) {
    family = json['family'];
    variants = json['variants'].cast<String>();
    subsets = json['subsets'].cast<String>();
    version = json['version'];
    lastModified = json['lastModified'];
    files = json['files'];
    category = json['category'];
    kind = json['kind'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['family'] = family;
    data['variants'] = variants;
    data['subsets'] = subsets;
    data['version'] = version;
    data['lastModified'] = lastModified;
    if (files != null) {
      data['files'] = files;
    }
    data['category'] = category;
    data['kind'] = kind;
    return data;
  }
}
