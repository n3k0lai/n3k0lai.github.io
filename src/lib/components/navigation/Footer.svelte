<script>
	import { siteAuthor } from '$lib/config'
    import Social from '../Social.svelte';
</script>

<footer class="md:container mx-auto grid grid-rows-2 items-stretch">

    <div class="p-8 gap-8 grid items-stretch grid-cols-5 text-center">
        <a href="/api/rss.xml" data-sveltekit-reload>RSS</a>
        <a href="/contact">Contact</a>
        <Social type={1} />
        <Social type={2} />
        <Social type={3} />
    </div>

	<p class="m-0 text-sm text-center">
        &copy;{new Date().getFullYear()} {siteAuthor}
    </p>
</footer>
