require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
//= require flatpickr
import "bootstrap";
import "../stylesheets/application";
import "@fortawesome/fontawesome-free/js/all";
import flatpickr from 'flatpickr';
import 'flatpickr/dist/themes/material_blue.css';
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";

//flatpickr
document.addEventListener("turbolinks:load", () => {
    flatpickr("[data-behaviour='flatpickr'], #start_date", {
        altInput: true,
        enableTime: true,
        minDate: "today",
        "plugins": [new rangePlugin({
            input: "#end_date"
        })]
    })
})

//navbar
$(function() {
    $(document).scroll(function() {
        var $nav = $(".navbar-fixed-top");
        $nav.toggleClass('scrolled', $(this).scrollTop() > $nav.height());
    });
});