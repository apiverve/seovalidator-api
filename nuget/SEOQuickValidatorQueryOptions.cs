using System;
using System.Collections.Generic;
using System.Text;
using Newtonsoft.Json;

namespace APIVerve.API.SEOQuickValidator
{
    /// <summary>
    /// Query options for the SEO Quick Validator API
    /// </summary>
    public class SEOQuickValidatorQueryOptions
    {
        /// <summary>
        /// The URL of the web page to validate the SEO metrics of
        /// </summary>
        [JsonProperty("url")]
        public string Url { get; set; }
    }
}
