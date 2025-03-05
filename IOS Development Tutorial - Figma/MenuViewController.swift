//
//  MenuViewController.swift
//  IOS Development Tutorial - Figma
//
//  Created by Pratiksha Katyayni on 06/03/25.
//

import UIKit

class MenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        view.backgroundColor = .white

        // Profile Section
        let profileImageView = UIImageView()
        profileImageView.image = UIImage(named: "profile") // Ensure this image exists in Assets
        profileImageView.layer.cornerRadius = 25
        profileImageView.clipsToBounds = true
        profileImageView.translatesAutoresizingMaskIntoConstraints = false

        let nameLabel = UILabel()
        nameLabel.text = "Karin Blair"
        nameLabel.font = UIFont.boldSystemFont(ofSize: 18)

        let roleLabel = UILabel()
        roleLabel.text = "Software Engineer"
        roleLabel.font = UIFont.systemFont(ofSize: 14)
        roleLabel.textColor = .gray

        let stackView = UIStackView(arrangedSubviews: [nameLabel, roleLabel])
        stackView.axis = .vertical
        stackView.spacing = 2

        let profileStack = UIStackView(arrangedSubviews: [profileImageView, stackView])
        profileStack.axis = .horizontal
        profileStack.spacing = 10
        profileStack.alignment = .center
        profileStack.translatesAutoresizingMaskIntoConstraints = false

        // Menu Items
        let menuItems = ["Available ✅", "Set status message", "Notifications 🔔", "Settings ⚙️", "What’s new"]
        let menuStackView = UIStackView()
        menuStackView.axis = .vertical
        menuStackView.spacing = 15
        menuStackView.translatesAutoresizingMaskIntoConstraints = false

        for item in menuItems {
            let label = UILabel()
            label.text = item
            label.font = UIFont.systemFont(ofSize: 16)
            menuStackView.addArrangedSubview(label)
        }

        // Sign Out
        let signOutLabel = UILabel()
        signOutLabel.text = "Sign out"
        signOutLabel.textColor = .blue
        signOutLabel.font = UIFont.boldSystemFont(ofSize: 16)
        signOutLabel.isUserInteractionEnabled = true
        signOutLabel.translatesAutoresizingMaskIntoConstraints = false
        let signOutTap = UITapGestureRecognizer(target: self, action: #selector(signOutTapped))
        signOutLabel.addGestureRecognizer(signOutTap)

        // Layout
        view.addSubview(profileStack)
        view.addSubview(menuStackView)
        view.addSubview(signOutLabel)

        NSLayoutConstraint.activate([
            profileStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            profileStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),

            menuStackView.topAnchor.constraint(equalTo: profileStack.bottomAnchor, constant: 20),
            menuStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),

            signOutLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            signOutLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
    }

    @objc func signOutTapped() {
        dismiss(animated: true, completion: nil)
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
