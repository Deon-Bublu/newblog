// Entry point for the build script in your package.json
import Rails from "@rails/ujs"
import TurboLinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import '@popperjs/core'
import 'bootstrap/js/dist/dropdown'

Rails.start()
TurboLinks.start()
ActiveStorage.start()
