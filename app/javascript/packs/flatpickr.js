require("flatpickr/dist/flatpickr.css");
import flatpickr from "flatpickr"
import { Japanese } from "flatpickr/dist/l10n/ja.js"
flatpickr.localize(Japanese);

document.addEventListener("turbolinks:load", () => {
  flatpickr("[data-behavior=flatpickr", {
    enableTime: true,
    dateFormat: "Y-m-d H:i",
    minDate: "today",
    minuteIncrement: 30
  })
})
