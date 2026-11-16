# SEO Quick Validator API - Dart/Flutter Client

SEO Quick Validator inspects live web pages for on-page SEO errors and tag issues. Pass any URL to inspect title lengths, meta descriptions, H1 headings, viewport and canonical tags, image alt text, and unverified external links.

[![pub package](https://img.shields.io/pub/v/apiverve_seovalidator.svg)](https://pub.dev/packages/apiverve_seovalidator)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This is the Dart/Flutter client for the [SEO Quick Validator API](https://apiverve.com/marketplace/seovalidator?utm_source=dart&utm_medium=referral&utm_content=readme).

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  apiverve_seovalidator: ^1.2.6
```

Then run:

```bash
dart pub get
# or for Flutter
flutter pub get
```

## Usage

```dart
import 'package:apiverve_seovalidator/apiverve_seovalidator.dart';

void main() async {
  final client = SeovalidatorClient('YOUR_API_KEY');

  try {
    final response = await client.execute({
      'url': 'https://apiverve.com'
    });

    print('Status: ${response.status}');
    print('Data: ${response.data}');
  } catch (e) {
    print('Error: $e');
  }
}
```

## Response

```json
{
  "status": "ok",
  "error": null,
  "data": {
    "url": "https://apiverve.com",
    "passed": false,
    "issueCount": 6,
    "issues": [
      "Image missing 'alt' attribute: '/assets/img/hero-diagram.png'",
      "Image missing 'alt' attribute: '/assets/img/logo-mark.svg'",
      "External link missing 'rel' attribute: 'https://twitter.com/apiverve'",
      "External link missing 'rel' attribute: 'https://github.com/apiverve'",
      "External link missing 'rel' attribute: 'https://status.apiverve.com'",
      "Missing meta 'keywords' tag in head"
    ],
    "checks": {
      "hasTitle": true,
      "titleLength": 54,
      "hasMetaDescription": true,
      "metaDescriptionLength": 158,
      "hasMetaKeywords": false,
      "h1Count": 1,
      "hasCanonical": true,
      "hasViewport": true,
      "imagesTotal": 8,
      "imagesMissingAlt": 2,
      "externalLinksTotal": 10,
      "externalLinksMissingRel": 3
    },
    "seoScore": 93,
    "grade": "A",
    "titleRelevance": 47.91,
    "descriptionRelevance": 51.65
  }
}
```

## API Reference

- **API Home:** [SEO Quick Validator API](https://apiverve.com/marketplace/seovalidator?utm_source=dart&utm_medium=referral&utm_content=readme)
- **Documentation:** [docs.apiverve.com/ref/seovalidator](https://docs.apiverve.com/ref/seovalidator?utm_source=dart&utm_medium=referral&utm_content=readme)

## Authentication

All requests require an API key. Get yours at [apiverve.com](https://apiverve.com?utm_source=dart&utm_medium=referral&utm_content=readme).

## License

MIT License - see [LICENSE](LICENSE) for details.

---

Built with Dart for [APIVerve](https://apiverve.com?utm_source=dart&utm_medium=referral&utm_content=readme)
