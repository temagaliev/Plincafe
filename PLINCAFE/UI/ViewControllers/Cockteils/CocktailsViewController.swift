//
//  CocktailsViewController.swift
//  PLINCAFE
//
//  Created by Artem Galiev on 28.09.2023.
//

import UIKit

class CocktailsViewController: UIViewController {
    
    var cocktailTableView = UITableView()
    
    private var isAlco: Bool = false
    // MARK: - init
    init(isAlco: Bool) {
        super.init(nibName: nil, bundle: nil)
        self.isAlco = isAlco
    }
        
    required init?(coder aDecoder: NSCoder) {
        fatalError("Never will happen")
    }
    
    private let cockteilList = CockteilList()
    
    private var cockteilsArray: [Cockteil] = []
    private var nonAlcoCockteilsArray: [Cockteil] = []
    
//    var addElementFavDelegate: FavoriteControllerDelegate?
    
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
        label.text = "Alcoholic"
        label.font = UIFont(name: "RacingSansOne-Regular", size: 23)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    let backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: NameImage.backButton.rawValue), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        cockteilsArray = cockteilList.cockteilsArray
        nonAlcoCockteilsArray = cockteilList.nonAlcoCockteilsArray
        
        self.cocktailTableView = UITableView(frame: view.frame, style: .plain)
        cocktailTableView.register(UINib(nibName: "CockteilTableViewCell", bundle: nil), forCellReuseIdentifier: "cockteil")
        cocktailTableView.translatesAutoresizingMaskIntoConstraints = false
        self.cocktailTableView.delegate = self
        self.cocktailTableView.dataSource = self
        
        cocktailTableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        cocktailTableView.backgroundColor = .clear
        
        setupTopBar()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        cocktailTableView.reloadData()
    }
    
    private func setupTopBar() {
        
        backButton.addTarget(self, action: #selector(onBackButtonClick), for: .touchUpInside)
        
        view.addSubview(imageBackground)
        view.addSubview(cocktailTableView)
        view.addSubview(viewCustom)
        viewCustom.addSubview(nameLabel)
        viewCustom.addSubview(backButton)
        
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
        
        backButton.leftAnchor.constraint(equalTo: viewCustom.leftAnchor, constant: 16).isActive = true
        backButton.topAnchor.constraint(equalTo: viewCustom.topAnchor, constant: 8).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        nameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 60).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -60).isActive = true
        nameLabel.topAnchor.constraint(equalTo: viewCustom.topAnchor, constant: 16).isActive = true
        
        if isAlco == true {
            nameLabel.text = "Alcoholic"
        } else {
            nameLabel.text = "Non-Alcoholic"
        }
    }
    
    @objc func onBackButtonClick() {
        navigationController?.popViewController(animated: true)
    }
}

