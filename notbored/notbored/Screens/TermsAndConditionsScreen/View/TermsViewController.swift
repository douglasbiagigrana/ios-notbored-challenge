//
//  TermsViewController.swift
//  notbored
//
//  Created by Douglas Biagi Grana on 20/06/22.
//

import UIKit

class TermsViewController: UIViewController {
    private var screen: TermsView?
    
    override func loadView() {
        screen = TermsView()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}
