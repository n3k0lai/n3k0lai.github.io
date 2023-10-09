<script lang=ts>
    // this throws cors errors when run from client
    // will need an api endpoint to proxy the request
    let streak = 0;
    let daily = false;
    let loading = true;
    let error = false;
    // get profile json from duolingo api
    fetch('https://www.duolingo.com/api/1/users/show?id=665942326')
        .then(response => response.ok ? response.json() : Promise.reject(response))
        .then(data => {
            // do something with your data
            console.log('[n3k0] - duolingo res', data);

            streak = data.streak;
            daily = data.hasRecentActivity15;
            loading = false;
        })
        .catch(err => {
            // handle error
            console.error('[n3k0] - duolingo err', err);
            error = true;
        });
</script>

<h2 class="streak">
    {streak}
</h2>

<div class="error" class:show={error}>
    <p>Duolingo failed to load</p>
</div>