//
//  QrViewController.swift
//  PLINCAFE
//
//  Created by Artem Galiev on 29.09.2023.
//

import UIKit

class QrViewController: UIViewController {

    @IBOutlet weak var qrView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        qrView.layer.cornerRadius = 15
        // Do any additional setup after loading the view.
    }

    @IBAction func onBackButtonClick(_ sender: Any) {
        navigationController?.popViewController(animated: true)
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
