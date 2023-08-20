import axios, { AxiosInstance, AxiosResponse, AxiosError } from 'axios';

interface SevenTvApiResponse<T = any> {
  success: boolean;
  data?: T;
  error?: string;
}

class SevenTvApiClient {
  private apiKey: string;
  private baseURL: string;
  private httpClient: AxiosInstance;

  constructor(apiKey: string) {
    this.apiKey = apiKey;
    this.baseURL = 'https://api.7tv.io/v3';
    this.httpClient = axios.create({
      baseURL: this.baseURL,
      headers: {
        'Authorization': `Bearer ${apiKey}`,
      },
    });
  }

  async getResource<T = any>(endpoint: string): Promise<SevenTvApiResponse<T>> {
    try {
      const response: AxiosResponse<SevenTvApiResponse<T>> = await this.httpClient.get(endpoint);
      return response.data;
    } catch (error) {
      return this.handleError(error);
    }
  }

  async getUser<user = any>(userId: string): Promise<SevenTvApiResponse<T>> {
    try {
        let url = `${this.baseURL}/users/${userId}`;
      const response = await fetch(url, {
        method: 'GET',
        headers: {
          Authorization: `Bearer ${this.apiKey}`,
        },
      });

      if (!response.ok) {
        throw new Error('Network response was not ok');
      }

      const responseData = await response.json();
      return responseData;
    } catch (error) {
      return this.handleError(error);
    }
  }
  
  async getEmoteSet<emoteSet = any>(emoteId: string): Promise<SevenTvApiResponse<T>> {
    try {
        let url = `${this.baseURL}/emote-sets/${emoteId}`;
      const response: AxiosResponse<SevenTvApiResponse<user>> = await this.httpClient.get(endpoint);
      return response.data;
      /*const response = await fetch(url, {
        method: 'GET',
        headers: {
          Authorization: `Bearer ${this.apiKey}`,
        },
      });

      if (!response.ok) {
        throw new Error('Network response was not ok');
      }

      const responseData = await response.json();
      return responseData;*/
    } catch (error) {
      return this.handleError(error);
    }
  }
  private handleError(error: AxiosError): SevenTvApiResponse {
    if (error.response) {
      return {
        success: false,
        error: error.response.data.error,
      };
    } else {
      return {
        success: false,
        error: 'An error occurred',
      };
    }
  }
}

export default SevenTvApiClient;
