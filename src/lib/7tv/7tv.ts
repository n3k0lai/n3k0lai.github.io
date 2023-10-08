import type { User } from './user.d.ts';
import type { Emote } from "./emote.d.ts";
import type { EmoteSet } from "./emoteSet.d.ts";
import axios from 'axios';
import type { AxiosInstance, AxiosResponse, AxiosError } from 'axios';

type SevenTvApiClientResponse<T> = {
  success: boolean;
  error?: string;
  data?: T;
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

  async getUser<User>(userId: string): Promise<SevenTvApiClientResponse<User>> {
    try {
      let url = `${this.baseURL}/users/${userId}`;
      const response: AxiosResponse<User> = await this.httpClient.get(url);
      return {
        success: true,
        data: response.data,
      };
    } catch (error) {
      return this.handleError(error);
    }
  }
  
  async getEmote<Emote>(emoteId: string): Promise<SevenTvApiClientResponse<Emote>> {
    try {
      let url = `${this.baseURL}/emotes/${emoteId}`;
      const response: AxiosResponse<Emote> = await this.httpClient.get(url);
      return {
        success: true,
        data: response.data,
      };
    }
    catch (error) {
      return this.handleError(error);
    }
  }

  async getEmoteSet<EmoteSet>(emoteId: string): Promise<SevenTvApiClientResponse<EmoteSet>> {
    try {
      let url = `${this.baseURL}/emote-sets/${emoteId}`;
      const response: AxiosResponse<EmoteSet> = await this.httpClient.get(url);
      return {
        success: true,
        data: response.data,
      };
    } catch (error) {
      return this.handleError(error);
    }
  }
  private handleError(error: any) {
    if (error.response) {
      return {
        success: false,
        error: error.response.data,
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
