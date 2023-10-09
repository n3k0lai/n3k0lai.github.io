<script>
    export let name = '7tv';
    //export let modifiers = [];
    let wide = false;
    let emote = {
        name: '7tv',
        type: 1,
        url: 'https://cdn.7tv.app/emote/5f1e0d2a0f8b602acc5c3e7f/3x'
    }
</script>
<div class="emote">
    <!-- image -->
    {#if emote.type === 1}
        <img src={emote.url} alt={emote.name} />
    {:else} <!-- video -->
        <video src={emote.url} autoplay loop muted></video>
    {/if}

</div>

