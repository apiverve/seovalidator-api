/// Response models for the SEO Quick Validator API.

/// API Response wrapper.
class SeovalidatorResponse {
  final String status;
  final dynamic error;
  final SeovalidatorData? data;

  /// Set only when the current plan locks one or more fields; null otherwise.
  final PremiumInfo? premium;

  SeovalidatorResponse({
    required this.status,
    this.error,
    this.data,
    this.premium,
  });

  factory SeovalidatorResponse.fromJson(Map<String, dynamic> json) => SeovalidatorResponse(
    status: json['status'] as String? ?? '',
    error: json['error'],
    data: json['data'] != null ? SeovalidatorData.fromJson(json['data']) : null,
    premium: json['premium'] != null ? PremiumInfo.fromJson(json['premium']) : null,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    if (error != null) 'error': error,
    if (data != null) 'data': data,
    if (premium != null) 'premium': premium!.toJson(),
  };
}

/// Describes fields the current plan does not unlock. Locked fields arrive as null
/// in [data], and [lockedFields] names them (nested ones use dot paths).
class PremiumInfo {
  final String? message;
  final String? upgradeUrl;
  final List<String>? lockedFields;

  PremiumInfo({this.message, this.upgradeUrl, this.lockedFields});

  factory PremiumInfo.fromJson(Map<String, dynamic> json) => PremiumInfo(
    message: json['message'] as String?,
    upgradeUrl: json['upgrade_url'] as String?,
    lockedFields: (json['locked_fields'] as List?)?.map((e) => e.toString()).toList(),
  );

  Map<String, dynamic> toJson() => {
    if (message != null) 'message': message,
    if (upgradeUrl != null) 'upgrade_url': upgradeUrl,
    if (lockedFields != null) 'locked_fields': lockedFields,
  };
}

/// Response data for the SEO Quick Validator API.

class SeovalidatorData {
  String? url;
  bool? passed;
  num? issueCount;
  List<String>? issues;
  SeovalidatorDataChecks? checks;
  num? seoScore;
  String? grade;
  num? titleRelevance;
  num? descriptionRelevance;

  SeovalidatorData({
    this.url,
    this.passed,
    this.issueCount,
    this.issues,
    this.checks,
    this.seoScore,
    this.grade,
    this.titleRelevance,
    this.descriptionRelevance,
  });

  factory SeovalidatorData.fromJson(Map<String, dynamic> json) => SeovalidatorData(
      url: json['url'],
      passed: json['passed'],
      issueCount: json['issueCount'],
      issues: (json['issues'] as List?)?.cast<String>(),
      checks: json['checks'] != null ? SeovalidatorDataChecks.fromJson(json['checks']) : null,
      seoScore: json['seoScore'],
      grade: json['grade'],
      titleRelevance: json['titleRelevance'],
      descriptionRelevance: json['descriptionRelevance'],
    );
}

class SeovalidatorDataChecks {
  bool? hasTitle;
  num? titleLength;
  bool? hasMetaDescription;
  num? metaDescriptionLength;
  bool? hasMetaKeywords;
  num? h1Count;
  bool? hasCanonical;
  bool? hasViewport;
  num? imagesTotal;
  num? imagesMissingAlt;
  num? externalLinksTotal;
  num? externalLinksMissingRel;

  SeovalidatorDataChecks({
    this.hasTitle,
    this.titleLength,
    this.hasMetaDescription,
    this.metaDescriptionLength,
    this.hasMetaKeywords,
    this.h1Count,
    this.hasCanonical,
    this.hasViewport,
    this.imagesTotal,
    this.imagesMissingAlt,
    this.externalLinksTotal,
    this.externalLinksMissingRel,
  });

  factory SeovalidatorDataChecks.fromJson(Map<String, dynamic> json) => SeovalidatorDataChecks(
      hasTitle: json['hasTitle'],
      titleLength: json['titleLength'],
      hasMetaDescription: json['hasMetaDescription'],
      metaDescriptionLength: json['metaDescriptionLength'],
      hasMetaKeywords: json['hasMetaKeywords'],
      h1Count: json['h1Count'],
      hasCanonical: json['hasCanonical'],
      hasViewport: json['hasViewport'],
      imagesTotal: json['imagesTotal'],
      imagesMissingAlt: json['imagesMissingAlt'],
      externalLinksTotal: json['externalLinksTotal'],
      externalLinksMissingRel: json['externalLinksMissingRel'],
    );
}

class SeovalidatorRequest {
  String url;

  SeovalidatorRequest({
    required this.url,
  });

  Map<String, dynamic> toJson() => {
      'url': url,
    };
}
