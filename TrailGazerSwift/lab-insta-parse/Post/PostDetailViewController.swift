//
//  PostDetailViewController.swift
//  TrailGazer
//
//  Created by Sebastian Barnes on 3/31/24.
//

import UIKit
import MapKit

class PostDetailViewController: UIViewController {
    var location: CLLocation?
    var post: Post?

    @IBOutlet weak var detailMapView: MKMapView!

   
    override func viewDidLoad() {
        super.viewDidLoad()

        if let location = location {
            let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
            detailMapView.setRegion(region, animated: true)

            let annotation = MKPointAnnotation()
            annotation.coordinate = location.coordinate
            detailMapView.addAnnotation(annotation)
        }
    }
}
