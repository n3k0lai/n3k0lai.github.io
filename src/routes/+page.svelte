<script>
    import Splash from '$lib/components/Splash.svelte';
    import Archive from '$lib/components/Archive.svelte';
	import { siteTitle } from '$lib/config';
</script>
<svelte:head>
	<title>{siteTitle}</title>
</svelte:head>
<Archive></Archive>
<div class="test" style="height:200vh"></div>