extension CocktailsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isAlco == true {
            return cockteilsArray.count
        } else {
            return nonAlcoCockteilsArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cockteil", for: indexPath) as? CockteilTableViewCell {
            var item = cockteilsArray[indexPath.row]
            var isFavorite: Bool = false
            var isBasket: Bool = false

            if isAlco == true {
                item = cockteilsArray[indexPath.row]
                if let array = UserDefaults.standard.object(forKey: "fav") {
                    let arrayInt = array as! [Int]
                    if arrayInt.count != 0 {
                        for i in 0...arrayInt.count - 1 {
                            if cockteilsArray[indexPath.row].id == arrayInt[i] {
                                isFavorite = true
                            }
                        }
                    }
                }
                if let array = UserDefaults.standard.object(forKey: "bas") {
                    let arrayInt = array as! [Int]
                    if arrayInt.count != 0 {
                        for i in 0...arrayInt.count - 1 {
                            if cockteilsArray[indexPath.row].id == arrayInt[i] {
                                isBasket = true
                            }
                        }
                    }
                }

            } else {
                item = nonAlcoCockteilsArray[indexPath.row]
                if let array = UserDefaults.standard.object(forKey: "fav") {
                    let arrayInt = array as! [Int]
                    if arrayInt.count != 0 {
                        for i in 0...arrayInt.count - 1 {
                            if nonAlcoCockteilsArray[indexPath.row].id == arrayInt[i] {
                                isFavorite = true
                            }
                        }
                    }
                }
                if let array = UserDefaults.standard.object(forKey: "bas") {
                    let arrayInt = array as! [Int]
                    if arrayInt.count != 0 {
                        for i in 0...arrayInt.count - 1 {
                            if nonAlcoCockteilsArray[indexPath.row].id == arrayInt[i] {
                                isBasket = true
                            }
                        }
                    }
                }
            }
            cell.refreshCockteils(model: item)
            cell.backgroundColor = .clear
            cell.favoriteButton.addTarget(self, action: #selector(onFavoriteButtonClick), for: .touchUpInside)
            cell.favoriteButton.tag = indexPath.row
            cell.priceButton.addTarget(self, action: #selector(onPriceButtonClick), for: .touchUpInside)
            cell.priceButton.tag = indexPath.row
            cell.selectionStyle = UITableViewCell.SelectionStyle.none

            
            if isFavorite {
                cell.favoriteButton.setImage(UIImage(named: NameImage.favoriteActive.rawValue), for: .normal)
            } else {
                cell.favoriteButton.setImage(UIImage(named: NameImage.favoriteInactive.rawValue), for: .normal)
            }
            
            if isBasket {
                cell.priceButton.setImage(UIImage(named: NameImage.selectPriceView.rawValue), for: .normal)
            } else {
                cell.priceButton.setImage(UIImage(named: NameImage.priceView.rawValue), for: .normal)
            }
            
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    @objc func onFavoriteButtonClick(button: UIButton) {
        let buttonTag = button.tag
        var isFavorite: Bool = false
        if isAlco == true {
            if let array = UserDefaults.standard.object(forKey: "fav") {
                let arrayInt = array as! [Int]
                if arrayInt.count != 0 {
                    for i in 0...arrayInt.count - 1 {
                        if cockteilsArray[buttonTag].id == arrayInt[i] {
                            isFavorite = true
                        }
                    }
                }
            }
            if isFavorite == true {
                button.setImage(UIImage(named: NameImage.favoriteInactive.rawValue), for: .normal)
                
                if let arrayCock = UserDefaults.standard.object(forKey: "fav")  {
                    var arrayCockteil = arrayCock as! [Int]
                    for i in 0...arrayCockteil.count - 1 {
                        if arrayCockteil[i] == cockteilsArray[buttonTag].id {
                            arrayCockteil.remove(at: i)
                            UserDefaults.standard.set(arrayCockteil, forKey: "fav")
                            UserDefaults.standard.synchronize()
                            break
                        }
                    }
                    print(arrayCockteil)
                }
                
            } else {
                button.setImage(UIImage(named: NameImage.favoriteActive.rawValue), for: .normal)
//                addElementFavDelegate?.addElementInArrayFavorites(element: cockteilsArray[buttonTag])
                if let arrayCock = UserDefaults.standard.object(forKey: "fav")  {
                    var arrayCockteil = arrayCock as! [Int]
                    arrayCockteil.append(cockteilsArray[buttonTag].id)
                    print(arrayCockteil)
                    UserDefaults.standard.set(arrayCockteil, forKey: "fav")
                } else {
                    var array: [Int] = []
                    array.append(cockteilsArray[buttonTag].id)
                    print(array)
                    UserDefaults.standard.set(array, forKey: "fav")
                    UserDefaults.standard.synchronize()
                }
            }
        } else {
            //nonalco
            if let array = UserDefaults.standard.object(forKey: "fav") {
                let arrayInt = array as! [Int]
                if arrayInt.count != 0 {
                    for i in 0...arrayInt.count - 1 {
                        if nonAlcoCockteilsArray[buttonTag].id == arrayInt[i] {
                            isFavorite = true
                        }
                    }
                }
            }
            if isFavorite == true {
                button.setImage(UIImage(named: NameImage.favoriteInactive.rawValue), for: .normal)
                
                if let arrayCock = UserDefaults.standard.object(forKey: "fav")  {
                    var arrayCockteil = arrayCock as! [Int]
                    for i in 0...arrayCockteil.count - 1 {
                        if arrayCockteil[i] == nonAlcoCockteilsArray[buttonTag].id {
                            arrayCockteil.remove(at: i)
                            UserDefaults.standard.set(arrayCockteil, forKey: "fav")
                            UserDefaults.standard.synchronize()
                            break
                        }
                    }
                    print(arrayCockteil)
                }
                
            } else {
                button.setImage(UIImage(named: NameImage.favoriteActive.rawValue), for: .normal)
//                addElementFavDelegate?.addElementInArrayFavorites(element: cockteilsArray[buttonTag])
                if let arrayCock = UserDefaults.standard.object(forKey: "fav")  {
                    var arrayCockteil = arrayCock as! [Int]
                    arrayCockteil.append(nonAlcoCockteilsArray[buttonTag].id)
                    print(arrayCockteil)
                    UserDefaults.standard.set(arrayCockteil, forKey: "fav")
                } else {
                    var array: [Int] = []
                    array.append(nonAlcoCockteilsArray[buttonTag].id)
                    print(array)
                    UserDefaults.standard.set(array, forKey: "fav")
                    UserDefaults.standard.synchronize()
                }
            }
        }
    }
    
    @objc func onPriceButtonClick(button: UIButton) {
        let buttonTag = button.tag
        var isBaskt: Bool = false
        if isAlco == true {
            if let array = UserDefaults.standard.object(forKey: "bas") {
                let arrayInt = array as! [Int]
                if arrayInt.count != 0 {
                    for i in 0...arrayInt.count - 1 {
                        if cockteilsArray[buttonTag].id == arrayInt[i] {
                            isBaskt = true
                        }
                    }
                }
            }
            if isBaskt == true {
                button.setImage(UIImage(named: NameImage.priceView.rawValue), for: .normal)

                if let arrayCock = UserDefaults.standard.object(forKey: "bas")  {
                    var arrayCockteil = arrayCock as! [Int]
                    for i in 0...arrayCockteil.count - 1 {
                        if arrayCockteil[i] == cockteilsArray[buttonTag].id {
                            arrayCockteil.remove(at: i)
                            UserDefaults.standard.set(arrayCockteil, forKey: "bas")
                            UserDefaults.standard.synchronize()
                            break
                        }
                    }
                    print(arrayCockteil)
                }
                
            } else {
                button.setImage(UIImage(named: NameImage.selectPriceView.rawValue), for: .normal)
                if let arrayCock = UserDefaults.standard.object(forKey: "bas")  {
                    var arrayCockteil = arrayCock as! [Int]
                    arrayCockteil.append(cockteilsArray[buttonTag].id)
                    print(arrayCockteil)
                    UserDefaults.standard.set(arrayCockteil, forKey: "bas")
                } else {
                    var array: [Int] = []
                    array.append(cockteilsArray[buttonTag].id)
                    print(array)
                    UserDefaults.standard.set(array, forKey: "bas")
                    UserDefaults.standard.synchronize()
                }
            }
        } else {
            //nonalco
            if let array = UserDefaults.standard.object(forKey: "bas") {
                let arrayInt = array as! [Int]
                if arrayInt.count != 0 {
                    for i in 0...arrayInt.count - 1 {
                        if nonAlcoCockteilsArray[buttonTag].id == arrayInt[i] {
                            isBaskt = true
                        }
                    }
                }
            }
            if isBaskt == true {
                button.setImage(UIImage(named: NameImage.priceView.rawValue), for: .normal)

                if let arrayCock = UserDefaults.standard.object(forKey: "bas")  {
                    var arrayCockteil = arrayCock as! [Int]
                    for i in 0...arrayCockteil.count - 1 {
                        if arrayCockteil[i] == nonAlcoCockteilsArray[buttonTag].id {
                            arrayCockteil.remove(at: i)
                            UserDefaults.standard.set(arrayCockteil, forKey: "bas")
                            UserDefaults.standard.synchronize()
                            break
                        }
                    }
                    print(arrayCockteil)
                }
                
            } else {
                button.setImage(UIImage(named: NameImage.selectPriceView.rawValue), for: .normal)
                if let arrayCock = UserDefaults.standard.object(forKey: "bas")  {
                    var arrayCockteil = arrayCock as! [Int]
                    arrayCockteil.append(nonAlcoCockteilsArray[buttonTag].id)
                    print(arrayCockteil)
                    UserDefaults.standard.set(arrayCockteil, forKey: "bas")
                } else {
                    var array: [Int] = []
                    array.append(nonAlcoCockteilsArray[buttonTag].id)
                    print(array)
                    UserDefaults.standard.set(array, forKey: "bas")
                    UserDefaults.standard.synchronize()
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    
}
