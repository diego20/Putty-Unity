//
//  TestTwoViewController.swift
//  PruebaUnity
//
//  Created by Diego Farfán on 3/20/17.
//  Copyright © 2017 Diego Farfán. All rights reserved.
//

import UIKit

class TestTwoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Vista de Swift Bitches")
        self.getMyVista()
        
        // Do any additional setup after loading the view.
    }
    
    func getMyVista() {
        let connect: ConnectionToAppDelegate = ConnectionToAppDelegate()
        let view: UIView = connect.getVista()
        self.view.addSubview(view)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
