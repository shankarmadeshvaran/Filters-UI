//
//  Extension.swift
//  CollectionViewDynamicSizing
//
//  Created by Shankar on 31/03/20.
//  Copyright © 2020 Shankar. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionView {
    
    /// Dequeues reusable UICollectionViewCell using class name for indexPath.
    ///
    /// - Parameters:
    ///   - type: UICollectionViewCell  type.
    ///   - indexPath: Cell location in collectionView.
    /// - Returns: UICollectionViewCell object with associated class name.
    public func dequeueReusableCell<T: UICollectionViewCell>(ofType type: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: type.className, for: indexPath) as? T else {
            fatalError("Couldn't find UITableViewCell of class \(type.className)")
        }
        return cell
    }
}

extension NSObject {
    /// String describing the class name.
    static var className: String {
        return String(describing: self)
    }
    
}
