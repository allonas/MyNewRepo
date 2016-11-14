//
//  AnnotationItem.swift
//  DemoNov
//
//  This App has been generated using IBM Mobile UI Builder
//

import MapKit

public class Annotation: MKPointAnnotation {

    var item: AnyObject?
    
    override init() {
        super.init()
    }
    
    init(item: AnyObject?, geoPoint: GeoPoint?) {
        
        super.init()
        self.item = item
        if let coord = geoPoint?.coordinate {
            coordinate = CLLocationCoordinate2DMake(coord.latitude, coord.longitude)
        }
    }
}