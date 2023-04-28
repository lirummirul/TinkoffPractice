//
//  SignupViewController.swift
//  Meditation
//
//  Created by Лада on 07.04.2023.
//

import UIKit

class SignupViewController: UIViewController {
    weak var coordinator: AuthCoordinator?
    
    private let presenter: SignupViewOutput
    
    init(presenter: SignupViewOutput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func signDidFinish() {
        //
    }
    
}

extension SignupViewController: SignupViewInput {
    
}
