//
//  DetailDescription.swift
//  ProductApp
//
//  Created by Milu Ann George on 30/11/23.
//

import UIKit

class OneDetailDescription : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var secondTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.secondTableView.dataSource = self
        self.secondTableView.delegate = self
        secondTableView.register(CellTwoTable.self, forCellReuseIdentifier: "CellTwoTable")
        secondTableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
     
        
        //        secondTableView.register(CellOneTable.self, forCellReuseIdentifier: "CellOneTable")
        //        secondTableView.register(CellTwoTable.self, forCellReuseIdentifier: "CellTwoTable")
        //        secondTableView.register(CellThreeTable.self, forCellReuseIdentifier: "CellThreeTable")
        //        secondTableView.register(CellFourTable.self, forCellReuseIdentifier: "CellFourTable")
        //        secondTableView.register(CellFiveTable.self, forCellReuseIdentifier: "CellFiveTable")
        //        secondTableView.register(CellSixTable.self, forCellReuseIdentifier: "CellSixTable")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let finalProduct = finalProducts[indexPath.row]
        //
        //       switch indexPath.row {
        //            case 0:
        //                let cell = tableView.dequeueReusableCell(withIdentifier: "CellOneTable", for: indexPath) as! CellOneTable
        //            if let imageURL = URL(string: finalProduct.thumbnail) {
        //                        ImageService.shared.loadImage(fromURL: imageURL) { (image) in
        //                            if let image = image {
        //                                DispatchQueue.main.async {
        //                                    cell.imageDetail?.image = image
        //                                }
        //                            }
        //                        }
        //                    }
        //           return cell
        //            case 1:
        
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellTwoTable", for: indexPath) as! CellTwoTable
        cell.titleDetail?.text = finalProduct.title
        cell.ratingDetail?.text = String(finalProduct.rating)
        if(cell.titleDetail == nil){
            print(finalProduct.title)
            print("cell.titleDetail.text")
        }
        return cell
        //    func tableView(_ tableView: UITableView,
        //               heightForRowAt indexPath: IndexPath) -> CGFloat {
        //       // Make the first row larger to accommodate a custom cell.
        //      if indexPath.row == 0 {
        //          return 80
        //       }
        //
        //
        //       // Use the default size for all other rows.
        //       return UITableView.automaticDimension
        //    }
        
        
    }
}
