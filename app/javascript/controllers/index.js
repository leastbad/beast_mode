import { Application } from '@hotwired/stimulus'
import StimulusReflex from 'stimulus_reflex'
import consumer from '../channels/consumer'
import controller from './application_controller'
import DropdownController from './dropdown_controller'
import RangeSliderController from './range_slider_controller'
import SelectController from './select_controller'
import SortController from './sort_controller'

const application = Application.start()
application.register('dropdown', DropdownController)
application.register('range-slider', RangeSliderController)
application.register('select', SelectController)
application.register('sort', SortController)
application.consumer = consumer

StimulusReflex.initialize(application, {
  controller,
  debug: true,
  isolate: true
})
