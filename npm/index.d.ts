declare module '@apiverve/seovalidator' {
  export interface seovalidatorOptions {
    api_key: string;
    secure?: boolean;
  }

  export interface seovalidatorResponse {
    status: string;
    error: string | null;
    data: SEOQuickValidatorData;
    code?: number;
  }


  interface SEOQuickValidatorData {
      url:     string;
      passed:  boolean;
      entries: number;
      output:  string[];
  }

  export default class seovalidatorWrapper {
    constructor(options: seovalidatorOptions);

    execute(callback: (error: any, data: seovalidatorResponse | null) => void): Promise<seovalidatorResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: seovalidatorResponse | null) => void): Promise<seovalidatorResponse>;
    execute(query?: Record<string, any>): Promise<seovalidatorResponse>;
  }
}
