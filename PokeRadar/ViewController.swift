//
//  ViewController.swift
//  PokeRadar
//
//  Created by David Garcia on 1/4/18.
//  Copyright © 2018 David Garcia. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func reportPokemon(_ sender: UIButton) {
    }
    
}

