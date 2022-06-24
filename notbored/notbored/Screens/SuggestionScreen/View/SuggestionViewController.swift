//
//  SuggestionViewController.swift
//  notbored
//
//  Created by Douglas Biagi Grana on 22/06/22.
//

import UIKit
import Alamofire

class SuggestionViewController: UIViewController {
    var screen: SuggestionView?
    var suggestionTitle: String = ""
    private let boredNetworking: BoredNetworking = BoredNetworking()
    
    override func loadView() {
        screen = SuggestionView()
        screen?.configDelegate(delegate: self)
        view = screen
        view.backgroundColor = .white
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        editNavigationController()
        fetchDataByScreenOption()
    }
    
    private func editNavigationController() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .systemBlue
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationItem.title = suggestionTitle
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    private func getRandom() {
        boredNetworking.fetchRandomData { [weak self] activity in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.populateLabel(with: activity)
                self.reloadInputViews()
            }
        }
    }
    
    private func getByCategory() {
        boredNetworking.fetchDataByActivity(title: suggestionTitle) { [weak self] activity in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.populateLabel(with: activity)
                self.reloadInputViews()
            }
        }
    }
    
    private func fetchDataByScreenOption() {
        suggestionTitle == "Random" ? getRandom() : getByCategory()
        screen?.typeIcon.isHidden = suggestionTitle == "Random" ? false : true
        screen?.typeLabel.isHidden = suggestionTitle == "Random" ? false : true
    }
    
    private func populateLabel(with data: ActivityModel) {
        screen?.titleLabel.text = data.activity
        screen?.participantsValueLabel.text = String(data.participants)
        screen?.priceValueLabel.text = data.priceRate
        screen?.typeLabel.text = data.type
    }
}

extension SuggestionViewController: SuggestionViewProtocol {
    func didTapTryAnotherButton() {
        fetchDataByScreenOption()
    }
}
