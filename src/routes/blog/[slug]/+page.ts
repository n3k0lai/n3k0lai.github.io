// this file resolves slug from /blog/[slug]/.svelte
import { error } from '@sveltejs/kit';

/** @type {import('./$types').PageLoad} */
export const load = async ({ params }) => {
	try {
		const post = await import(`../../../lib/posts/${params.slug}.md`)
		return {
			PostContent: post.default,
			meta: { ...post.metadata, slug: params.slug } 
		}
		//if (params.slug === 'hello-world') {
		//}
	} catch(err: any) {
		throw error(404, err);
	}
}