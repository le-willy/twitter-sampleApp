//
//  ThirdTableViewCell.swift
//  twitter_4
//
//  Created by Willy Sato on 2022/02/23.
//

import UIKit

class ThirdTableViewCell: UITableViewCell {
    
    @IBOutlet weak var retweet: UIButton!
    @IBOutlet weak var quote: UIButton!
    
    var retweetCount = 0.0
    var quoteCount = 0.0
    var retweetResult = ""
    var quoteResult = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if retweetCount >= 1000 {
            retweetCount /= 1000
            retweetCount = floor(retweetCount * 10) / 10
            retweetResult = String("\(retweetCount)K")
        } else {
            retweetResult = String("\(retweetCount)K")
        }
        
        if quoteCount >= 1000 {
            quoteCount /= 1000
            quoteCount = floor(quoteCount * 10) / 10
            quoteResult = String("\(quoteCount)")
        } else {
            quoteResult = String("\(quoteCount)")
        }

        retweet.setTitle(retweetResult, for: .normal)
        quote.setTitle(quoteResult, for: .normal)
        
    }
    
}
