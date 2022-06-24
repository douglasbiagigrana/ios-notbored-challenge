//
//  ActivitiesViewController.swift
//  notbored
//
//  Created by Douglas Biagi Grana on 22/06/22.
//

import UIKit

class ActivitiesViewController: UIViewController {
    private var screen: ActivitiesView?
    
    var activities: [Activity] = [
        Activity(type: "Education"),
        Activity(type: "Recreational"),
        Activity(type: "Social"),
        Activity(type: "Diy"),
        Activity(type: "Charity"),
        Activity(type: "Cooking"),
        Activity(type: "Relaxation"),
        Activity(type: "Music"),
        Activity(type: "Busywork"),
    ]
    
    override func loadView() {
        screen = ActivitiesView()
        screen?.configTableViewDelegates(delegate: self, dataSource: self)
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        editNavigationController()
    }
    
    private func screenOption(name: String) {
        let viewController = SuggestionViewController()
        viewController.suggestionTitle = name
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    private func editNavigationController() {
        let appearance = UINavigationBarAppearance()
        let play = UIBarButtonItem(image: UIImage(systemName: "shuffle"), style: .plain, target: self, action: #selector(didTapRandomButton))
        appearance.backgroundColor = .systemBlue
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationItem.title = "Activities"
        navigationItem.rightBarButtonItem = play
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    @objc func didTapRandomButton() {
        screenOption(name: "Random")
    }
}

extension ActivitiesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ActivitiesTableViewCell.identifier, for: indexPath) as? ActivitiesTableViewCell
        cell?.categoryLabel.text = activities[indexPath.row].type
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let name = activities[indexPath.row].type.lowercased()
        screenOption(name: name)
    }
}
