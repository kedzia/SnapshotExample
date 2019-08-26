//  Created by MP0091 on 16/08/2019.
//  Copyright © 2019 Adam Kędzia. All rights reserved.
//

import FBSnapshotTestCase
@testable import SnapshotExample

class IOSSnapshotImprovedTest: FBSnapshotTestCase {
    
    override func setUp() {
        super.setUp()
        recordMode = false
    }
    
    func testFormViewControllerLandscapeNormalStateLandscape() {
        let formViewController = UIStoryboard.init(name: "FormViewController", bundle: nil)
            .instantiateInitialViewController() as! FormViewController
        formViewController.view.layoutSubviews() //init outlets
        formViewController.update(with: .normal(text: "Test", buttonEnabled: true))
        
        let testViewController = SnapshotTestViewController()
        UIApplication.shared.keyWindow!.rootViewController! = testViewController
        testViewController.addTesting(viewController: formViewController)
        
        let iphone8PlusScreenScale: CGFloat = 3.0
        let iphone8PlusLandscapeSafeArea = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let iphone8PlusLandscapeSize = CGSize(width: 736, height: 414)
        let iphone8PlusLandscapeTraits = UITraitCollection(traitsFrom: [.init(horizontalSizeClass: .regular),
                                                                        .init(verticalSizeClass: .compact),
                                                                        .init(userInterfaceIdiom: .phone)])
        
        UIScreen.main.setValue(iphone8PlusScreenScale, forKeyPath: "scale")
        testViewController.traitCollectionToOverride = UITraitCollection(traitsFrom:
            [testViewController.traitCollection, iphone8PlusLandscapeTraits])
        testViewController.additionalSafeAreaInsets = iphone8PlusLandscapeSafeArea
        testViewController.view.frame.size = iphone8PlusLandscapeSize
        testViewController.view.layoutIfNeeded()
        
        FBSnapshotVerifyView(testViewController.view)
    }
}
