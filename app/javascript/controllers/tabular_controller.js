import ApplicationController from './application_controller'
import { debounce } from 'lodash-es'

export default class extends ApplicationController {
    static targets = [ "search" ]

    connect() {
        super.connect()
        this.search = debounce(this.search, 500)
    }

    search(event) {
        this.stimulate('Tabular#search', event.target)
    }

    clean(event) {
        this.searchTarget.value = ''
        this.stimulate('Tabular#clean', event.target)
    }
}
