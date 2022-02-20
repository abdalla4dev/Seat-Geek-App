//
//  EventCell.swift
//  Seat-Geek-App
//
//  Created by abdallah ragab on 20/02/2022.
//

import UIKit

class EventCell: UITableViewCell {
    @IBOutlet var lblEventName: UILabel!
    @IBOutlet var lblEventAddress: UILabel!
    @IBOutlet var lblEventDate: UILabel!
    @IBOutlet var imgViewEvent: UIImageView!
    
  
    
    // MARK: - bindData
    
    func bindData(model: Event?) {
        lblEventName.text = model?.title ?? ""
        lblEventAddress.text = model?.venue?.extendedAddress ?? ""
        lblEventDate.text = model?._date ?? ""
        if ( model?.performers?.count ?? 0) >  0 {
            imgViewEvent.loadWebImage(imageUrl: model?.performers?[0].image ?? "", placeHolder: UIImage())
        }
    }
}
