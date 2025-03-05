import UIKit

class IncidentViewController: UIViewController {
    
    let profileImageView = UIImageView()
    
    let segmentedControl = UISegmentedControl(items: ["Today", "Incidents"])
    let todayView = UIView()
    let incidentsView = UIView()
    let underlineView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    func setupUI() {
        // Profile Image
        let profileImageView = UIImageView()
        profileImageView.image = UIImage(named: "profile") // Add profile image asset
        profileImageView.layer.cornerRadius = 15
        profileImageView.clipsToBounds = true
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.isUserInteractionEnabled = true // Enable tap
        let profileTapGesture = UITapGestureRecognizer(target: self, action: #selector(openMenu))
        profileImageView.addGestureRecognizer(profileTapGesture)

        view.addSubview(profileImageView)
        
        // Title Label
        let titleLabel = UILabel()
        titleLabel.text = "Contoso"
        titleLabel.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        titleLabel.textColor = UIColor(red: 33/255, green: 33/255, blue: 33/255, alpha: 1.0)
        let attributedText = NSMutableAttributedString(string: "Contoso")
        attributedText.addAttribute(.kern, value: 0.33, range: NSRange(location: 0, length: attributedText.length))
        titleLabel.attributedText = attributedText
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        // Tab Labels
        let tabStackView = UIStackView()
        tabStackView.axis = .horizontal
        tabStackView.distribution = .fillEqually
        tabStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tabStackView)
        
        let todayLabel = UILabel()
        todayLabel.text = "Today"
        todayLabel.textAlignment = .center
        todayLabel.isUserInteractionEnabled = true
        todayLabel.textColor = .black
        todayLabel.tag = 0
        let todayTapGesture = UITapGestureRecognizer(target: self, action: #selector(tabTapped(_:)))
        todayLabel.addGestureRecognizer(todayTapGesture)
        
        let incidentsLabel = UILabel()
        incidentsLabel.text = "Incidents"
        incidentsLabel.textAlignment = .center
        incidentsLabel.isUserInteractionEnabled = true
        incidentsLabel.textColor = .gray
        incidentsLabel.tag = 1
        let incidentsTapGesture = UITapGestureRecognizer(target: self, action: #selector(tabTapped(_:)))
        incidentsLabel.addGestureRecognizer(incidentsTapGesture)
        
        tabStackView.addArrangedSubview(todayLabel)
        tabStackView.addArrangedSubview(incidentsLabel)
        
        // Underline View
        underlineView.backgroundColor = .black
        underlineView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(underlineView)
        
        // Views for tabs
        todayView.translatesAutoresizingMaskIntoConstraints = false
        incidentsView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(todayView)
        view.addSubview(incidentsView)
        
        // Incident Report Card (inside incidentsView)
        let cardView = UIView()
//        cardView.layer.borderColor = UIColor.lightGray.cgColor
//        cardView.layer.borderWidth = 1
//        cardView.layer.cornerRadius = 10
        cardView.translatesAutoresizingMaskIntoConstraints = false
        incidentsView.addSubview(cardView)
        
        let gearImageView = UIImageView()
        gearImageView.image = UIImage(named: "gearImage") // Ensure the image is added in assets
        gearImageView.contentMode = .scaleAspectFit
        gearImageView.translatesAutoresizingMaskIntoConstraints = false
        cardView.addSubview(gearImageView)
        
        let noIncidentsLabel = UILabel()
        noIncidentsLabel.text = "No incidents reported"
        noIncidentsLabel.font = UIFont.boldSystemFont(ofSize: 16)
        noIncidentsLabel.translatesAutoresizingMaskIntoConstraints = false
        cardView.addSubview(noIncidentsLabel)
        
        let subtextLabel = UILabel()
        subtextLabel.text = "No new incidents reported by you"
        subtextLabel.font = UIFont.systemFont(ofSize: 14)
        subtextLabel.textColor = .gray
        subtextLabel.translatesAutoresizingMaskIntoConstraints = false
        cardView.addSubview(subtextLabel)
        
        let reportButton = UIButton(type: .system)
        reportButton.setTitle("Report incident", for: .normal)
        reportButton.layer.borderWidth = 1
        reportButton.layer.borderColor = UIColor(red: 166/255, green: 167/255, blue: 220/255, alpha: 1.0).cgColor
        reportButton.layer.cornerRadius = 5
        reportButton.setTitleColor(UIColor(red: 166/255, green: 167/255, blue: 220/255, alpha: 1.0), for: .normal)
        reportButton.translatesAutoresizingMaskIntoConstraints = false
        cardView.addSubview(reportButton)
        
        // Constraints
        NSLayoutConstraint.activate([
            profileImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            profileImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            profileImageView.widthAnchor.constraint(equalToConstant: 30),
            profileImageView.heightAnchor.constraint(equalToConstant: 30),
            
            titleLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 10),
            titleLabel.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor),
            
            tabStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tabStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tabStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            tabStackView.heightAnchor.constraint(equalToConstant: 40),
            
            underlineView.topAnchor.constraint(equalTo: tabStackView.bottomAnchor, constant: 2),
            underlineView.heightAnchor.constraint(equalToConstant: 2),
            underlineView.widthAnchor.constraint(equalTo: todayLabel.widthAnchor),
            underlineView.leadingAnchor.constraint(equalTo: todayLabel.leadingAnchor),
            
            todayView.topAnchor.constraint(equalTo: tabStackView.bottomAnchor),
            todayView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            todayView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            todayView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            incidentsView.topAnchor.constraint(equalTo: tabStackView.bottomAnchor),
            incidentsView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            incidentsView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            incidentsView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            cardView.centerXAnchor.constraint(equalTo: incidentsView.centerXAnchor),
            cardView.topAnchor.constraint(equalTo: incidentsView.topAnchor, constant: 40),
            cardView.widthAnchor.constraint(equalToConstant: 311),
            cardView.heightAnchor.constraint(equalToConstant: 348),
            
            gearImageView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 40),
            gearImageView.centerXAnchor.constraint(equalTo: cardView.centerXAnchor),
            gearImageView.widthAnchor.constraint(equalToConstant: 198),
            gearImageView.heightAnchor.constraint(equalToConstant: 200),
            
            noIncidentsLabel.topAnchor.constraint(equalTo: gearImageView.bottomAnchor, constant: 20),
            noIncidentsLabel.centerXAnchor.constraint(equalTo: cardView.centerXAnchor),
            
            subtextLabel.topAnchor.constraint(equalTo: noIncidentsLabel.bottomAnchor, constant: 5),
            subtextLabel.centerXAnchor.constraint(equalTo: cardView.centerXAnchor),
            
            reportButton.topAnchor.constraint(equalTo: subtextLabel.bottomAnchor, constant: 20),
            reportButton.centerXAnchor.constraint(equalTo: cardView.centerXAnchor),
            reportButton.widthAnchor.constraint(equalToConstant: 150),
            reportButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        switchToTab(index: 0)
    }
    
    @objc func tabTapped(_ sender: UITapGestureRecognizer) {
        guard let selectedLabel = sender.view as? UILabel else { return }
        switchToTab(index: selectedLabel.tag)
    }

    func switchToTab(index: Int) {
        // Find tab labels
        if let tabStackView = view.subviews.compactMap({ $0 as? UIStackView }).first {
            let tabLabels = tabStackView.arrangedSubviews.compactMap { $0 as? UILabel }
            
            UIView.animate(withDuration: 0.3) {
                self.underlineView.frame.origin.x = index == 0 ? tabLabels[0].frame.origin.x : tabLabels[1].frame.origin.x
            }
            
            for label in tabLabels {
                if label.tag == index {
                    label.textColor = .black
                    label.font = UIFont.boldSystemFont(ofSize: 16)
                } else {
                    label.textColor = .gray
                    label.font = UIFont.systemFont(ofSize: 16)
                }
            }
        }

        
        todayView.isHidden = index != 0  // Hide today content
        incidentsView.isHidden = index != 1  // Show incidents content only when selected

    }
    @objc func openMenu() {
            let menuVC = MenuViewController()
            menuVC.modalPresentationStyle = .overFullScreen
            present(menuVC, animated: true, completion: nil)
        }
}

