//
//  ViewController.swift
//  ProductApp
//
//  Created by Milu Ann George on 28/11/23.
//

import UIKit

var finalProducts = [Product]()
var productId : Int?

class OneTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        apiCall()
   }
    
    override func viewDidAppear(_ animated: Bool) {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        let nib = UINib(nibName: "TableCellViewController", bundle: nil)
               tableView.register(nib, forCellReuseIdentifier: "TableCellViewController")
       }
 
    func apiCall() {
        let apiClient = APIClient()
        let apiService = APIService(networkHandler: apiClient)
        print("hi")
        apiService.fetchData(from: "https://dummyjson.com/products") { (result: Result<Welcome, Error>) in
            //
            switch result {
            case .success(let products):
                finalProducts = products.products
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                print("Received products: \(products.products)")
                
            case .failure(let error):
                print("Error fetching data: \(error)")
            }
        }
    }
}

extension OneTableViewController: UITableViewDelegate, UITableViewDataSource {

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if finalProducts.count > 0 {return finalProducts.count}
        else {return 0}
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tab/Users/p10/Desktop/Development/ProductApp/ProductApp/extra/CellOneTable.swiftleView.dequeueReusableCell(withIdentifier: "TableCellViewController", for: indexPath) as! TableCellViewController
        let finalProduct = finalProducts[indexPath.row]
        if let imageURL = URL(string: finalProduct.thumbnail) {
                    ImageService.shared.loadImage(fromURL: imageURL) { (image) in
                        if let image = image {
                            DispatchQueue.main.async {
                                cell.thumbnailImage?.image = image
                            }
                        }
                    }
                }
        cell.titleCell?.text = finalProduct.title
        cell.brandCell?.text = finalProduct.brand
        cell.categoryCell?.text = finalProduct.category
        cell.priceCell.text? = "₹\(String(finalProduct.price))"
        cell.showMoreButton.tag = indexPath.row
        cell.showMoreButton.addTarget(self, action: #selector(connected(sender:)), for: .touchUpInside)
        return cell
    }
    
    @objc func connected(sender: UIButton){
        let buttonTag = sender.tag
                let detailedViewController = self.storyboard?.instantiateViewController(withIdentifier: "OneDetailDescription") as! OneDetailDescription
                self.navigationController?.pushViewController(detailedViewController, animated: true)
    }
    
}


   
