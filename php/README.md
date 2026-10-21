# SEO Quick Validator API - PHP Package

SEO Quick Validator inspects live web pages for on-page SEO errors and tag issues. Pass any URL to inspect title lengths, meta descriptions, H1 headings, viewport and canonical tags, image alt text, and unverified external links.

## Installation

Install via Composer:

```bash
composer require apiverve/seovalidator
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```php
<?php

require_once 'vendor/autoload.php';

use APIVerve\Seovalidator\Client;

// Initialize the client
$client = new Client('YOUR_API_KEY');

// Make a request
$response = $client->execute(['url' => 'https://apiverve.com']);

// Print the response
print_r($response);
```


### Error Handling

```php
use APIVerve\Seovalidator\Client;
use APIVerve\Seovalidator\Exceptions\APIException;
use APIVerve\Seovalidator\Exceptions\ValidationException;

try {
    $response = $client->execute(['url' => 'https://apiverve.com']);
    print_r($response['data']);
} catch (ValidationException $e) {
    echo "Validation error: " . implode(', ', $e->getErrors());
} catch (APIException $e) {
    echo "API error: " . $e->getMessage();
    echo "Status code: " . $e->getStatusCode();
}
```

### Debug Mode

```php
// Enable debug logging
$client = new Client(
    apiKey: 'YOUR_API_KEY',
    debug: true
);
```

## Example Response

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
    "grade": "A"
  }
}
```

## Requirements

- PHP 7.4 or higher
- Guzzle HTTP client

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/seovalidator?utm_source=packagist&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/seovalidator?utm_source=php&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/seovalidator?utm_source=php&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This package is available under the [MIT License](LICENSE).
