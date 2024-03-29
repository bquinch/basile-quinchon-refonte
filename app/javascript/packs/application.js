require("@rails/ujs").start()
require("@rails/activestorage").start()
require("@hotwired/turbo-rails")

import "bootstrap";
import { navToggle } from '../plugins/nav_toggle';
import { scrollSite } from '../plugins/scroll_site';
import init from './init_react.tsx'

document.addEventListener('turbo:load', () => {
  // JQUERY GLOBAL $ FOR AJAX
  global.$ = jQuery;
  // WELCOME MESSAGE
  console.log('%c%s',
              "color: #FFF; background: #f2a365; font-size: 24px; padding: .5rem; font-family: 'courier'; text-align: center;",
              'Greetings !');

  console.log('%c%s',
              "color: #FFF; background: #333; font-family: 'courier'; padding: .25rem;",
              "If you like what you see, feel free to follow me on\nhttps://www.github.com/bquinch");
  // NAVBAR ANIMATION
  navToggle();

  // SCROLL ON SITES
  scrollSite();

  // REACT
  if (document.getElementById("root")) {
    init()
  }
});

import "controllers"
