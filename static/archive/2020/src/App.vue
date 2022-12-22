<template>
  <div class="app">
    <splash></splash>
    <div class="content">
      <div class="content-body">
        <p>
          I am a full stack developer who has been programming for 9 years, and working professionally for 5 years. I love javascript and building fun web applications with it. Check out my <a target="_self" href="https://glitch.com/@CatLover91">Glitch account</a> to see my demo-able projects, or if you wish to go deep into my project history you can check out my <a target="_self" href="https://github.com/catlover91">Github account</a>.
        </p>
        <skills></skills>
        <contact></contact>
        <archive></archive>
      </div>
    </div>  
  </div>
</template>
<script>
import splash from './components/Splash.vue'
import skills from './components/Skills.vue'
import contact from './components/Contact.vue'
import archive from './components/Archive.vue'

export default {
  name: 'App',
  components: {
    splash,
    skills,
    contact,
    archive
  }
}
</script>
<style lang="scss">
  @import "./_mixins";
  @import url('https://fonts.googleapis.com/css?family=Roboto+Mono:400,700|Roboto:700i,900i&display=swap');
  * {
    box-sizing: border-box;
    position: relative;
  }
  html, body {
    margin: 0;
  }
  body {
    font-family: 'Roboto Mono', monospace;
    overflow-x:hidden;
    color: $text-color;
    background: $bg-color;
    //@if $dark-mode {
    //  background-image: url(https://cdn.glitch.com/5242e461-8ea0-4183-a040-73c9aae33634%2F7f0ff9b8-7bbb-474d-8078-5b7f262e5ed3_stardust.png?v=1568497926221);
    //  background-repeat: repeat;
    //}
  }
  .content {
    width: 100%;
    padding: 0 20px;
    &-body {
      width: 100%;
      margin: 0 auto;
      max-width: 800px;
    }
  }
  h1 {
    font-family: 'Roboto', sans-serif;
    
  }
  h2 {
    font-family: 'Roboto', sans-serif;
    width: 100%;
    margin: 20px 0;
    border-bottom: 1px dotted $accent-color;
    font-style: italic;
  }
  a {
    cursor: pointer;
    text-decoration: none;
    color: inherit;
    @include fancy-button();
  }
</style>