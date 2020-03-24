//
//  ViewController.swift
//  CollectionViewDynamicSizing
//
//  Created by Shankar on 03/03/20.
//  Copyright © 2020 Shankar. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
    
    var filters = ["Working Days","Attendance","Late","OT Permission","Excess Break","Excess Stay","Leave","Holidays","Present Days"]
    
    @IBOutlet weak var collectionViewFilter: UICollectionView!
    
    override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}

extension HomeController: UICollectionViewDelegate,UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filters.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FilterCell", for: indexPath) as? FilterViewCell
            else { return UICollectionViewCell() }
        cell.labelFilterName.text = filters[indexPath.item]
        if cell.isSelected {
            cell.labelFilterName.textColor = .white
            cell.viewFilter.backgroundColor = .selectedbackgroundFilterColor
        } else {
            cell.labelFilterName.textColor = .deSelectedFilterTextColor
            cell.viewFilter.backgroundColor = .white
        }
        cell.tag = indexPath.row
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! FilterViewCell
        cell.isSelected = true
        cell.labelFilterName.textColor = .white
        cell.viewFilter.backgroundColor = .selectedbackgroundFilterColor
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? FilterViewCell else { return }
        cell.isSelected = false
        cell.labelFilterName.textColor = .deSelectedFilterTextColor
        cell.viewFilter.backgroundColor = .white
    }
    
}

extension UIColor {
    static let selectedbackgroundFilterColor = UIColor(red: 121/255, green: 22/255, blue: 211/255, alpha: 1.0)
    static let deSelectedFilterTextColor = UIColor(red: 121/255, green: 22/255, blue: 211/255, alpha: 1.0)
}

extension CGColor {
    static let selectedBorderFilterColor = UIColor(red: 121/255, green: 22/255, blue: 211/255, alpha: 1.0).cgColor
}
