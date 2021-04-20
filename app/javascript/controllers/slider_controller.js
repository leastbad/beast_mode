import { Controller } from 'stimulus'
import noUiSlider from 'nouislider'

export default class extends Controller {
  static values = { min: Number, max: Number }
  static targets = ['input', 'element']

  connect () {
    this.slider = noUiSlider.create(this.elementTarget, {
      start: this.inputTarget.value,
      connect: [true, false],
      step: 1,
      range: {
        min: this.minValue,
        max: this.maxValue
      }
    })
    this.slider.on('update', (a, b, c) => {
      const target = this.inputTarget
      if (parseInt(target.value) === c[0]) return
      target.value = c[0]
      target.dispatchEvent(new CustomEvent('change', { bubbles: true }))
    })
  }

  disconnect () {
    this.slider.destroy()
  }
}
