// app/javascript/packs/application.js

import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';

import { initMapbox } from '../packs/init_mapbox';
import { showReviews } from '../packs/show_reviews';

initMapbox();
showReviews();
