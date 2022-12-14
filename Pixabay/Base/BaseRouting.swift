//
//  BaseRouting.swift
//  Pixabay
//
//  Created by Ilia Tsikelashvili on 05.08.22.
//

import UIKit

protocol BaseRouting {
    var topViewController: UIViewController? { get }
    var anyTopController: UIViewController? { get }
    var topNavigationController: UINavigationController? { get }
    func show(_ viewController: UIViewController)
    func present(_ viewControllerToPresent: UIViewController, animated: Bool, completion: (() -> Void)?)
}

extension BaseRouting {

    private var rootController: UIViewController? {
        let root = UIViewController.keyWindow?.rootViewController
        return root?.children.first?.presentedViewController ?? root?.children.first ?? root
    }

    var topViewController: UIViewController? {
        let navigation = topNavigationController

        if navigation != nil { return nil }
 
        return rootController
    }

    var anyTopController: UIViewController? {
        rootController
    }

    var topNavigationController: UINavigationController? {
        rootController as? UINavigationController
    }

    func show(_ viewController: UIViewController) {
        let rootController = topViewController
        rootController?.show(viewController, sender: nil)
    }

    func present(_ viewControllerToPresent: UIViewController, animated: Bool, completion: (() -> Void)?) {
        let presentationController = topViewController
        presentationController?.present(viewControllerToPresent, animated: animated, completion: completion)
    }
}
