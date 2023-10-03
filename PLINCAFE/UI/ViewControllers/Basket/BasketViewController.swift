//
//  BasketViewController.swift
//  PLINCAFE
//
//  Created by Artem Galiev on 29.09.2023.
//

import UIKit

class BasketViewController: UIViewController {
    
    private let cockteilList = CockteilList()
        
    private var cockteilsArray: [Cockteil] = []
    
    private var deleteItemFromButtonTag: Int = 0

    var cocktailTableView = UITableView()
    
    let viewCustom: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let imageBackground: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: NameImage.bg.rawValue)
        return image
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Basket"
        label.font = UIFont(name: "RacingSansOne-Regular", size: 23)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    var arrayBas: [Cockteil] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(true, animated: true)

        cockteilsArray = cockteilList.allCockteilsArray
        
        self.cocktailTableView = UITableView(frame: view.frame, style: .plain)
        cocktailTableView.register(UINib(nibName: "CockteilTableViewCell", bundle: nil), forCellReuseIdentifier: "cockteil")
        cocktailTableView.translatesAutoresizingMaskIntoConstraints = false
        self.cocktailTableView.delegate = self
        self.cocktailTableView.dataSource = self
        
        cocktailTableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        cocktailTableView.backgroundColor = .clear
        
        view.addSubview(imageBackground)
        view.addSubview(cocktailTableView)
        view.addSubview(viewCustom)
        viewCustom.addSubview(nameLabel)
        
        imageBackground.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        imageBackground.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        imageBackground.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        imageBackground.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        
        viewCustom.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        viewCustom.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        viewCustom.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        viewCustom.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        cocktailTableView.topAnchor.constraint(equalTo: viewCustom.bottomAnchor).isActive = true
        cocktailTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        cocktailTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        cocktailTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        
        nameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 60).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -60).isActive = true
        nameLabel.topAnchor.constraint(equalTo: viewCustom.topAnchor, constant: 16).isActive = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        arrayBas = []
        if let array = UserDefaults.standard.object(forKey: "bas") {
            let arrayInt = array as! [Int]
            if arrayInt.count != 0 {
                for i in 0...arrayInt.count - 1 {
                    for j in 0...cockteilsArray.count - 1 {
                        if arrayInt[i] == cockteilsArray[j].id {
                            arrayBas.append(cockteilsArray[j])
                        }
                    }
                }
            }
        }
        cocktailTableView.reloadData()
    }
}

extension BasketViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayBas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cockteil", for: indexPath) as? CockteilTableViewCell {
            let item = arrayBas[indexPath.row]
            cell.refreshCockteils(model: item)
            cell.favoriteButton.setImage(UIImage(named: NameImage.closeB.rawValue), for: .normal)
            cell.favoriteButton.addTarget(self, action: #selector(onCloseButtonClick), for: .touchUpInside)
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            cell.backgroundColor = .clear
            cell.priceButton.tag = indexPath.row
            cell.favoriteButton.tag = indexPath.row

            return cell
        } else {
            return UITableViewCell()
        }
        
    }
    
    @objc func onCloseButtonClick(button: UIButton) {
        let buttonTag = button.tag

        arrayBas.remove(at: buttonTag)
        UserDefaults.standard.set(arrayBas.map{$0.id}, forKey: "bas")
        UserDefaults.standard.synchronize()
        cocktailTableView.reloadData()
        
    }
        
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
