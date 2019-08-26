//
//  FormPresenter.swift
//  SnapshotExample
//
//  Created by MP0091 on 11/08/2019.
//  Copyright © 2019 Adam Kędzia. All rights reserved.
//

import Foundation
import UIKit

class FormPresenter {
    weak var view: FormView!
    
    func attach(view: FormView) {
        self.view = view
        view.textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        view.update(with: FormViewModel.normal(text: "", buttonEnabled: false))
    }
    
    func didTapValidateButton() {
        let text = view.textField.text ?? ""
        if text.count < 5  {
            view.update(with: FormViewModel.invalidInput(text: text,
                                                         errorMessage: "This is not good enough! Elaborate!"))
        } else {
            view.update(with: FormViewModel.normal(text: "", buttonEnabled: false))
        }
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        let text = textField.text ?? ""
        if text.count > 0 {
            view?.update(with: FormViewModel.userInput(text: textField.text ?? "", buttonEnabled: true))
        } else {
            view?.update(with: FormViewModel.userInput(text: textField.text ?? "", buttonEnabled: false))
        }
    }
}
