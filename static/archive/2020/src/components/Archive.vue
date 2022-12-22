<template>
  <div class="archive">
    <h2>Archive</h2>
    <p>Check out how my web portfolio has evolved through the years:</p>
    <div class="archive-cont">
      <a target="_self" href="/archive/2018">2018</a>          
      <a target="_self" href="/archive/2017">2017</a>
      <a target="_self" href="/archive/2016">2016</a>
      <a target="_self" href="/archive/2015">2015</a>
    </div>
  </div>
</template>
<script>
export default {
  name: 'archive'
}
</script>
<style lang="scss" scoped>
  @import "../_variables";
  
  .archive-cont {
    margin-bottom: 20px;
    a + a {
      margin-left: 10px;
    }  
  }
</style>