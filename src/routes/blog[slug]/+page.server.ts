// this file retrieves the page content from a local markdown file
import { error } from '@sveltejs/kit';

/** @type {import('./$types').PageServerLoad} */
export async function load({ params }) {
	const post = await import(`./_posts/${params.slug}.md`);


	if (post) {
		return post;
	}


	throw error(404, 'Not found');
}