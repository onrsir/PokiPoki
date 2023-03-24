//
//  FavroritesViewController.swift
//  PokedexApp
//
//  Created by Onur Sir on 22.03.2023.
//

import UIKit
import VerticalCardSwiper

class FavoritesViewController: UIViewController, VerticalCardSwiperDatasource {
    
    var mainViewModel                : MainViewModel = MainViewModel()
    let viewModel                    = DetailViewModel()
    var onComplete                   : ( () -> Void )?
    let localDB                      = LocalDatabaseManager()
    var listOfBookmarks              : [DetailPokemon] = []
    private var cardSwiper           : VerticalCardSwiper!

    
    
    func setImage(pokeId: Int) -> String {
        var imageUrl   = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(pokeId).png"
        return imageUrl
    }
    
    
    func numberOfCards(verticalCardSwiperView: VerticalCardSwiperView) -> Int {
        if !listOfBookmarks.isEmpty {
            return listOfBookmarks.count
        } else {
            return 0
        }
    }
    func cardForItemAt(verticalCardSwiperView: VerticalCardSwiperView, cardForItemAt index: Int) -> CardCell {
        if let cardCell = verticalCardSwiperView.dequeueReusableCell(withReuseIdentifier: "SwipeCell", for:index) as? SwipeCell {
            
            cardCell.swCardImage.kf.setImage(with: URL(string: setImage(pokeId: listOfBookmarks[index].id)))
            cardCell.swIdLabel.text              = String("#\(listOfBookmarks[index].id)")
            cardCell.swTitleLabel.text           = listOfBookmarks[index].name
            if let type = listOfBookmarks[index].types.first?.type.name {
                let backgroundColor = UIColor(named: type)
                cardCell.swBackgroundView.backgroundColor = backgroundColor
            }

            let backgroundColorString = listOfBookmarks[index].types[0].type.name
            guard let backgroundColor = UIColor(named: backgroundColorString) else { return CardCell() }
            cardCell.swBackgroundView.backgroundColor = backgroundColor

         
            return cardCell 
        }
        return CardCell()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = UIColor.systemPink
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]

        setFavList()
        setCardSwiper()
        cardSwiper.delegate = self
        cardSwiper.datasource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
         setFavList()
        cardSwiper.reloadData()
//         myTableView.reloadData()
    }
    func setFavList() {
         listOfBookmarks      = LocalDatabaseManager.getAllObjects
    }
    
    func setCardSwiper() {

        cardSwiper = VerticalCardSwiper(frame: view.frame)
        view.addSubview(cardSwiper)
        cardSwiper.firstItemTransform = 0.14
        cardSwiper.topInset = 120
        cardSwiper.cardSpacing = 20
        cardSwiper.stackedCardsCount = 3
        cardSwiper.datasource = self
        cardSwiper.register(nib: UINib(nibName: "SwipeCell", bundle: nil), forCellWithReuseIdentifier: "SwipeCell")
    }
   
}

extension FavoritesViewController: VerticalCardSwiperDelegate {
    func sizeForItem(verticalCardSwiperView: VerticalCardSwiperView, index: Int) -> CGSize {
        return CGSize(width: verticalCardSwiperView.frame.width * 0.75, height: verticalCardSwiperView.frame.height * 0.7)

    }
    
    func didSwipeCardAway(card: CardCell, index: Int, swipeDirection: SwipeDirection) {
        cardSwiper.deleteCards(at: [index])
        self.listOfBookmarks.remove(at: index)
        LocalDatabaseManager.saveAllObjects(allObjects: self.listOfBookmarks)
        }
        
    
    
}

