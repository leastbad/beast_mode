// Load all the controllers within this directory and all subdirectories.
// Controller files must be named *_controller.js.

import { Application } from 'stimulus'
import { definitionsFromContext } from 'stimulus/webpack-helpers'
import StimulusReflex from 'stimulus_reflex'
import consumer from '../channels/consumer'
import controller from '../controllers/application_controller'

const app = require.context('controllers', true, /_controller\.js$/)

const application = Application.start()
application.load(definitionsFromContext(app))
application.consumer = consumer

StimulusReflex.initialize(application, {
  controller,
  debug: true,
  isolate: true
})
