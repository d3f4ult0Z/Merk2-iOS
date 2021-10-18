//
//  SearchViewController.swift
//  Merk2
//
//  Created Adrian Jacobo on 13/10/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.


import UIKit
import MapKit

class SearchViewController: UIViewController, CLLocationManagerDelegate, SearchViewProtocol, MKMapViewDelegate {

    @IBOutlet weak var textsearch: UITextField!
    @IBOutlet weak var mapsearch: MKMapView!
    var presenter: SearchPresenterProtocol?
    var locationManager : CLLocationManager?
//

	override func viewDidLoad() {
        super.viewDidLoad()
        
   
        }
        func botonsearch(_ sender: Any) {
        
    }
    
}
