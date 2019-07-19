//
//  HomeVC.swift
//  SwiftyCampTaskDay#
//
//  Created by Khaled on 7/12/19.
//  Copyright © 2019 Khaled. All rights reserved.
//

import UIKit
import Kingfisher

class HomeVC: UIViewController , UITableViewDelegate , UITableViewDataSource{
    
    
    public var roomsData: [RoomsDataModel] = []

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        AdsAPI()

        let projectcell = UINib(nibName: "CellTable", bundle: nil )
        tableView.register(projectcell, forCellReuseIdentifier: "tablecell")    }
    func AdsAPI(){
        MainAds.instance.main { (error, sucess, data) in
            if sucess {
                if let data = data {
                    self.roomsData = data
                    self.tableView.reloadData()
                }
            }
        }
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return roomsData.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:CellTable = tableView.dequeueReusableCell(withIdentifier:"tablecell" , for: indexPath) as! CellTable
        let roomsImage = roomsData[indexPath.item].image
        cell.firstImage.kf.setImage(with: roomsImage)
        cell.nameLbl.text = roomsData[indexPath.item].place
        cell.priceLbl.text = roomsData[indexPath.item].price
        cell.adressLbl.text = roomsData[indexPath.item].description
        cell.bedsCountLbl.text = String(roomsData[indexPath.item].id)
        
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

