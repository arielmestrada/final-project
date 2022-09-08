import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    show() {
        const commentFormId = this.element.closest(".card").id
        console.log("meow")
    }
}