//
//  SuggestionView.swift
//  notbored
//
//  Created by Douglas Biagi Grana on 22/06/22.
//

import UIKit

protocol SuggestionViewProtocol: AnyObject {
    func didTapTryAnotherButton()
}

class SuggestionView: UIView {
    private weak var delegate: SuggestionViewProtocol?
    
    public func configDelegate(delegate: SuggestionViewProtocol?) {
            self.delegate = delegate
    }
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    lazy var participantsIcon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "person.fill")
        image.tintColor = .black
        return image
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
    
    lazy var participantsValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    lazy var priceIcon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "money")
        return image
    }()
    
    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textAlignment = .center
        label.text = "Price"
        return label
    }()
    
    lazy var priceValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    lazy var typeIcon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "list.dash")
        image.tintColor = .black
        return image
    }()
    
    lazy var typeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textAlignment = .center
        return label
    }()
    
    lazy var tryAnotherButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Try another", for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(tappedtryAnotherButton), for: .touchUpInside)
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
    
    @objc func tappedtryAnotherButton() {
        delegate?.didTapTryAnotherButton()
    }
    
    private func setUpViews() {
        addSubview(titleLabel)
        addSubview(participantsIcon)
        addSubview(participantsLabel)
        addSubview(participantsValueLabel)
        addSubview(priceIcon)
        addSubview(priceLabel)
        addSubview(priceValueLabel)
        addSubview(typeIcon)
        addSubview(typeLabel)
        addSubview(tryAnotherButton)
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 32),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            
            participantsIcon.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 64),
            participantsIcon.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            participantsIcon.heightAnchor.constraint(equalToConstant: 32),
            participantsIcon.widthAnchor.constraint(equalToConstant: 32),
            participantsLabel.centerYAnchor.constraint(equalTo: participantsIcon.centerYAnchor),
            participantsLabel.leadingAnchor.constraint(equalTo: participantsIcon.trailingAnchor, constant: 8),
            participantsValueLabel.centerYAnchor.constraint(equalTo: participantsLabel.centerYAnchor),
            participantsValueLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            priceIcon.topAnchor.constraint(equalTo: participantsIcon.bottomAnchor, constant: 32),
            priceIcon.leadingAnchor.constraint(equalTo: participantsIcon.leadingAnchor),
            priceIcon.heightAnchor.constraint(equalTo: participantsIcon.heightAnchor),
            priceIcon.widthAnchor.constraint(equalTo: participantsIcon.widthAnchor),
            priceLabel.centerYAnchor.constraint(equalTo: priceIcon.centerYAnchor),
            priceLabel.leadingAnchor.constraint(equalTo: priceIcon.trailingAnchor, constant: 8),
            priceValueLabel.centerYAnchor.constraint(equalTo: priceLabel.centerYAnchor),
            priceValueLabel.trailingAnchor.constraint(equalTo: participantsValueLabel.trailingAnchor),
            
            typeIcon.topAnchor.constraint(equalTo: priceIcon.bottomAnchor, constant: 32),
            typeIcon.leadingAnchor.constraint(equalTo: priceIcon.leadingAnchor),
            typeIcon.heightAnchor.constraint(equalTo: priceIcon.heightAnchor),
            typeIcon.widthAnchor.constraint(equalTo: priceIcon.widthAnchor),
            typeLabel.centerYAnchor.constraint(equalTo: typeIcon.centerYAnchor),
            typeLabel.leadingAnchor.constraint(equalTo: typeIcon.trailingAnchor, constant: 8),
            
            tryAnotherButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -24),
            tryAnotherButton.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            tryAnotherButton.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            tryAnotherButton.heightAnchor.constraint(equalToConstant: 48),
        ])
    }    
}
