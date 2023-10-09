<script lang=ts>
	import PostsList from '$lib/components/navigation/PostsList.svelte'
	import Pagination from '$lib/components/navigation/Pagination.svelte'
    import type { Post } from '$lib/assets/ts/types';
	import { siteDescription } from '$lib/config'

	export let data: {
        posts: Post[],
        total: number
    } = {
        posts: [],
        total: 0
    };
</script>


<svelte:head>
	<title>Blog</title>
	<meta data-key="description" name="description" content={siteDescription}>
</svelte:head>

<h1>Blog</h1>

<PostsList posts={data.posts} />

<Pagination currentPage={1} totalPosts={data.total} />