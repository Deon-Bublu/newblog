// Entry point for the build script in your package.json
import Rails from "@rails/ujs"
import TurboLinks from "turbolinks"
import '../styles/_custom.scss'

import '@popperjs/core'
import 'bootstrap/js/dist/dropdown'
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
TurboLinks.start()
ActiveStorage.start()