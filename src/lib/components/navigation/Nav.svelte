<script>
	import { navItems } from '$lib/config'
	import { isMenuOpen } from '$lib/assets/ts/store'
	import NavItem from './NavItem.svelte'
	import Hamburger from './Hamburger.svelte'
</script>

<!-- Contents of this file will be used in the header and the responsive hamburger menu. -->
<nav class="main-nav 
            z-2 w-full h-20
            flex flex-col justify-center 
            transition-all duration-250 ease-in-out 
            transform -translate-x-full 
            opacity-0 md:opacity-100 md:translate-x-0 md:translate-y-0" 
     class:open={$isMenuOpen}>
	<div class="flex 
             flex-wrap md:flex-nowrap 
             md:justify-start md:items-center 
             p-0 m-0">
		{#each navItems as page}
		<NavItem href={page.route}>
			{page.title}
		</NavItem>
		{/each}
	</div>
	<Hamburger closeOnly={true} />
</nav>

<style>
.main-nav {
	color: var(--base2);
}
.main-nav.open {
  transform: translateX(0);
  opacity: 1;
  pointer-events: unset;
  visibility: unset;
}


/*
.main-nav.open li {
  opacity: 0;
  animation: slide_in_left 0.2s cubic-bezier(0.215, 0.610, 0.355, 1) forwards;
}

.main-nav.open li a {
  color: inherit;
}
@for $i from 1 through 8 {
  .main-nav.open li:nth-of-type(#{$i}) {
    animation-delay: 0.15s + $i * 0.05s;
  }

@media (min-width: 526px) {
  .main-nav {
    opacity: 1;
    transform: none;
    position: unset;
    height: auto;
    width: auto;
    background: unset;
    pointer-events: unset;
    visibility: unset;
    color: inherit;
  }

  .main-nav ul {
    margin: 1rem auto 0;
    padding-top: 0.5rem;
    border-top: 1px solid var(--dark);
    width: max-content;
  }

  .main-nav ul li {
    font-size: inherit;
    display: initial;
    width: initial;
    text-align: initial;
    margin-bottom: 0;
  }
}
}*/
</style>