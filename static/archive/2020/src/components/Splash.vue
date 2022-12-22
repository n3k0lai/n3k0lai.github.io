<template>
  <div class="splash">
    <div class="splash-cont">
      <div class="splash-image"></div>
      <div class="splash-content">
        <h1>Nicholai Goodall</h1>
        <div :class="{holster: true, intro: intro}">
          <div class="holster__label">
            Full Stack 
          </div>
          <div class="trickshot">
            Developer
            <svg ref="wiggle">
              <g>    
                <line id="line" x1="0" x2="100%" />
                <polyline ref="wave" />
              </g>  
            </svg>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
  export default {
    name: 'splash',
    data() {
      return {
        intro: false,
      }
    },
    mounted() {
      setTimeout(() => {
        this.intro = true
      }, 1000)
    },
    methods: {
    }
  }
</script>
<style lang="scss" scoped>
  @import "../_variables";
  .splash {
    width: 100%;
    position: relative;
    height: 100vh;
    max-height: 700px;
    background: #000;
    @media (min-width:$mobile) {
      max-height: 500px;
    }
    &-cont {
      width: 100%;
      height: 100%;
      max-width: 800px;
      position: relative;
      margin: 0 auto;
    }
    &-image {
      position: absolute;
      bottom: 0;
      left: 0;
      background-repeat: no-repeat;
      background-size: cover;
      background-position: bottom right;
      background-image: url(https://cdn.glitch.com/5242e461-8ea0-4183-a040-73c9aae33634%2Fnicholai-full.jpg?v=1567091324338);
      width: 66%;
      height: 100%;
      max-height: 700px;
      &:after {
        content: '';
        position: absolute;
        bottom: 0;
        left: 0;
        height: 20%;
        width: 100%;
        background: linear-gradient(to top, black, transparent);
      }
      @media (min-width:$mobile) {
        max-height: 400px;
        width: 50%;
        background-image: url(https://cdn.glitch.com/5242e461-8ea0-4183-a040-73c9aae33634%2Fnicholai.jpg?v=1567091318733);
        background-size: contain;
      }
    }
    &-content {
      position: absolute;
      bottom: 0;
      right: 0;
      color: #fff;
      height: 100%;
      width: 66%;
      max-height: 600px;
      text-align: right;
      padding-right: 20px;
      @media (min-width: $mobile) {
        max-height: 400px;
      }
      h1 {
        font-weight: 900;
        font-style: italic;
        font-size: 50px;
        
        
      }
      .holster {
        font-size: 2em;
        &__label {
          white-space: nowrap;
        }
        .trickshot {
          max-width: 195px;
          position: relative;
          display: inline-block;
          transition: color $transition-time;
          z-index: 1;
          svg {
            display: block;
            position: absolute;
            background-color: $accent-color;
            width: 0;
            height: .2rem;
            bottom: 0;//.1em;
            z-index: -1;
            transition: $transition;
            polyline {
              fill: none;
              stroke-width: 4;
              stroke-linecap: round;
              stroke-linejoin: round;
              stroke: $accent-color;
            }
          }
        }
        &.intro svg {
          width: 100%;
        }
      }
      
      
      
    }
  }
</style>