//
//  SearchViewController.swift
//  Merk2
//
//  Created Adrian Jacobo on 13/10/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.


import UIKit
import MapKit
import Alamofire

class SearchViewController: UIViewController, CLLocationManagerDelegate, SearchViewProtocol, MKMapViewDelegate {

    @IBOutlet weak var textsearch: UITextField!
    @IBOutlet weak var mapsearch: MKMapView!
    var presenter: SearchPresenterProtocol?
    var locationManager : CLLocationManager?
    private let rangeInMeters: Double = 500

	override func viewDidLoad() {
        super.viewDidLoad()
        locationManager = CLLocationManager()
        locationManager?.requestWhenInUseAuthorization()
        locationManager?.delegate = self
        locationManager?.distanceFilter = kCLDistanceFilterNone
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        mapsearch.showsUserLocation = true
        locationManager?.startUpdatingLocation()
        centerViewOnUser()
    }

    func botonsearch(_ sender: Any) {
        
    }
     
    private func centerViewOnUser() {
        guard let location = locationManager?.location?.coordinate else { return }
        let coordinateRegion = MKCoordinateRegion.init(center: location,
                                                       latitudinalMeters: rangeInMeters,
                                                       longitudinalMeters: rangeInMeters)
        mapsearch.setRegion(coordinateRegion, animated: true)
    }
}
