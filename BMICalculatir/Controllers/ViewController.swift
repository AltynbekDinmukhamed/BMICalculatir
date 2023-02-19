//
//  ViewController.swift
//  BMICalculatir
//
//  Created by Димаш Алтынбек on 06.02.2023.
//

import UIKit

class ViewController: UIViewController{

    //MARK: -Views-
   
    //MARK: -Background Image
    let backgroundImage: UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "calculate_background")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    //MARK: --
    let mainStack: UIStackView = {
       let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "CALCULATE YOUR BMI"
        label.font = .boldSystemFont(ofSize: 30)
        return label
    }()
    //MARK: height stack
    let heightStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let heightNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Height"
        label.textColor = .gray
        label.font = .systemFont(ofSize: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let heightNumber: UILabel = {
        let label = UILabel()
        label.text = "100m"
        label.textColor = .gray
        label.font = .systemFont(ofSize: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    //MARK: slider
    private lazy var heightslider: UISlider = {
        let slider = UISlider()
        slider.value = 1.5
        slider.minimumValue = 0
        slider.maximumValue = 3
        slider.thumbTintColor = .BackgroundColor
        slider.tintColor = .BackgroundColor
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.addTarget(self, action: #selector(heightDidChange), for: .valueChanged)
        return slider
    }()
    
    //MARK: height stack
    let weightStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let weightNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Weight"
        label.textColor = .gray
        label.font = .systemFont(ofSize: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let weightNumber: UILabel = {
        let label = UILabel()
        label.text = "100kg"
        label.textColor = .gray
        label.font = .systemFont(ofSize: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //slider
    private lazy var weightSlider: UISlider = {
        let slider = UISlider()
        slider.value = 100
        slider.minimumValue = 0
        slider.maximumValue = 200
        slider.thumbTintColor = .BackgroundColor
        slider.tintColor = .BackgroundColor
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.addTarget(self, action: #selector(weightSliderChange), for: .valueChanged)
        return slider
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("CALCULATE", for: .normal)
        button.backgroundColor = .BackgroundColor
        button.titleLabel?.font = .systemFont(ofSize: 15)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var calculationBrain = CalculationBrain()
    
    //MARK: -LifeCycle-
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

    //MARK: -Functions
    private func setUpView() {
        view.addSubview(backgroundImage)
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        view.addSubview(mainStack)
        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            mainStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            mainStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -5),
            mainStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
        ])
        
        mainStack.addArrangedSubview(nameLabel)
        mainStack.addArrangedSubview(heightStack)
        NSLayoutConstraint.activate([
            heightStack.leadingAnchor.constraint(equalTo: mainStack.leadingAnchor),
            heightStack.trailingAnchor.constraint(equalTo: mainStack.trailingAnchor)
        ])
        
        //adding in stack heigh labels
        heightStack.addArrangedSubview(heightNameLabel)
        heightStack.addArrangedSubview(heightNumber)
        
        mainStack.addArrangedSubview(heightslider)
        NSLayoutConstraint.activate([
            heightslider.leadingAnchor.constraint(equalTo: mainStack.leadingAnchor),
            heightslider.trailingAnchor.constraint(equalTo: mainStack.trailingAnchor)
        ])
        
        //adding weight stack
        mainStack.addArrangedSubview(weightStack)
        NSLayoutConstraint.activate([
            weightStack.trailingAnchor.constraint(equalTo: mainStack.trailingAnchor),
            weightStack.leadingAnchor.constraint(equalTo: mainStack.leadingAnchor)
        ])
        weightStack.addArrangedSubview(weightNameLabel)
        weightStack.addArrangedSubview(weightNumber)
        
        mainStack.addArrangedSubview(weightSlider)
        NSLayoutConstraint.activate([
            weightStack.leadingAnchor.constraint(equalTo: mainStack.leadingAnchor),
            weightStack.trailingAnchor.constraint(equalTo: mainStack.trailingAnchor)
        ])
        
        mainStack.addArrangedSubview(button)
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: mainStack.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: mainStack.trailingAnchor),
            button.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    //MARK: -objc functions-
    @objc func didTapButton(_ sender: UIButton) {
        let height = heightslider.value
        let weight = weightSlider.value
        
        calculationBrain.calculateBMI(height: height, weight: weight)
        
        let vc = SecoundViewController()
        vc.bmi = calculationBrain.getBMIValue()
        vc.advice  = calculationBrain.getAdvice()
        vc.color = calculationBrain.getColor()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @objc func heightDidChange(_ slider: UISlider) {
        let heighValue = String(format: "%.2f", slider.value)
        heightNumber.text = "\(heighValue)m"
    }
    
    @objc func weightSliderChange(_ slider: UISlider) {
        let weightValue = String(format: "%.0f", slider.value)
        weightNumber.text = "\(weightValue)kg"
    }
}

