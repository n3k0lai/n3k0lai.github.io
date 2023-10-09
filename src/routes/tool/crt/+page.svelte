<div class="crt fixed left-0 top-0 w-full h-full">
    <iframe title="null"
            class="bg absolute left-0 top-0 w-full h-full"
            scrolling="no"
            frameborder="0" 
            src="https://www.shadertoy.com/embed/slSfWd?gui=false&t=10&paused=false&muted=true" 
            allowfullscreen>
    </iframe>
</div>

<script>
    // retrieve zoom level from query string
    let zoom = 1;
    let tailwindZoomClasses = ['transform', 'transform-origin'];    
    if (location.search) {
        const match = location.search.match(/zoom=(\d+)/);
        if (match) zoom = +match[1];
    }
    
    console.log('zoom factor: ' + zoom);
    
    // apply zoom level to crt
    tailwindZoomClasses.push(`scale-${zoom}`);

    console.log('zoom classes: scale-' + zoom);
</script>

<style>
    .crt {
        transform: scale(4);
        transform-origin: 0 250px;
    }
    .bg {
        /*tint pink*/
        filter: hue-rotate(180deg) saturate(200%) brightness(1.5);
        pointer-events: none;
    }
</style>