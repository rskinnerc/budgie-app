import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['alertMessage', 'noticeMessage']
  static values = {
    alertMessage: { type: String, default: '' },
    noticeMessage: { type: String, default: '' }
  }

  connect() {
    this.alertMessageValue != '' && this.alertMessageTarget.classList.remove('hidden')
    this.noticeMessageValue != '' && this.noticeMessageTarget.classList.remove('hidden')
    this.fadeOutCounter()
  }

  fadeOutCounter() {
    setTimeout(() => {
      this.alertMessageTarget.classList.add('hidden')
      this.noticeMessageTarget.classList.add('hidden')
    }, 3000);
  }
}
