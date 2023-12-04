//
//  TableCellViewController.swift
//  ProductApp
//
//  Created by Milu Ann George on 29/11/23.
//

import UIKit
var idProduct :Int = 0

class TableCellViewController: UITableViewCell{
    
    @IBOutlet weak var brandCell: UILabel!
    @IBOutlet weak var showMoreButton: UIButton!

    @IBOutlet weak var thumbnailImage: UIImageView!

    @IBOutlet weak var categoryCell: UILabel!
    @IBOutlet weak var titleCell: UILabel!
    
    @IBOutlet weak var priceCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
