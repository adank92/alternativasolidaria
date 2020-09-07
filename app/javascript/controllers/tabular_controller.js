import ApplicationController from './application_controller'
import { debounce } from 'lodash-es'

export default class extends ApplicationController {
    connect() {
        super.connect()
        this.search = debounce(this.search, 500)
    }

    search(event) {
        this.stimulate('Tabular#submit', event.target)
    }
}
