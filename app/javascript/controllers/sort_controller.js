import { Controller } from 'stimulus'

export default class extends Controller {
  initialize () {
    this.columns = this.element.querySelectorAll('[data-filter]')
  }

  connect () {
    this.columns.forEach(c => c.addEventListener('click', this.click))
  }

  disconnect () {
    this.columns.forEach(c => c.removeEventListener('click', this.click))
  }

  click = e => {
    this.columns.forEach(c => {
      const link = c.dataset
      const icon = c.querySelector('span').classList
      if (c.isSameNode(e.target) || c == e.target.parentNode) {
        icon.remove('d-none')
        if (link.direction === 'asc') {
          link.direction = 'desc'
          icon.replace('fa-chevron-down', 'fa-chevron-up')
        } else {
          link.direction = 'asc'
          icon.replace('fa-chevron-up', 'fa-chevron-down')
        }
      } else {
        link.direction = 'desc'
        icon.add('d-none')
      }
    })
  }
}
