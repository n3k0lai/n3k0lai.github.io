<script lang=ts>
	import { postsPerPage } from '$lib/config';

	export let currentPage: number;
	export let totalPosts: number;
	export let path = '/blog/page';
	
	let pagesAvailable: number;
	$: pagesAvailable = Math.ceil(totalPosts / postsPerPage);

	const isCurrentPage = (page: number) => page == currentPage;
</script>

<!-- For some reason, the pagination wasn't re-rendering properly during navigation without the #key block -->
{#key currentPage}
	{#if pagesAvailable > 1}
		<nav aria-label="Pagination navigation mx-4 my-0" class="pagination">
			<ul class="flex flex-wrap justify-start gap-2 m-0 p-0 list-none">
				{#each Array.from({length: pagesAvailable}, (_, i) => i + 1) as page}
					<li class="m-0">
						<a href="{path}/{page}" 
                           aria-current="{isCurrentPage(page)}"
                           class="flex justify-center items-center w-8 h-8 font-bold leading-none no-underline">
							<span class="sr-only">
								{#if isCurrentPage(page)}
									Current page: 
								{:else}
									Go to page 
								{/if}
							</span>
							{page}
						</a>
					</li>
				{/each}
			</ul>
		</nav>
	{/if}
{/key}

<style>
a {
    background: var(--lightAccent);
    font-family: var(--primaryFont);
    transition: background .1s;

}
a:hover {
    background: var(--accent);
    color: var(--background);
}

a[aria-current="true"] {
    background: var(--accent);
    color: var(--background);
    border: 1px solid currentColor;
}
</style>