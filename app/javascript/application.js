// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import '@primer/view-components'

// Delegated-events or custom elements would be good for this.
const tabContainers = document.querySelectorAll('.js-previewable-comment-form');
for (const container of tabContainers) {
  container.addEventListener('tab-container-change', async event => {
    if (!event.detail.relatedTarget.classList.contains('js-preview-panel')) return

    const previewContainer = event.detail.relatedTarget.querySelector('.js-preview-body');

    const text = container.querySelector('[name="comment[body]"]').value;
    const url = container.getAttribute('data-preview-url')
    const response = await fetch(url, {method: 'POST', body: text})
    const html = await response.text()
    if (html) {
      previewContainer.innerHTML = html
    }
  })
}

// TODO: Replace this with Turbo Streams
const commentForms = document.querySelectorAll('.js-new-comment-form');
for (const form of commentForms) {
  form.addEventListener('turbo:submit-end', async event => {
    window.location.reload()
  })
}
