//
//  FormViewController.swift
//  SnapshotExample
//
//  Created by MP0091 on 11/08/2019.
//  Copyright © 2019 Adam Kędzia. All rights reserved.
//

import UIKit

class FormViewController: UIViewController, FormView {
    @IBOutlet weak var textFieldOutlet: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var submitButton: UIButton!
    var presenter: FormPresenter?
    var textField: UITextField { return textFieldOutlet}

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.attach(view: self)
    }
    
    @IBAction func didTapButton(_ sender: Any) {
        presenter?.didTapValidateButton()
    }
    
    func update(with viewModel: FormViewModel) {
        navigationItem.title = "Cat Questionnaire"
        switch viewModel {
        case .normal(text: let text, buttonEnabled: let buttonEnabled):
            textField.text = text
            errorLabel.isHidden = true
            submitButton.isEnabled = buttonEnabled
            textField.resignFirstResponder()
        case .invalidInput(text: let text,
                           errorMessage: let errorMessage):
            textField.text = text
            errorLabel.isHidden = false
            errorLabel.text = errorMessage
            submitButton.isEnabled = true
            textField.resignFirstResponder()
        case .userInput(let text, let buttonEnabled):
            textField.text = text
            errorLabel.isHidden = true
            submitButton.isEnabled = buttonEnabled
            textField.becomeFirstResponder()
        }
    }
}
