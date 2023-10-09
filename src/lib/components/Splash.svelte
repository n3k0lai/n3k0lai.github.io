<script lang=ts>
    export let header = 'n3k0lai';
    export let subheader = '';
</script>

<div class="splash waves 
            flex flex-col md:flex-row-reverse 
            md:justify-end md:items-end 
            items-stretch justify-stretch">
    <h1 class="grow flex self-center justify-center align-middle text-6xl">
        {header}
    </h1>
    <div class="cat md:grow aspect-square sticky top-0"></div>
</div>

<style>
    .splash {
        height: 100vh;
        width:100%;
        position:relative;
        overflow: hidden;
        transition: 350ms ease;
        font-family: 'brushking' sans-serif;
    }

    .cat {
        background-image: url(/assets/cat.png);
        background-repeat: no-repeat;
        background-size: contain;
        background-position: center;
    }

    @media (max-width: 768px) {
        .splash {
            height: 50vh;
        }
    }
</style>