import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  initialize() {
    this.selectedItem = null;
  }

  fill(event) {
    const subscription_service_price = document.getElementById(
      "subscription_service_price",
    );
    const service_payment_interval = document.getElementById(
      "subscription_service_payment_interval",
    );
    const service_payment_unit = document.getElementById(
      "subscription_service_payment_unit",
    );

    if (event.type === "click") {
      subscription_service_price.value = event.params.service.price;
      service_payment_interval.value = event.params.service.payment_interval;
      service_payment_unit.value = event.params.service.payment_unit;
    } else if (event.type === "keydown" && event.key === "Enter") {
      if (this.selectedItem) {
        const params = JSON.parse(
          this.selectedItem.getAttribute("data-preset-service-param"),
        );
        subscription_service_price.value = params.price;
        service_payment_interval.value = params.payment_interval;
        service_payment_unit.value = params.payment_unit;
      }
    }
  }

  select() {
    // stimulus-autocomplete
    this.selectedItem = document.querySelector("[aria-selected='true']");
  }
}
