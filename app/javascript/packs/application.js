require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()

import "bootstrap";
import AOS from 'aos';
import 'aos/dist/aos.css';
import { navToggle } from '../plugins/nav_toggle';
import { scrollSite } from '../plugins/scroll_site';
import { initRellax } from "plugins/rellax.js";

document.addEventListener('turbolinks:load', () => {
  // JQUERY GLOBAL $ FOR AJAX
  global.$ = jQuery;
  // WELCOME MESSAGE
  console.log('%c%s',
              "color: #FFF; background: #f2a365; font-size: 24px; padding: .5rem; font-family: 'courier'; text-align: center;",
              'Greetings !');

  console.log('%c%s',
              "color: #FFF; background: #333; font-family: 'courier'; padding: .25rem;",
              "If you like what you see, feel free to follow me on\nhttps://www.github.com/basilequinchon");
  // NAVBAR ANIMATION
  navToggle();

  // SCROLL ON SITES
  scrollSite();

  //RELLAX INIT
  if (document.querySelector('.rellax')) {
    initRellax();
  };

  // ANIMATE ON SCROLL INIT
  AOS.init();
});
