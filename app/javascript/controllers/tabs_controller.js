import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tabs"
export default class extends Controller {
  static targets = [ "tab", "content" ]
  static values = { open: String }
  static classes = ["visibility", "open", "closed"]
  connect() {
    document.getElementById(this.openValue).classList.toggle(this.visibilityClass)
    const activeTab = this.tabTargets.find(tab => tab.dataset.content === this.openValue)
    activeTab.classList.remove(this.closedClass)
    activeTab.classList.add(this.openClass)
  }

  open(event) {
    this.tabTargets.forEach((tab)=>{
      tab.classList.remove(this.openClass)
      tab.classList.add(this.closedClass)
    })

    event.target.classList.add(this.openClass)
    event.target.classList.remove(this.closedClass)

    document.getElementById(this.openValue).classList.toggle(this.visibilityClass)

    document.getElementById(event.target.dataset.content).classList.toggle(this.visibilityClass)
    this.openValue = event.target.dataset.content
  }
}
