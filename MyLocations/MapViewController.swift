import UIKit
import MapKit
import CoreData

class MapViewController: UIViewController {
  var locations = [Location]()
  var managedObjectContext: NSManagedObjectContext!
  
  @IBOutlet weak var mapView: MKMapView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    updateLocations()
  }
  
  @IBAction func showUser() {
    let region = MKCoordinateRegionMakeWithDistance(
                              mapView.userLocation.coordinate, 1000, 1000)
    mapView.setRegion(mapView.regionThatFits(region), animated: true)
  }
  
  @IBAction func showLocations() {
    
  }
  
  func updateLocations() {
    mapView.removeAnnotations(locations)
    
    let entity = Location.entity()
    
    let fetchRequest = NSFetchRequest<Location>()
    fetchRequest.entity = entity
    
    locations = try! managedObjectContext.fetch(fetchRequest)
    mapView.addAnnotations(locations)
  }
}

extension MapViewController: MKMapViewDelegate {
  
}
