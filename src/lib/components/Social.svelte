<script lang=ts>
	import { twitterUrl, twitchUrl, githubUrl } from '$lib/config';
    const enum socialMediaType {
        twitter = 1,
        twitch = 2,
        github = 3,
    }
    export let type: socialMediaType;
    
    let socialMap: {
        type: socialMediaType,
        url: string,
        icon: string,
    }[] = [{
        type: socialMediaType.twitter,
        url: twitterUrl,
        icon: 'twitter',
    },
    {
        type: socialMediaType.twitch,
        url: twitchUrl,
        icon: 'twitch',
    },
    {
        type: socialMediaType.github,
        url: githubUrl,
        icon: 'github',
    }];
    let conf = socialMap[type - 1];
</script>

<a href="{conf.url}"
   target="_blank">

   {conf.icon}
</a>