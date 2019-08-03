//
//  WelcomVC.swift
//  SwiftyCampTaskDay#
//
//  Created by Khaled on 7/12/19.
//  Copyright © 2019 Khaled. All rights reserved.
//

import UIKit

class WelcomViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func Start(_ sender: Any) {
        let st = UIStoryboard(name: "Main", bundle: nil)
        let vc = st.instantiateViewController(withIdentifier: "LoginScreen")
        navigationController?.pushViewController(vc, animated: true)
    }

}
