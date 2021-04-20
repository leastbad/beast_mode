import { Controller } from 'stimulus'
import bootstrap from 'bootstrap/dist/js/bootstrap.bundle'

export default class extends Controller {
  initialize () {
    this.anchors = this.element.querySelectorAll('a')
    this.dropdown = new bootstrap.Dropdown(this.element.querySelector('button'))
  }

  connect () {
    this.anchors.forEach(a => a.addEventListener('click', this.click))
  }

  disconnect () {
    this.anchors.forEach(a => a.removeEventListener('click', this.click))
  }

  click = e => {
    if (e.target.nodeName !== 'A') return
    this.anchors.forEach(a => {
      a.querySelector('.icon').classList[
        a.isSameNode(e.target) ? 'remove' : 'add'
      ]('d-none')
    })
    this.dropdown.hide()
  }
}
