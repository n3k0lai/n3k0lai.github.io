<script>
    let streak = 0;
    let daily = false;
    let loading = true;
    let error = false;
    // get profile json from duolingo api
    fetch('https://www.duolingo.com/2017-06-30/users/n3k0lai')
        .then(response => response.json())
        .then(data => {
            // do something with your data
            console.log('duolingo res', data);

            streak = data.streak;
            daily = data.hasRecentActivity15;
            loading = false;
        })
        .catch(err => {
            // handle error
            console.log('duolingo err', err);
            error = true;
        });
</script>

<div class="duolingo">

    <h2 class="streak">
        {streak}
    </h2>

    <div class="error" class:show={error}>
        <p>Something went wrong.</p>
    </div>

</div>