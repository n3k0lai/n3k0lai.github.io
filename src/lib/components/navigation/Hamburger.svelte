<script lang=ts>
	import { isMenuOpen } from '$lib/assets/ts/store';

	export let closeOnly = false;

	const toggleIsMenuOpen = () => {
		isMenuOpen.set(!$isMenuOpen);
	}
</script>

<button on:click={toggleIsMenuOpen}
	    aria-pressed={$isMenuOpen}
	    class="menu-button m-0 p-0 w-8 border-0 
			   bg-transparent absolute 
			   top-8 right-8"
	    tabindex={($isMenuOpen || !closeOnly) ? 0 : -1}>
	<span class="sr-only">Toggle hamburger menu</span>
	{#if closeOnly}
        <svg class="fill-current" viewBox="0 0 128 128" version="1.1" style="fill-rule:evenodd;clip-rule:evenodd;stroke-linejoin:round;stroke-miterlimit:2;"><path d="M64,48.496l-48.496,-48.496l-15.504,15.504l48.496,48.496l-48.496,48.496l15.504,15.504l48.496,-48.496l48.496,48.496l15.504,-15.504l-48.496,-48.496l48.496,-48.496l-15.504,-15.504l-48.496,48.496Z"/></svg>
	{:else}
    <svg class="fill-current" viewBox="0 0 128 128" version="1.1" style="fill-rule:evenodd;clip-rule:evenodd;stroke-linejoin:round;stroke-miterlimit:2;"><g><rect x="0" y="12.48" width="128" height="18.688"/></g><g><rect x="0" y="96.832" width="128" height="18.688"/></g><g><rect x="0" y="54.656" width="128" height="18.688"/></g></svg>
	    {/if}
</button>

<style>
    
.menu-button {
  color: inherit;
}

@media (min-width: 526px) {
  .menu-button {
    display: none;
  }
}
</style>