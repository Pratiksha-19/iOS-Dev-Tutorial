//
//  WelcomeVC.swift
//  IOS Development Tutorial - Figma
//
//  Created by Pratiksha Katyayni on 04/03/25.
//

import UIKit

class WelcomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func getStartedClicked(_ sender: UIButton) {
        let incidentVC = IncidentViewController()
        // Creating instance of IncidentViewController
        navigationController?.pushViewController(incidentVC, animated: true) // Push to next screen
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
