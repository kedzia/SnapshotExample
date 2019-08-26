//  Created by MP0091 on 16/08/2019.
//  Copyright © 2019 Adam Kędzia. All rights reserved.
//

import FBSnapshotTestCase
@testable import SnapshotExample

class IOSSnapshotTest: FBSnapshotTestCase {

    override func setUp() {
        super.setUp()
        recordMode = false
    }

    func testFormViewControllerNormalStatePortrait() {
        let formViewController = UIStoryboard.init(name: "FormViewController", bundle: nil)
            .instantiateInitialViewController() as! FormViewController
        formViewController.view.layoutSubviews() //inits view so IBOutlets will be instatntiated on update method
    
        formViewController.update(with: .normal(text: "Test", buttonEnabled: true))
        FBSnapshotVerifyView(formViewController.view)
    }
    
    func testFormViewControllerLandscapeNormalStateLandscape() {
        let formViewController = UIStoryboard.init(name: "FormViewController", bundle: nil)
            .instantiateInitialViewController() as! FormViewController
        formViewController.view.layoutSubviews() //init outlets
        let iphone8PlusLandscapeSize = CGSize(width: 736, height: 414)
        formViewController.view.frame.size = iphone8PlusLandscapeSize
        
        formViewController.update(with: .normal(text: "Test", buttonEnabled: true))
        FBSnapshotVerifyView(formViewController.view)
    }
}
