<p align="center">
  <img src="./static/assets/pfp.gif" width="350"/>
</p>
<h1 align="center">My personal website and blog</h1>
<p align="center">written in svelte</p>

If you think I am cool, you should totally [follow me on twitter](https://twitter.com/n3k0lai) and [twitch](https://twitch.tv/n3k0lai).


The Project
------------
Blog renderer: `/src/routes/blog` and `/src/routes/blog[slug]`
7tv svelte integration: `/src/lib/7tv`
Portfolio archive: `/static/archive/`


## Developing

Once you've created a project and installed dependencies with `npm install` (or `pnpm install` or `yarn`), start a development server:

```bash
npm run dev

# or start the server and open the app in a new browser tab
npm run dev -- --open
```

## Building

To create a production version of your app:

```bash
npm run build
```

You can preview the production build with `npm run preview`.

> To deploy your app, you may need to install an [adapter](https://kit.svelte.dev/docs/adapters) for your target environment.
