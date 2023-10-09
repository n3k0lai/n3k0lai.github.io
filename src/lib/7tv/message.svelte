<script>
    import User from './user.svelte'
    export let handle = 'n3k0lai';
</script>
<div>
    <User handle="{handle}"></User>
    <slot>This is a default message</slot>
</div>