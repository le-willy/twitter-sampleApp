//
//  LikesTableViewCell.swift
//  twitter_4
//
//  Created by Willy Sato on 2022/02/23.
//

import UIKit

class LikesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var likes: UIButton!
    
    var likeCount = 0.0
    var likeResult = ""
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if likeCount >= 1000 {
            likeCount /= 1000
            likeCount = floor(likeCount * 10) / 10
            likeResult = String("\(likeCount)K")
        } else {
            likeResult = String("\(likeCount)")
        }
        likes.setTitle(likeResult, for: .normal)
    }
    
}
