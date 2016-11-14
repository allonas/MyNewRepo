//
//  DatasourceFilter.swift
//  DemoNov
//
//  This App has been generated using IBM Mobile UI Builder
//

import Foundation
import CoreLocation

protocol DatasourceFilter {

    func create(field: String, string: String?) -> StringFilter?
    
    func create(field: String, stringList: [String]) -> StringListFilter?
    
    func create(field: String, number: NSNumber?) -> NumberFilter?
    
    func create(field: String, dateMin: NSDate?, dateMax: NSDate?) -> DateRangeFilter?
}

protocol DatasourceGeoFilter {

    func create(field: String, neCorrd: CLLocationCoordinate2D, swCoord: CLLocationCoordinate2D) -> GeoBoundingBoxFilter?
    
    func create(field: String, coord: CLLocationCoordinate2D) -> GeoNearFilter?
}

public protocol Filter {

    var field: String! { get set }
    var value: AnyObject? { get }
    
    func filter() -> String?
}

protocol StringFilter : Filter {

    var string: String? { get set }
}

protocol StringListFilter : Filter {

    var list: [String]? { get set }
}

protocol NumberFilter : Filter {
    
    var number: NSNumber? { get set }
}

protocol DateRangeFilter : Filter {
    
    var dateMin: NSDate? { get set }
    var dateMax: NSDate? { get set }
}

protocol GeoBoundingBoxFilter : Filter {
    
    var neCoord: CLLocationCoordinate2D? { get set }
    var swCoord: CLLocationCoordinate2D? { get set }
}

protocol GeoNearFilter : Filter {
    
    var coord: CLLocationCoordinate2D? { get set }
}