import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["dropdownMenu", "dropdownToggleIcon", "themeIcon", "themeLabel"]

  connect() {
    this.dropdownMenuTarget.classList.add("hidden")
    this.dropdownToggleIconTarget.classList.add("fa-chevron-down")
  }

  toggle() {
    this.dropdownMenuTarget.classList.toggle("hidden")
    this.dropdownToggleIconTarget.classList.toggle("fa-chevron-up")
    this.dropdownToggleIconTarget.classList.toggle("fa-chevron-down")
  }

  updateTheme(event) {
    const isDark = event.detail.dark

    if (this.hasThemeIconTarget) {
      this.themeIconTarget.className = isDark
        ? "fa-solid fa-sun"
        : "fa-solid fa-moon"
    }

    if (this.hasThemeLabelTarget) {
      this.themeLabelTarget.textContent = isDark ? "Light Mode" : "Dark Mode"
    }
  }
}
