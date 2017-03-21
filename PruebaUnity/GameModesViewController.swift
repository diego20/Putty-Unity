//
//  GameModesViewController.swift
//  JuegoMovilesiOS
//
//  Created by Diego Farfán on 3/3/17.
//  Copyright © 2017 Diego Farfán. All rights reserved.
//

import UIKit

class GameModesViewController: UIViewController {

    @IBAction func distraccionButton(_ sender: Any) {
        self.performSegue(withIdentifier: "gotoPuttyView", sender: nil)
    }
    @IBAction func interaccionButton(_ sender: Any) {
        self.performSegue(withIdentifier: "gotoPuttyView", sender: nil)
    }
    @IBAction func juegoButton(_ sender: Any) {
        self.performSegue(withIdentifier: "gotoPuttyView", sender: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ViewController: ViewDidLoad")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print("ViewController: DidReceiveMemoryWarning")
        // Dispose of any resources that can be recreated.
    }
    
    //override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    //}

}
