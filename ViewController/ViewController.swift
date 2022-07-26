//
//  ViewController.swift
//  ViewController
//
//  Created by Богдан Баринов on 13.07.2022.
//

import UIKit
// Стандартный размер экрана ширинаХ:375хВысотаУ:812
class ViewController: UIViewController {
    
// Инициализация кнопки
    let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.blue.withAlphaComponent(0.6)
        return button
    }()
    
    let topViewTitle: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let segmentedControlForImageChange: UISegmentedControl = {
        let mySegmentedControl = UISegmentedControl(items: ["♠️","♣️","♥️","♦️"])
        return mySegmentedControl
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    
//  Жизненный цикл вьюконтроллера
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        segmentedControlForImageChange.addTarget(self, action: #selector(segmentedControlChanged), for: .valueChanged)
        
        
        
// Добавление кнопки на наш экран
        view.addSubview(button)
        view.addSubview(topViewTitle)
        view.addSubview(segmentedControlForImageChange)
        view.addSubview(imageView)
        
// Расположение кнопки на экране
        
        topViewTitle.frame = CGRect(x: 0, y: 100, width: 200, height: 50)
        topViewTitle.center.x = view.center.x
        topViewTitle.textAlignment = .center
        
        segmentedControlForImageChange.frame = CGRect(x: 0, y: 700, width: 200, height: 50)
        segmentedControlForImageChange.center.x = view.center.x
        
        button.frame = CGRect(x: 0, y: segmentedControlForImageChange.frame.maxY + 8, width: 150, height: 40)
        button.center.x = view.center.x
        button.layer.cornerRadius = 20
// Установка метода и названия кнопки
        button.setTitle("Change color", for: .normal)
        button.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
        topViewTitle.text = "Hello World!"
        
        imageView.frame = CGRect(x: 0, y: topViewTitle.frame.maxY + 70, width: 320, height: 320)
        imageView.center.x = view.center.x
        imageView.image = UIImage(named: "defaultCarts")
//        imageView.image = UIImage(systemName: "greetingcard")
        
        
    }

    @objc func buttonDidTap() {
        view.backgroundColor = UIColor.random
        topViewTitle.backgroundColor = UIColor.random
    }
    
    @objc func segmentedControlChanged() {
        switch segmentedControlForImageChange.selectedSegmentIndex {
            case 0:
            imageView.image = UIImage(named: "Пики")
            print("♠️")
            case 1:
            imageView.image = UIImage(named: "Крести")
            print("♣️")
            case 2:
            imageView.image = UIImage(named: "Черви")
            print("♥️")
            case 3:
            imageView.image = UIImage(named: "Буби")
            print("♦️")
            default:
            break
        }
    }
    
}

//segmented контро с 4 штуками, сделать метод для него(как таргет) и в него добавлять по нажатию смена картинок (Imageview)
