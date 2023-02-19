//
//  SecoundViewController.swift
//  BMICalculatir
//
//  Created by Димаш Алтынбек on 07.02.2023.
//

import UIKit


class SecoundViewController: UIViewController {
    
    //MARK: -Views-
    let imageBackground: UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "result_background")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let labelView: UIView = {
        let view = UIView()
        return view
    }()
    
    let resultLabel: UILabel = {
        let label = UILabel()
        label.text = "YOUR RESULT"
        label.textAlignment = .center
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let BMINimberLabel: UILabel = {
        let label = UILabel()
        label.text = "0.0"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 35)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let CommentLabel: UILabel = {
        let label = UILabel()
        label.text = "Eat some more snakes"
        label.textColor = .white
        label.font = .systemFont(ofSize: 25)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("BACK", for: .normal)
        button.backgroundColor = .BackgroundColor
        button.titleLabel?.font = .systemFont(ofSize: 15)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var bmi: String?
    var color: UIColor?
    var advice: String?
    
    //MARK: -LifeCycles-
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpValues()
        updateViews()
    }
    
    //MARK: -functions-
    private func setUpValues() {
        view.backgroundColor = .systemBlue
        view.addSubview(imageBackground)
        NSLayoutConstraint.activate([
            imageBackground.topAnchor.constraint(equalTo: view.topAnchor),
            imageBackground.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageBackground.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageBackground.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        view.addSubview(mainStack)
        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            mainStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            mainStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            mainStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
        ])
        
        mainStack.addArrangedSubview(labelView)
        labelView.addSubview(resultLabel)
        labelView.addSubview(BMINimberLabel)
        labelView.addSubview(CommentLabel)
        
        NSLayoutConstraint.activate([
            BMINimberLabel.centerXAnchor.constraint(equalTo: labelView.centerXAnchor),
            BMINimberLabel.centerYAnchor.constraint(equalTo: labelView.centerYAnchor),
            
            resultLabel.bottomAnchor.constraint(equalTo: BMINimberLabel.topAnchor, constant: -9),
            resultLabel.leadingAnchor.constraint(equalTo: labelView.leadingAnchor),
            resultLabel.trailingAnchor.constraint(equalTo: labelView.trailingAnchor),
            
            CommentLabel.topAnchor.constraint(equalTo: BMINimberLabel.bottomAnchor, constant: 9),
            CommentLabel.leadingAnchor.constraint(equalTo: labelView.leadingAnchor),
            CommentLabel.trailingAnchor.constraint(equalTo: labelView.trailingAnchor)
        ])
        
        mainStack.addSubview(button)
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: mainStack.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: mainStack.trailingAnchor),
            button.bottomAnchor.constraint(equalTo: mainStack.bottomAnchor),
            button.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    func updateViews() {
        BMINimberLabel.text = bmi
        CommentLabel.text = advice
        view.backgroundColor = color
    }
    
    //MARK: -Objc functions-
    @objc func didTapButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
