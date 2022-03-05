//
//  PostViewController.swift
//  twitter_4
//
//  Created by Willy Sato on 2022/03/05.
//

import Foundation
import UIKit
import RealmSwift

class PostViewController: UIViewController, UITextViewDelegate {
    
    var tweetModel = TweetModel()
    
    @IBOutlet weak var postTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postTextView.delegate = self
        textFieldChanged()
        doneButton()
    }
    
    func saveData(with tweet: String) {
        let realm = try! Realm()
        try! realm.write {
                tweetModel.tweet = tweet
                realm.add(tweetModel)
        }
    }
    
    func textFieldChanged() {
        postTextView.text = tweetModel.tweet
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        //characters limit
        let newText = (textView.text as NSString).replacingCharacters(in: range, with: text)
        let charsNumbers = newText.count
        return charsNumbers < 140
    }
    
    @objc func doneButtonAni() {
        view.endEditing(true)

    }
    
    func doneButton() {
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 40))
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonAni))
        toolBar.items = [doneButton]
        postTextView.inputAccessoryView = toolBar
    }
    
    func textViewDidChange(_ textView: UITextView) {
        let text = textView.text ?? ""
        saveData(with: text)
    }
    
    func validate(text: String) -> Bool {
        let count = text.count
        if count < 140 {
            return true
        } else {
            return false
        }
}
    
}
