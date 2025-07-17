//
//  ContentView.swift
//  DemoMap
//
//  Created by Bhumi Thummar on 03/07/25.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @StateObject private var locationManager = LocationManager()
    @State private var directionSteps: [MKRoute.Step] = []

    // Set your destination coordinate here
    let destination = CLLocationCoordinate2D(latitude: 21.2111, longitude: 72.8630) // San Francisco, for example

    var body: some View {
        ZStack {
            if let _ = locationManager.currentLocation {
                MapRouteView(currentLocation: $locationManager.currentLocation, destination: destination)
                    .edgesIgnoringSafeArea(.all)
            } else {
                Text("Locating...")
            }
        }
    }
}

#Preview {
    ContentView()
}
