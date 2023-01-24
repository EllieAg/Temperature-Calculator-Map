//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Elena Agina on 9/13/22.


import UIKit
// import MapKit
import MapKit

class MapViewController: UIViewController {
    
    // create an instance of MKMapView
    var mapView: MKMapView!
    
    // override loadView
    override func loadView() {
        // create a map view
        mapView = MKMapView()
        
        // set it as *the* view of this view controller
        view = mapView
        
        let standardString = NSLocalizedString("Standard", comment: "Standard map view")
        
        let hybridString = NSLocalizedString("Hybrid", comment: "Hybrid map view")
        
        let satelliteString = NSLocalizedString("Satellite", comment: "Sattelite map view")
        
        let segmentedControl = UISegmentedControl(items: [standardString, hybridString, satelliteString])
        
        segmentedControl.backgroundColor = UIColor.systemBackground
        
        segmentedControl.selectedSegmentIndex = 0
        
        segmentedControl.addTarget(self, action: #selector(mapTypeChanged(_:)), for: .valueChanged)
        
        // add a target-action pair to the segmented controller
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(segmentedControl)
        
        // add constraints
        
        // let topConstraint = segmentedControl.topAnchor.constraint(equalTo: view.topAnchor)
        
        let topConstraint = segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8)
        
        // let leadingConstraints = segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        
        // let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        let margins = view.layoutMarginsGuide
        
        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        
        let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        
        // activate constrains
        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
        
    } // end loadView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("MapViewController loaded its view.")
    } // end viewDidLoad
    
    @objc func mapTypeChanged(_ segControl: UISegmentedControl) {
        
        switch segControl.selectedSegmentIndex {
            
        case 0:
            
            mapView.mapType = .standard
            
        case 1:
            
            mapView.mapType = .hybrid
            
        case 2:
            
            mapView.mapType = .satellite
            
        default:
            break
            
        } // end switch
        
    } // end mapTypeChanged
    
} // end of class
