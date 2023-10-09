
export interface Post {
    title: string,
    slug: string,
    excerpt: string,
    coverImage: string,
    coverWidth: number, 
    coverHeight: number,
    date: string,
    categories: string[],
}