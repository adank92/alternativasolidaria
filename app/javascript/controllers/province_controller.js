import { Controller } from "stimulus"

export default class extends Controller {
    static targets = [ "provinceId", "localityId" ]

    findLocalities() {
    fetch(this.data.get('locationsUrl')+"?province_id="+this.provinceIdTarget.value)
        .then(response => response.text())
        .then(html => {
            this.localityIdTarget.innerHTML = html
            $(this.localityIdTarget).selectpicker('refresh');
        })
    }
}
