<script lang=ts>
	import { currentPage, isMenuOpen } from '$lib/assets/ts/store'

	export let href: string;

	$: isCurrentPage = $currentPage.startsWith(href)

	const maybeCloseMenu = () => {
		if (href != $currentPage) {
			isMenuOpen.set(false)
		}
	}
</script>


<a href={href}
   class="flex justify-center items-center w-full"
   on:click={maybeCloseMenu}
   class:active={isCurrentPage}
   aria-current={isCurrentPage ? 'page' : false}>
	<slot />
</a>
