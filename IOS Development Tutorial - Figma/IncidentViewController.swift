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
        underlineView.backgroundColor = UIColor(red: 91/255, green: 95/255, blue: 199/255, alpha: 1.0)
        underlineView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(underlineView)
        
        // Add views for tabs
        todayView.translatesAutoresizingMaskIntoConstraints = false
        incidentsView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(todayView)
        view.addSubview(incidentsView)
        
        setupTodayView()
        setupIncidentsView()
        
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
            incidentsView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        switchToTab(index: 0)
    }
    
    func setupTodayView() {
        // Implement Today View with card views
        let shiftCard = createCardView(title: "\u{1F551} Shift", subtitle: "Good morning Jeff", details: "Your shift will start in 15 minutes\n8:30 AM - 4:30 PM")
        let incidentCard = createCardView(title: "\u{1F6A8} Incidents", subtitle: "No new incidents reported by you", details: "")
        let tasksCard = createCardView(title: "\u{1F4DD} Tasks", subtitle: "Clear out the loading area", details: "+ 4 more tasks")
        let workingMembersCard = createCardView(title: "\u{1F465} Also working today", subtitle: "", details: "")

        let stackView = UIStackView(arrangedSubviews: [shiftCard, incidentCard, tasksCard, workingMembersCard])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        todayView.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: todayView.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: todayView.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: todayView.trailingAnchor, constant: -20)
        ])
    }
    
    func createCardView(title: String, subtitle: String, details: String) -> UIView {
        let cardView = UIView()
        cardView.layer.borderWidth = 1
        cardView.layer.borderColor = UIColor.lightGray.cgColor
        cardView.layer.cornerRadius = 10
        cardView.backgroundColor = .white
        cardView.translatesAutoresizingMaskIntoConstraints = false

        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        let subtitleLabel = UILabel()
        subtitleLabel.text = subtitle
        subtitleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false

        let detailsLabel = UILabel()
        detailsLabel.text = details
        detailsLabel.font = UIFont.systemFont(ofSize: 14)
        detailsLabel.textColor = .gray
        detailsLabel.numberOfLines = 2
        detailsLabel.translatesAutoresizingMaskIntoConstraints = false

        let stackView = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel, detailsLabel])
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false

        cardView.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -10),
            stackView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -10)
        ])

        return cardView
    }
    
    func setupIncidentsView() {
        // Implement Incidents View content
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
        
        NSLayoutConstraint.activate([
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
    }
    
    @objc func tabTapped(_ sender: UITapGestureRecognizer) {
        guard let selectedLabel = sender.view as? UILabel else { return }
        switchToTab(index: selectedLabel.tag)
    }
        
    @objc func openMenu() {
        let menuVC = MenuViewController()
        menuVC.modalPresentationStyle = .overFullScreen
        present(menuVC, animated: true, completion: nil)
    }
    
    func switchToTab(index: Int) {
        todayView.isHidden = index != 0
        incidentsView.isHidden = index != 1

        UIView.animate(withDuration: 0.3) {
            if index == 0 {
                self.underlineView.frame.origin.x = self.view.frame.width / 2 * 0
            } else {
                self.underlineView.frame.origin.x = self.view.frame.width / 2
            }
        }
    }

}


