//
//  DetailVC.swift
//  SwiftyCampTaskDay#
//
//  Created by Khaled on 7/12/19.
//  Copyright © 2019 Khaled. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var detail = ""

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction private func AddRoomBtnWasPRessed(_ sender: Any) {
        let st = UIStoryboard(name: "Main", bundle: nil)
        let vc = st.instantiateViewController(withIdentifier: "AddRoom")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction private func roomLocationBtnWasPressed(_ sender: Any) {
        let st = UIStoryboard(name: "Main", bundle: nil)
        let vc = st.instantiateViewController(withIdentifier: "roomLocation")
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
