# SEO Quick Validator API - Ruby Gem

SEO Quick Validator inspects live web pages for on-page SEO errors and tag issues. Pass any URL to inspect title lengths, meta descriptions, H1 headings, viewport and canonical tags, image alt text, and unverified external links.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'apiverve_seovalidator'
```

And then execute:

```bash
$ bundle install
```

Or install it yourself as:

```bash
$ gem install apiverve_seovalidator
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```ruby
require 'apiverve_seovalidator'

# Initialize the client
client = APIVerve::Seovalidator::Client.new(api_key: "YOUR_API_KEY")

# Make a request
response = client.execute({ url: "https://apiverve.com" })

# Print the response
puts response
```


### Error Handling

```ruby
begin
  response = client.execute({ url: "https://apiverve.com" })
  puts response["data"]
rescue APIVerve::Seovalidator::ValidationError => e
  puts "Validation error: #{e.errors.join(', ')}"
rescue APIVerve::Seovalidator::APIError => e
  puts "API error: #{e.message}"
  puts "Status code: #{e.status_code}"
end
```

### Debug Mode

```ruby
# Enable debug logging
client = APIVerve::Seovalidator::Client.new(
  api_key: "YOUR_API_KEY",
  debug: true
)
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
    "grade": "A",
    "titleRelevance": 47.91,
    "descriptionRelevance": 51.65
  }
}
```

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/seovalidator?utm_source=rubygems&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/seovalidator?utm_source=ruby&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/seovalidator?utm_source=ruby&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This gem is available under the [MIT License](LICENSE).
