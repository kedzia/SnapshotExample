//  Created by MP0091 on 16/08/2019.
//  Copyright © 2019 Adam Kędzia. All rights reserved.
//

import SnapshotTesting
import XCTest
@testable import SnapshotExample

class SwiftSnapshotTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        record = false
    }
    
    let devices = [("iPhoneX_portrait", ViewImageConfig.iPhoneX(.portrait)),
                   ("iPhoneX_landscape", ViewImageConfig.iPhoneX(.landscape)),
                   ("iPhone8Plus_portrait", ViewImageConfig.iPhone8Plus(.portrait)),
                   ("iPhone8Plus_landscape", ViewImageConfig.iPhoneX(.landscape)),
                   ("iPadPro11_portrait", ViewImageConfig.iPadPro11(.portrait))]
    
    func test(viewController: UIViewController, devices: [(String, ViewImageConfig)]) {
        for (name, config) in devices {
            assertSnapshot(matching: viewController, as: .image(on: config), named: name)
        }
    }
    
    func testFormViewControllerNormalStateLandscape() {
        let formViewController = UIStoryboard.init(name: "FormViewController", bundle: nil).instantiateInitialViewController() as! FormViewController
        formViewController.view.layoutSubviews() //init outlets

        formViewController.update(with: .normal(text: "Test", buttonEnabled: true))
        assertSnapshot(matching: formViewController, as: .image(on: .iPhone8Plus(.landscape)))
    }
    
    func testFormViewControllerNormalState2() {
        let formViewController = UIStoryboard.init(name: "FormViewController", bundle: nil).instantiateInitialViewController() as! FormViewController
        formViewController.view.layoutSubviews() //init outlets
        
        formViewController.update(with: .normal(text: "Test", buttonEnabled: true))
        UIScreen.main.setValue(2.0, forKeyPath: "scale")
        test(viewController: formViewController, devices: devices)
    }
}
