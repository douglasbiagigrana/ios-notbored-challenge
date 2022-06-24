//
//  InitialView.swift
//  notbored
//
//  Created by Douglas Biagi Grana on 17/06/22.
//

import UIKit

protocol InitialViewProtocol: AnyObject {
    func didTapStartButton()
    func didTapTermsButton()
    func didChangeTextField()
}

class InitialView: UIView {
    private weak var delegate: InitialViewProtocol?
    
    public func configDelegate(delegate: InitialViewProtocol?) {
        self.delegate = delegate
    }

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        label.textAlignment = .center
        label.text = "Not Bored"
        return label
    }()
    
    lazy var participantsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textAlignment = .left
        label.text = "Participants"
        return label
    }()
    
    lazy var participantsTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = .numberPad
        textField.placeholder = "Insert here the number of participants"
        textField.borderStyle = .roundedRect
        textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        return textField
    }()
    
    lazy var startButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Start", for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(tappedStartButton), for: .touchUpInside)
        return button
    }()
    
    lazy var termsButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Terms and Conditions", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.addTarget(self, action: #selector(tappedTermsButton), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        delegate?.didChangeTextField()
    }
    
    @objc private func tappedStartButton() {
        delegate?.didTapStartButton()
    }
    
    @objc private func tappedTermsButton() {
        delegate?.didTapTermsButton()
    }
    
    private func setUpViews() {
        addSubview(titleLabel)
        addSubview(participantsLabel)
        addSubview(participantsTextField)
        addSubview(startButton)
        addSubview(termsButton)
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 32),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            participantsLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 152),
            participantsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            participantsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            
            participantsTextField.topAnchor.constraint(equalTo: participantsLabel.bottomAnchor, constant: 8),
            participantsTextField.leadingAnchor.constraint(equalTo: participantsLabel.leadingAnchor),
            participantsTextField.trailingAnchor.constraint(equalTo: participantsLabel.trailingAnchor),
            participantsTextField.heightAnchor.constraint(equalToConstant: 48),
            
            startButton.topAnchor.constraint(equalTo: participantsTextField.bottomAnchor, constant: 80),
            startButton.leadingAnchor.constraint(equalTo: participantsTextField.leadingAnchor),
            startButton.trailingAnchor.constraint(equalTo: participantsTextField.trailingAnchor),
            startButton.heightAnchor.constraint(equalToConstant: 48),
            
            termsButton.topAnchor.constraint(equalTo: startButton.bottomAnchor, constant: 8),
            termsButton.leadingAnchor.constraint(equalTo: startButton.leadingAnchor),
            termsButton.trailingAnchor.constraint(equalTo: startButton.trailingAnchor),
        ])
    }
}
