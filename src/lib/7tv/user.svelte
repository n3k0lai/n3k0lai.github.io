<script lang="ts">
    import SevenTvApiClient from "./7tv";
    import type { User } from "./user";
    export let handle = 'n3k0lai';
    let user: User = await SevenTvApiClient.getUser(handle);
</script>

<div>

</div>