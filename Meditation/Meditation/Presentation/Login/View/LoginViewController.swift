//
//  LoginViewController.swift
//  Meditation
//
//  Created by Лада on 05.04.2023.
//

import UIKit

class LoginViewController: UIViewController {
//    let labelHello: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.text = ""
//        label.textColor = .black
//        return label
//    }()
    
    let loginTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Login"
        textField.borderStyle = .roundedRect
        return textField
    }()
    let passTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Password"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        return textField
    }()
    let buttonNext: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Войти", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 5
        return button
    }()

    let buttonAuth: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Зарегистрироваться", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 5
        return button
    }()
    
    private let output: LoginViewOutput
    
    init(output: LoginViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        // Добавление элементов на экран
//        view.addSubview(labelHello)
        title = "Привет"
        view.addSubview(loginTextField)
        view.addSubview(passTextField)
        view.addSubview(buttonNext)
        view.addSubview(buttonAuth)
        
        setup()
    }
    
    func setup() {
        NSLayoutConstraint.activate([
//            labelHello.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
//            labelHello.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
//            labelHello.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
//            labelHello.heightAnchor.constraint(equalToConstant: 40),
            
            loginTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            loginTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            loginTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            loginTextField.heightAnchor.constraint(equalToConstant: 40),
            
            passTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            passTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            passTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            passTextField.heightAnchor.constraint(equalToConstant: 40),
            
            buttonNext.topAnchor.constraint(equalTo: view.topAnchor, constant: 250),
            buttonNext.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            buttonNext.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            buttonNext.heightAnchor.constraint(equalToConstant: 40),
            
            buttonAuth.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            buttonAuth.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            buttonAuth.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            buttonAuth.heightAnchor.constraint(equalToConstant: 40)
        ])
        buttonAuth.addTarget(self, action: #selector(didTapSignUpButton), for: .touchUpInside)
    }
    
    @objc func didTapLoginButton() {
        guard
            let login = loginTextField.text,
            let password = passTextField.text,
            login.isEmpty,
            password.isEmpty
        else {
            return
        }
        
//        labelHello.text = "\(login), \(password)"
        output.didTapLoginButton(login: login, password: password)
    }
    
    @objc func didTapSignUpButton() {
        output.didTapSignUpButton()
    }
}

extension LoginViewController: LoginViewInput { }
