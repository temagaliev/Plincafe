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
        navigationController?.pushViewController(CocktailsViewController(), animated: true)
    }
    
    @IBAction func onNonAlcoButtonClick(_ sender: Any) {
        navigationController?.pushViewController(CocktailsViewController(), animated: true)
    }

    @IBAction func qrCodeButtonClick(_ sender: Any) {
        navigationController?.pushViewController(QrViewController(), animated: true)
    }
}
//мейн скрин контроллер
//дезайн система
//таб бар

//шоу менй скрин копирую
//выкидываю все не нужное таб бар вью контрллер
//апп делегат майн скрин и из роутера нужные методы
//менй скрин нужен контейнер и таб бар
//стек вью не использовать использовать uivuew

