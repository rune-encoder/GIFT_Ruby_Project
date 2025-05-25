import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.applyStoredTheme()
  }

  toggle() {
    const isDark = document.getElementById("root").classList.toggle("dark")
    localStorage.setItem("darkMode", JSON.stringify(isDark))
    
    // Let dropdown controller update the icon/label
    this.dispatch("changed", { detail: { dark: isDark } })
  }

  applyStoredTheme() {
    const prefersDark = window.matchMedia("(prefers-color-scheme: dark)").matches
    const saved = JSON.parse(localStorage.getItem("darkMode"))
    const isDark = saved !== null ? saved : prefersDark

    document.getElementById("root").classList.toggle("dark", isDark)
    this.dispatch("changed", { detail: { dark: isDark } })
  }
}
