//
//  DetailVC.swift
//  SwiftyCampTaskDay#
//
//  Created by Khaled on 7/12/19.
//  Copyright © 2019 Khaled. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    var name = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func AddRoomBtnWasPRessed(_ sender: Any) {
        let st = UIStoryboard(name: "Main", bundle: nil)
        let vc = st.instantiateViewController(withIdentifier: "AddRoom")
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
