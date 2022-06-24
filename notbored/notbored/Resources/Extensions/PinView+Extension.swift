//
//  PinView+Extension.swift
//  notbored
//
//  Created by Douglas Biagi Grana on 22/06/22.
//

import Foundation
import UIKit

extension UIView {
    //seta tudo para 0
    func pinView(to superView: UIView){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
        self.leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = true
    }
}
