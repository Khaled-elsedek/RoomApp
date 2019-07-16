//
//  HomeVC.swift
//  SwiftyCampTaskDay#
//
//  Created by Khaled on 7/12/19.
//  Copyright © 2019 Khaled. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        

        let projectcell = UINib(nibName: "CellTable", bundle: nil )
        tableView.register(projectcell, forCellReuseIdentifier: "tablecell")    }
    

    

}
extension UIViewController : UITableViewDelegate{
    
}
extension UIViewController : UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:CellTable = tableView.dequeueReusableCell(withIdentifier:"tablecell" , for: indexPath) as! CellTable
        
        return cell
    }
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height * 0.25
    }
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 1:
            let st = UIStoryboard(name: "Main", bundle: nil)
            let vc = st.instantiateViewController(withIdentifier: "DetailScreen")
            navigationController?.pushViewController(vc, animated: true)
        default:
            break
        }
        
        
        
    }
    
    
}
