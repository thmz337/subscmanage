import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  initialize() {
    this.selectedItem = null;
  }

  fill(event) {
    let params = null;

    const subscription_service_price = document.getElementById(
      "subscription_service_price",
    );
    const service_payment_interval = document.getElementById(
      "subscription_service_payment_interval",
    );
    const service_payment_unit = document.getElementById(
      "subscription_service_payment_unit",
    );
    const service_monetary_unit = document.getElementById(
      "subscription_service_monetary_unit",
    );

    if (event.type === "click") {
      params = event.params;
    } else if (event.type === "keydown" && event.key === "Enter") {
      if (this.selectedItem) {
        params = JSON.parse(
          this.selectedItem.getAttribute("data-preset-service-param"),
        );
      }
    }

    if (params) {
      subscription_service_price.value = params.service.price;
      service_payment_interval.value = params.service.payment_interval;
      service_payment_unit.value = params.service.payment_unit;
      service_monetary_unit.value = params.service.monetary_unit;
    }
  }

  select() {
    // stimulus-autocomplete
    this.selectedItem = document.querySelector("[aria-selected='true']");
  }
}
