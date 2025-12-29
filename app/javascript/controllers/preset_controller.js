import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
	fill({ params: { service: { price, payment_interval, payment_unit } } }) {
		document.getElementById("subscription_service_price").value = price
		document.getElementById("subscription_service_payment_interval").value = payment_interval
		document.getElementById("subscription_service_payment_unit").value = payment_unit
	}
}
