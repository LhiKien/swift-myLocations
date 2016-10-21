import Foundation
import CoreData
import MapKit


class Location: NSManagedObject, MKAnnotation {
  var coordinate: CLLocationCoordinate2D {
    return CLLocationCoordinate2DMake(latitude, longitude)
  }
  
  var title: String? {
    if locationDescription.isEmpty {
      return "(No Description)"
    } else {
      return locationDescription
    }
  }
  
  var subtitle: String? {
    return category
  }
}
