//
//  InitialViewController.swift
//  notbored
//
//  Created by Douglas Biagi Grana on 17/06/22.
//

import UIKit

class InitialViewController: UIViewController {
    private var screen: InitialView?
    
    override func loadView() {
        screen = InitialView()
        screen?.configDelegate(delegate: self)
        view = screen
        view.backgroundColor = .white
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        buttonEnabled(enabled: false)
        didTapOutside()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    private func buttonEnabled(enabled: Bool) {
        guard let text = screen?.participantsTextField.text else { return }
        let validated = Int(text) ?? 0 > 0
        screen?.startButton.alpha = validated ? 1 : 0.5
        screen?.startButton.isEnabled = validated && enabled
        
    }
    
    private func didTapOutside() {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
}

extension InitialViewController: InitialViewProtocol {
    func didTapStartButton() {
        let viewController = ActivitiesViewController()
        navigationController?.pushViewController(viewController, animated: true)
        //setViewController
    }
    
    func didTapTermsButton() {
        let viewController = TermsViewController()
        present(viewController, animated: true)
    }
    
    func didChangeTextField() {
        guard let text = screen?.participantsTextField.text else { return }
        buttonEnabled(enabled: !text.isEmpty)
    }
}
