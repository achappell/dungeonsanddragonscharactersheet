//
//  UITableView+DDCC.swift
//  DungeonsDragonsCC
//
//  Created by Amanda Chappell on 10/14/16.
//  Copyright © 2016 AmplifiedProjects. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionReusableView {
    /// The default implementation of `defaultIdentifier()` uses `NSStringFromClass(class)` rather than `String(class)` so that the module name is includded.
    /// The hope being that this makes collisions unlikely making it unnnecessary to provide your own implementations.
    public class func defaultIdentifier() -> String {
        return NSStringFromClass(self)
    }
}


// MARK: - Cell Registration
public extension UICollectionView {
    
    public func register<T: UICollectionViewCell>(cellClass `class`: T.Type) {
        register(`class`, forCellWithReuseIdentifier: `class`.defaultIdentifier())
    }
    
    public func register<T: UICollectionViewCell>(nib: UINib, forClass `class`: T.Type) {
        register(nib, forCellWithReuseIdentifier: `class`.defaultIdentifier())
    }
    
    /**
     Dequeue a Reusable Cell in a way that provides type information.
     This call will raise a fatal error if the cell was not registered with `defaultIdentifier()` this behaviour is not particularily different from the method which it is covering,
     `dequeueReusableCellWithReuseIdentifier` which will raise an NSInternalInconsistency Exception because the cell was not registered with the corrrect identifier. If you are going to use this
     dequeue method it is recomended that you use `register<T: UICollectionViewCell>(cellClass: T.Type)` or `register<T: UICollectionViewCell>(nib: UINib, forClass: T.Type)` for registration.
     - parameter `class`:   The class whose type you are dequeing.
     - parameter indexPath: The index path of the cell you want to dequeue.
     
     - returns: Returns a cell of the type requested.
     */
    public func dequeueReusableCell<T: UICollectionViewCell>(withClass cellClass: T.Type, forIndexPath indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: cellClass.defaultIdentifier(), for: indexPath) as? T else {
            fatalError("Error: cell with identifier: \(cellClass.defaultIdentifier()) for index path: \(indexPath) is not \(T.self)")
        }
        return cell
    }
}


// MARK: - Supplementary View Registration
public extension UICollectionView {
    
    public func register<T: UICollectionReusableView>(viewClass cellClass: T.Type, forSupplementaryViewOfKind kind: String) {
        register(cellClass, forSupplementaryViewOfKind: kind, withReuseIdentifier: cellClass.defaultIdentifier())
    }
    
    public func register<T: UICollectionReusableView>(nib: UINib, forSupplementaryViewOfKind kind: String, withClass	 cellClass: T.Type) {
        register(nib, forSupplementaryViewOfKind: kind, withReuseIdentifier: cellClass.defaultIdentifier())
    }
    
    
    /**
     Dequeue a Supplementary View in a way that provides type information.
     
     This call will raise a fatal error if the view was not registered with `defaultIdentifier()` this behaviour is not particularily different from the method which it is covering,
     `dequeueReusableSupplementaryViewOfKind` which will raise an NSInternalInconsistency Exception because the cell was not registered with the corrrect identifier. If you are going to use this
     dequeue method it is recomended that you use `register<T: UICollectionReusableView>(viewClass: T.Type, forSupplementaryViewOfKind: String)` or
     `register<T: UICollectionReusableView>(nib: UINib, forSupplementaryViewOfKind: String, withClass: T.Type)` for registration.
     - parameter `class`:   The class whose type you are dequeing.
     - parameter kind:      The supplementary view Kind you are dequeing.
     - parameter indexPath: The index path of the cell you want to dequeue.
     
     - returns: Returns a view of the type requested.
     */
    public func dequeueReusableSupplementaryView<T: UICollectionReusableView>(withClass cellClass: T.Type, ofKind kind: String, for indexPath: IndexPath) -> T {
        guard let supplement = dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: cellClass.defaultIdentifier(), for: indexPath) as? T else {
            fatalError("Error: supplementary view with identifier: \(cellClass.defaultIdentifier()) for index path: \(indexPath) is not \(T.self)")
        }
        
        return supplement
    }
}

extension UIStoryboardSegue {
    func destinationViewController<T: UIViewController>() -> T {
        guard let destination = self.destination as? T else {
            fatalError("Could not get destination")
        }
        return destination
    }
}

extension UIStoryboard {
    enum Storyboard: String {
        case CreateCharacter
        case Main
    }
    
    class func storyboard(_ storyboard: Storyboard, bundle: Bundle? = nil) -> UIStoryboard {
        return UIStoryboard(name: storyboard.rawValue, bundle: bundle)
    }
}

protocol StoryboardIdentifiable {
    static var storyboardIdentifier: String { get }
}

extension StoryboardIdentifiable where Self: UIViewController {
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
}

extension UIViewController : StoryboardIdentifiable { }

extension UIStoryboard {
    func instantiateViewController<T: UIViewController>() -> T where T: StoryboardIdentifiable {
        let optionalViewController = self.instantiateViewController(withIdentifier: T.storyboardIdentifier)

        guard let viewController = optionalViewController as? T  else {
            fatalError("Couldn’t instantiate view controller with identifier \(T.storyboardIdentifier) ")
        }
        
        return viewController
    }
}
