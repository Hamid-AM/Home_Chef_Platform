import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl' // Don't forget this!

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      center: [2.3522, 48.8566],
      zoom: 6,
      style: "mapbox://styles/mapbox/streets-v10"
    })

    this.#addMarkersToMap()

    // NOTE : le changement de display none > block du contenur n'est pas reconnu par Stimulus après le chargement de la page
    // Ajout d'un observer pour surveiller la visibilité du contenur
    const observer = new IntersectionObserver((entries) => {
    if (entries[0].isIntersecting) {
      this.map.resize();
    }
  });

  observer.observe(this.element);
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window_html)
      new mapboxgl.Marker({
        color: marker.color || "#FE8F00"
    })
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(this.map)
    })
  }

}
