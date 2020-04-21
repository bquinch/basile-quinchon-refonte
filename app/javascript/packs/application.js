require("@rails/activestorage").start()
require("channels")

import "bootstrap";
import AOS from 'aos';
import 'aos/dist/aos.css';
import { navToggle } from '../plugins/nav_toggle';
import { initRellax } from "plugins/rellax.js";

// NAVBAR ANIMATION
navToggle();

//RELLAX INIT
if (document.querySelector('.rellax')) {
  initRellax();
};

// ANIMATE ON SCROLL INIT
AOS.init();
