declare module '@apiverve/seovalidator' {
  export interface seovalidatorOptions {
    api_key: string;
    secure?: boolean;
  }

  /**
   * Describes fields the current plan does not unlock. Locked fields arrive as null
   * in `data`; `locked_fields` names them, using dot paths for nested fields.
   * Absent when the plan unlocks everything.
   */
  export interface PremiumInfo {
    message: string;
    upgrade_url: string;
    locked_fields: string[];
  }

  export interface seovalidatorResponse {
    status: string;
    error: string | null;
    data: SEOQuickValidatorData;
    code?: number;
    premium?: PremiumInfo;
  }


  interface SEOQuickValidatorData {
      url:        null | string;
      passed:     boolean | null;
      issueCount: number | null;
      issues:     (null | string)[];
      checks:     Checks;
      seoScore:   number | null;
      grade:      null | string;
  }
  
  interface Checks {
      hasTitle:                boolean | null;
      titleLength:             number | null;
      hasMetaDescription:      boolean | null;
      metaDescriptionLength:   number | null;
      hasMetaKeywords:         boolean | null;
      h1Count:                 number | null;
      hasCanonical:            boolean | null;
      hasViewport:             boolean | null;
      imagesTotal:             number | null;
      imagesMissingAlt:        number | null;
      externalLinksTotal:      number | null;
      externalLinksMissingRel: number | null;
  }

  export default class seovalidatorWrapper {
    constructor(options: seovalidatorOptions);

    execute(callback: (error: any, data: seovalidatorResponse | null) => void): Promise<seovalidatorResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: seovalidatorResponse | null) => void): Promise<seovalidatorResponse>;
    execute(query?: Record<string, any>): Promise<seovalidatorResponse>;
  }
}
