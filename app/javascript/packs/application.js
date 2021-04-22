import 'stylesheets/fonts.scss'
import bootstrap from 'bootstrap/dist/js/bootstrap.bundle'
import { annotate, annotationGroup } from 'rough-notation'
import '@fortawesome/fontawesome-free/js/solid'
import 'controllers'
import debounced from 'debounced'

debounced.initialize()

setTimeout(() => {
  const modal = new bootstrap.Modal(document.getElementById('modal'))
  modal.show()
  setTimeout(() => {
    const e1 = document.querySelector('#e1')
    const a1 = annotate(e1, {
      type: 'highlight',
      color: 'yellow',
      animationDuration: 1500
    })
    const a2 = annotate(document.querySelector('#e2'), {
      type: 'crossed-off',
      color: 'red',
      iterations: 1
    })
    const a3 = annotate(document.querySelector('#e3'), {
      type: 'underline',
      color: 'blue',
      animationDuration: 1500
    })
    const ag = annotationGroup([a1, a2, a3])
    e1.style.color = 'black'
    ag.show()
  }, 500)
}, 500)
