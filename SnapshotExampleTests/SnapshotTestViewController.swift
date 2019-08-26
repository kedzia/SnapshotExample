//
//  SnapshotTestViewController.swift
//  SnapshotExampleTests
//
//  Created by MP0091 on 16/08/2019.
//  Copyright © 2019 Adam Kędzia. All rights reserved.
//

import Foundation
import UIKit

final class SnapshotTestViewController: UIViewController {
    var traitCollectionToOverride: UITraitCollection!
    
    override func overrideTraitCollection(forChild childViewController: UIViewController) -> UITraitCollection? {
        return self.traitCollectionToOverride
    }
    
    func addTesting(viewController: UIViewController) {
        addChild(viewController)
        viewController.view.frame = view.bounds
        view.addSubview(viewController.view)
        viewController.didMove(toParent: self)
    }
}
