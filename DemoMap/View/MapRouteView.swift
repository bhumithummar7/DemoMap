//
//  MapRouteView.swift
//  DemoMap
//
//  Created by Bhumi Thummar on 17/07/25.
//

import SwiftUI
import MapKit

struct MapRouteView: UIViewRepresentable {
    @Binding var currentLocation: CLLocation?
    var destination: CLLocationCoordinate2D

    private let mapView = MKMapView()

    func makeUIView(context: Context) -> MKMapView {
        mapView.showsUserLocation = true
        mapView.delegate = context.coordinator
        return mapView
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        guard let sourceCoordinate = currentLocation?.coordinate else { return }
        
        let sourcePlacemark = MKPlacemark(coordinate: sourceCoordinate)
        let destinationPlacemark = MKPlacemark(coordinate: destination)
        
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: sourcePlacemark)
        request.destination = MKMapItem(placemark: destinationPlacemark)
        request.transportType = .automobile
        request.requestsAlternateRoutes = false
        
        // ✅ Avoid options
        request.tollPreference = .avoid
        request.highwayPreference = .avoid
        
        let directions = MKDirections(request: request)
        directions.calculate { response, error in
            guard let response = response else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }

            for route in response.routes {
//                print("Route distance: \(route.distance / 1000) km")
//                print("Expected travel time: \(route.expectedTravelTime / 60) mins")
                
                // You can draw this route on map:
                mapView.addOverlay(route.polyline)
            }
//            self.directionSteps = response.routes.first?.steps.filter { !$0.instructions.isEmpty } ?? []
//            for direction in (response.routes.first?.steps.filter { !$0.instructions.isEmpty } ?? []) {
//                print("direction: \(direction.instructions)")
//            }
            // Optionally zoom to the first route
            if let firstRoute = response.routes.first {
                mapView.setVisibleMapRect(firstRoute.polyline.boundingMapRect, edgePadding: UIEdgeInsets(top: 50, left: 20, bottom: 50, right: 20), animated: true)
            }
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapRouteView

        init(_ parent: MapRouteView) {
            self.parent = parent
        }

        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            let renderer = MKPolylineRenderer(overlay: overlay)
            renderer.strokeColor = .systemBlue
            renderer.lineWidth = 8
            return renderer
        }
    }
}
