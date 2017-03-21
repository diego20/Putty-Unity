//
//  SecondView.swift
//  JuegoMovilesiOS
//
//  Created by Diego Farfán on 18/02/17.
//  Copyright © 2017 Diego Farfán. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {


    @IBAction func respuesta1(_ sender: Any) {
        gotoGameModes()
    }
    @IBAction func respuesta2(_ sender: Any) {
        gotoGameModes()
    }
    @IBAction func respuesta3(_ sender: Any) {
        gotoGameModes()
    }


    @IBOutlet weak var gotoOptions: UIBarButtonItem!
    @IBOutlet weak var navTitle: UINavigationItem!
    var texto: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        print("ViewController: ViewDidLoad")
        if (texto) != nil {
            self.navTitle.title = "Bienvenido " + texto!
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print("ViewController: DidReceiveMemoryWarning")
        // Dispose of any resources that can be recreated.
    }
    
    func gotoGameModes() {
        performSegue(withIdentifier: "gotoGameModes", sender: nil)
    }
}
