//
//  HomeVC.swift
//  SwiftyCampTaskDay#
//
//  Created by Khaled on 7/12/19.
//  Copyright © 2019 Khaled. All rights reserved.
//

import UIKit
import Kingfisher
import SVProgressHUD
class HomeVC: UIViewController , UITableViewDelegate , UITableViewDataSource{
    
    public var roomsData: [RoomsDataModel] = []

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        SVProgressHUD.show()
        let projectcell = UINib(nibName: "CellTable", bundle: nil )
        tableView.register(projectcell, forCellReuseIdentifier: "tablecell")
        AdsAPI()
    }
    
  
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return roomsData.count
        
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:CellTable = tableView.dequeueReusableCell(withIdentifier:"tablecell" , for: indexPath) as! CellTable
        
        cell.item = roomsData[indexPath.row]
        

        return cell
    }
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height * 0.25
    }
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case indexPath.row:
            let st = UIStoryboard(name: "Main", bundle: nil)
            let vc = st.instantiateViewController(withIdentifier: "DetailScreen") 
            navigationController?.pushViewController(vc, animated: true)
        default:
            break
        }
        
        
        
    }
    func showAlert(msgerror:String = "complete all fields"){
        let alert = UIAlertController(title: "error", message: msgerror, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

}
extension HomeVC {
    func AdsAPI(){
        MainAds.instance.main {[weak self] (error, sucess, errormsg, data) in
            if sucess {
                if let data = data {
                    self?.roomsData = data
                    DispatchQueue.main.async {
                        self?.tableView.reloadData()
                        SVProgressHUD.dismiss()
                        
                    }
                }else if errormsg != "" {
                    SVProgressHUD.dismiss()
                    let st = UIStoryboard(name: "Main", bundle: nil)
                    let vc = st.instantiateViewController(withIdentifier: "LoginScreen")
                    self?.navigationController?.pushViewController(vc, animated: true) 
                    self!.showAlert(msgerror: errormsg)
                }
            }
        }
    }
}
