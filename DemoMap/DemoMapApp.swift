//
//  DemoMapApp.swift
//  DemoMap
//
//  Created by Bhumi Thummar on 03/07/25.
//

import SwiftUI

@main
struct DemoMapApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
//struct StaticRouteMapView: UIViewRepresentable {
//    func makeUIView(context: Context) -> MKMapView {
//        let mapView = MKMapView()
//
//        let sourceCoordinate = CLLocationCoordinate2D(latitude: 40.7128, longitude: -74.0060) // NYC
//        let destinationCoordinate = CLLocationCoordinate2D(latitude: 40.6895, longitude: -74.1745) // Newark
//
//        let sourcePlacemark = MKPlacemark(coordinate: sourceCoordinate)
//        let destinationPlacemark = MKPlacemark(coordinate: destinationCoordinate)
//
//        let directionRequest = MKDirections.Request()
//        directionRequest.source = MKMapItem(placemark: sourcePlacemark)
//        directionRequest.destination = MKMapItem(placemark: destinationPlacemark)
//        directionRequest.transportType = .automobile
//
//        let directions = MKDirections(request: directionRequest)
//        directions.calculate { response, error in
//            guard let route = response?.routes.first else { return }
//            mapView.addOverlay(route.polyline)
//            mapView.setVisibleMapRect(route.polyline.boundingMapRect,
//                                      edgePadding: UIEdgeInsets(top: 50, left: 50, bottom: 300, right: 50),
//                                      animated: true)
//        }
//
//        mapView.delegate = context.coordinator
//        return mapView
//    }
//
//    func updateUIView(_ uiView: MKMapView, context: Context) {}
//
//    func makeCoordinator() -> Coordinator {
//        Coordinator()
//    }
//
//    class Coordinator: NSObject, MKMapViewDelegate {
//        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
//            if let polyline = overlay as? MKPolyline {
//                let renderer = MKPolylineRenderer(polyline: polyline)
//                renderer.strokeColor = .systemBlue
//                renderer.lineWidth = 5
//                return renderer
//            }
//            return MKOverlayRenderer()
//        }
//    }
//}
