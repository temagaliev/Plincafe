//
//  MenuViewController.swift
//  PLINCAFE
//
//  Created by Artem Galiev on 28.09.2023.
//

import UIKit

class MenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.setNavigationBarHidden(true, animated: true)
        
    }
    @IBAction func alcoAction(_ sender: Any) {
        navigationController?.pushViewController(CocktailsViewController(isAlco: true), animated: true)
    }
    
    @IBAction func onNonAlcoButtonClick(_ sender: Any) {
        navigationController?.pushViewController(CocktailsViewController(isAlco: false), animated: true)
    }

    @IBAction func qrCodeButtonClick(_ sender: Any) {
        navigationController?.pushViewController(QrViewController(), animated: true)
    }
}


