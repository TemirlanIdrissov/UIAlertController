//
//  AlertController.swift
//  AlertController
//
//  Created by Temirlan Idrissov on 28.04.2022.
//

import Foundation
import UIKit
import SnapKit

class AlertController: UIViewController {
    
    lazy var enterNameButton: UIButton = {
       let button = UIButton()
        button.setTitle("Press", for: .normal)
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(handleButton), for: .touchUpInside)
        return button
    }()
    
    lazy var helloText: UILabel = {
       let label = UILabel()
        return label
    }()
    
    @objc func handleButton() {
        let alert = UIAlertController(title: "Press your name", message: .none, preferredStyle: .alert)
        
        alert.addTextField { textField in
            textField.placeholder = "your name"
        }
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            guard let title = alert?.textFields![0].text else { return }
            self.helloText.text = "Hi, \(title)"
        }))
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
 
    private func setUI() {
        view.addSubview(enterNameButton)
        enterNameButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(50)
        }
        
        view.addSubview(helloText)
        helloText.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(150)
        }
    }
    
    
    
}
