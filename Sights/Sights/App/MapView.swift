//
//  MapView.swift
//  Sights
//
//  Created by alex on 2022/10/8.
//

import SwiftUI
import MapKit

struct MapView: View {
    //MARK: - Properties
    @State private var region: MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 30.555624612131368, longitude: 114.30381222526006)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 25.0, longitudeDelta: 25.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        
        return mapRegion
    }()
    
    let locations: [PlaceLocation] = Bundle.main.decode("locations.json")
    
    // 2. 高级地图 自定义高级标注
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: locations) { item in
            MapAnnotation(coordinate: item.location) {
                MapAnnotationView(location: item)
            }
        }
        .overlay(
            HStack(alignment: .center, spacing: 12) {
                Image("Logo").resizable().scaledToFit().frame(width: 48, height: 48, alignment: .center)
                
                VStack(alignment: .leading, spacing: 3) {
                    HStack {
                        Text("经度：").font(.footnote).fontWeight(.bold).foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.latitude)").font(.footnote).foregroundColor(.white)
                    } //: HStack
                    Divider()
                    HStack {
                        Text("纬度：").font(.footnote).fontWeight(.bold).foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.longitude)").font(.footnote).foregroundColor(.white)
                    } //: HStack
                } //: VStack
            } //: HStack
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            .background(
                Color.black.cornerRadius(8).opacity(0.6)).padding(),
                alignment: .top
            )
    }
    
    // 1. 基础地图, `Pin`-老旧的风格
    /*
    var body: some View {
        Map(coordinateRegion: $region)
    }
     */
     
    // 2. 高级地图, `Pin`-老旧的风格
    /*
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: locations) { item in
            MapPin(coordinate: item.location, tint: .accentColor)
        }
    }
     */
    
    // 2. 高级地图, `Marker`-崭新的风格
    /*
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: locations) { item in
            MapMarker(coordinate: item.location, tint: .accentColor)
        }
    }
     */
}

//struct MapView_Previews: PreviewProvider {
//    static var previews: some View {
//        MapView()
//    }
//}
