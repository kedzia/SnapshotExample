//
//  FormView.swift
//  SnapshotExample
//
//  Created by MP0091 on 11/08/2019.
//  Copyright © 2019 Adam Kędzia. All rights reserved.
//

import Foundation
import UIKit

protocol FormView: AnyObject {
    var textField: UITextField { get }
    func update(with viewModel: FormViewModel)
}

enum FormViewModel {
    case normal(text:String, buttonEnabled: Bool)
    case userInput(text:String, buttonEnabled: Bool)
    case invalidInput(text:String, errorMessage: String)
}
