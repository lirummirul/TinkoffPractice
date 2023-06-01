//
//  SignupViewController.swift
//  Meditation
//
//  Created by Лада on 07.04.2023.
//

import UIKit

class SignupViewController: UIViewController {
    // MARK: - UI Components
    let loginTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Login"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Email"
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
    
    let passTextFieldReplay: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Repeat the password"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        return textField
    }()
    
    let buttonAuth: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Зарегистрироваться", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.setTitleColor(.white, for: .normal)
        let backgroundColorButtonAuth = UIColor(red: 0.58, green: 0.80, blue: 0.66, alpha: 0.0)
        button.backgroundColor = backgroundColorButtonAuth
        button.layer.cornerRadius = 5
        return button
    }()

    // MARK: - LifeCycle
    private let output: SignupViewOutput
    
    init(output: SignupViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundColorSignUp = UIColor(red: 0.58, green: 0.80, blue: 0.66, alpha: 1.0)
        view.backgroundColor = backgroundColorSignUp
        setup()
    }
    
    // MARK: - UI Setup
    func setup() {
        view.addSubview(loginTextField)
        view.addSubview(emailTextField)
        view.addSubview(passTextField)
        view.addSubview(passTextFieldReplay)
        view.addSubview(buttonAuth)
        
        NSLayoutConstraint.activate([
            loginTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 250),
            loginTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            loginTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            loginTextField.heightAnchor.constraint(equalToConstant: 40),
            
            emailTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            emailTextField.heightAnchor.constraint(equalToConstant: 40),
            
            passTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 350),
            passTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            passTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            passTextField.heightAnchor.constraint(equalToConstant: 40),

            passTextFieldReplay.topAnchor.constraint(equalTo: view.topAnchor, constant: 400),
            passTextFieldReplay.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            passTextFieldReplay.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            passTextFieldReplay.heightAnchor.constraint(equalToConstant: 40),

            buttonAuth.topAnchor.constraint(equalTo: view.topAnchor, constant: 450),
            buttonAuth.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            buttonAuth.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            buttonAuth.heightAnchor.constraint(equalToConstant: 40)
        ])
        buttonAuth.addTarget(self, action: #selector(signupButtonTapped), for: .touchUpInside)
    }
    
    @objc func signupButtonTapped() {
        guard
            let login = loginTextField.text,
            let email = emailTextField.text,
            let password = passTextField.text,
            let passwordReplay = passTextFieldReplay.text,
            !login.isEmpty,
            !email.isEmpty,
            !password.isEmpty,
            !passwordReplay.isEmpty
        else {
            return
        }
        if (password == passwordReplay) {
            output.signupButtonTapped(login: login, email: email, password: password)
        } else {
            showOneActionAlert(title: "Пароли не совпадают", message: "Пожалуйста, поменяйте", mainButtomTitle: "OK")
        }
    }
}

extension SignupViewController: SignupViewInput { }
