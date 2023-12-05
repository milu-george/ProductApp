//
//  DetailDescription.swift
//  ProductApp
//
//  Created by Milu Ann George on 30/11/23.
//

import UIKit

class OneDetailDescription : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var secondTableView: UITableView!
    var productDetail : Product!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.secondTableView.dataSource = self
        secondTableView.delegate = self
        self.setupTableView()
    }
   
    func setupTableView() {
    
        secondTableView.register(CellTwoTable.self, forCellReuseIdentifier: "CellTwoTable")
        secondTableView.register(CellTwoTable.self, forCellReuseIdentifier: "CellTwoTable")
        secondTableView.register(CellThreeTable.self, forCellReuseIdentifier: "CellThreeTable")
        secondTableView.register(CellFourTable.self, forCellReuseIdentifier: "CellFourTable")
        secondTableView.register(CellFiveTable.self, forCellReuseIdentifier: "CellFiveTable")
        secondTableView.register(CellSixTable.self, forCellReuseIdentifier: "CellSixTable")
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CellOneTable", for: indexPath) as! CellOneTable
        
            if let imageURL = URL(string: productDetail.thumbnail) {
                        ImageService.shared.loadImage(fromURL: imageURL) { (image) in
                            if let image = image {
                                DispatchQueue.main.async {
                                    cell.imageDetail?.image = image
                                }
                            }
                        }
                    }
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CellTwoTable", for: indexPath) as! CellTwoTable
            print(productDetail.title)
                cell.titleDetail?.text = self.productDetail.title
                cell.ratingDetail?.text = String(self.productDetail.rating)
            return cell
          
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CellThreeTable", for: indexPath) as! CellThreeTable
            cell.brandDetail?.text = productDetail.brand
            cell.categoryDetail?.text = productDetail.category
            cell.stockDetail?.text = String(productDetail.stock)
            return cell
            
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CellFourTable", for: indexPath) as! CellFourTable
            cell.descriptionDetail?.text = productDetail.description
            return cell
            
        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CellFiveTable", for: indexPath) as! CellFiveTable
            cell.priceDetail?.text = String(productDetail.price)
            cell.discountDetail?.text = String(productDetail.discountPercentage)
            return cell
        case 6:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CellSixTable", for: indexPath) as! CellSixTable
          
            return cell
        default:
            return UITableViewCell() // Default case
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            switch indexPath.row {
            case 0:
                return 200
            case 1:
                return 100
            default:
                return UITableView.automaticDimension
            }
        }
}
