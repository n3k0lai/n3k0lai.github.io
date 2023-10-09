<script>
	import Nav from './Nav.svelte'
	import Hamburger from './Hamburger.svelte'
	import { siteTitle } from '$lib/config'

	const focusMain = () => {
		const main = document.querySelector('main');
		if (main)
            main.focus();
	}
</script>


<header class="h-20 w-screen waves sticky top-0 z-100">
	<div class="md:container mx-auto flex">
		<a on:click|preventDefault={focusMain} 
		class="skip-to-content-link 
				absolute 
				-top-24 left-0 h-12 p-2 
				opacity-0 
				flex justify-center items-center" 
		href="#main">
			Skip to main content
		</a>
		
		<a href="/" class="h-full flex items-center">
			<span class="cat h-20 w-20 block"></span>
			<span class="title">{siteTitle}</span>
		</a>
		
		<Hamburger />
		<Nav />
	</div>
</header>
<style>
.title {
    font-family: 'Brush King';
    font-weight: normal;
    font-style: normal;
	font-size: 2rem;
	color: var(--base2);
}
.cat {
	background-image: url(/assets/cat.png);
	background-repeat: no-repeat;
	background-size: contain;
	background-position: center bottom;
}
.skip-to-content-link:focus {
    transform: translateY(6rem);
    opacity: 1;
    z-index: 11;
}
</style>