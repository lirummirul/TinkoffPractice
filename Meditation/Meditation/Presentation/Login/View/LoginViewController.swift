//
//  LoginViewController.swift
//  Meditation
//
//  Created by Лада on 05.04.2023.
//

import UIKit

class LoginViewController: UIViewController {
    // MARK: - UI Components
    let logoImageView: UIImageView = {
        let imgView = UIImageView(frame: CGRect(x: 0, y: 0, width: 140, height: 140))
        imgView.contentMode = .scaleAspectFit
        imgView.image = UIImage(named: "logo")
        imgView.clipsToBounds = true
        return imgView
    }()
    
    let labelText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Вход"
        label.font = UIFont.boldSystemFont(ofSize: 35)
        label.textColor = .white
        return label
    }()
    
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
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.setTitleColor(.white, for: .normal)
        let backgroundColorButtonNext = UIColor(red: 0.58, green: 0.80, blue: 0.66, alpha: 1.0)
        button.backgroundColor = backgroundColorButtonNext
        button.layer.cornerRadius = 5
        return button
    }()

    let buttonAuth: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Зарегистрироваться", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(.white, for: .normal)
        let backgroundColorButtonAuth = UIColor(red: 0.58, green: 0.80, blue: 0.66, alpha: 1.0)
        button.backgroundColor = backgroundColorButtonAuth
        button.layer.cornerRadius = 5
        return button
    }()
    
    // MARK: - LifeCycle
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
        let backgroundColorLogin = UIColor(red: 0.58, green: 0.80, blue: 0.66, alpha: 1.0)
        view.backgroundColor = backgroundColorLogin
        setup()
    }
    
    // MARK: - UI Setup
    func setup() {
        view.addSubview(logoImageView)
        view.addSubview(labelText)
        view.addSubview(loginTextField)
        view.addSubview(passTextField)
        view.addSubview(buttonNext)
        view.addSubview(buttonAuth)
        logoImageView.center = CGPoint(x: view.frame.midX, y: view.frame.midY - view.frame.height / 3.5)
        
        NSLayoutConstraint.activate([
            labelText.topAnchor.constraint(equalTo: view.topAnchor, constant: 250),
            labelText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            labelText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            labelText.heightAnchor.constraint(equalToConstant: 40),
            
            loginTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            loginTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            loginTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            loginTextField.heightAnchor.constraint(equalToConstant: 40),
            
            passTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 350),
            passTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            passTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            passTextField.heightAnchor.constraint(equalToConstant: 40),
            
            buttonNext.topAnchor.constraint(equalTo: view.topAnchor, constant: 400),
            buttonNext.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            buttonNext.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            buttonNext.heightAnchor.constraint(equalToConstant: 40),
            
            buttonAuth.topAnchor.constraint(equalTo: view.topAnchor, constant: 440),
            buttonAuth.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            buttonAuth.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            buttonAuth.heightAnchor.constraint(equalToConstant: 40)
        ])
        buttonAuth.addTarget(self, action: #selector(didTapSignUpButton), for: .touchUpInside)
        buttonNext.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
    }
    
    @objc func didTapLoginButton() {
        guard
//            let login = loginTextField.text,
            let email = loginTextField.text,
            let password = passTextField.text,
            !email.isEmpty,
            !password.isEmpty
        else {
            return
        }
        output.didTapLoginButton(email: email, password: password)
//        print("123123")
    }
    
    @objc func didTapSignUpButton() {
        output.didTapSignUpButton()
    }
}

extension LoginViewController: LoginViewInput { }
