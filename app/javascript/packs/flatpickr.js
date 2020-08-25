require("flatpickr/dist/flatpickr.css");
import flatpickr from "flatpickr"
import { Japanese } from "flatpickr/dist/l10n/ja.js"
flatpickr.localize(Japanese);

document.addEventListener("turbolinks:load", () => {
  flatpickr("[data-behavior=flatpickr", {
    enableTime: true,
    dateFormat: "Y-m-d H:i",
    disable: [
      function(date) {
        return (date.getDay() === 0);
      }
    ],
    minDate: "today",
    minuteIncrement: 30,
    maxTime: "17:30",
    minTime: "10:00",
  })
})
