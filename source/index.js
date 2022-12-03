"use strict";
(function() {

  window.addEventListener("load", init);
  /*
    initalizing scrolling effects from laxxx.js
    this code is not mine, it is taken directly from the documentation and is
    necessary in order for the animations to work
    code has been reformatted to meet code quality guidelines in this class
  */
  function init() {
    lax.setup() // init

    const updateLax = () => {
      lax.update(window.scrollY)
      window.requestAnimationFrame(updateLax)
    }

    window.requestAnimationFrame(updateLax)
  }
})();