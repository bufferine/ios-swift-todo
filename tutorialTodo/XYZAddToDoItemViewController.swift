//
//  XYZAddToDoItemViewController.swift
//  tutorialTodo
//
//  Created by Eric on 6/7/14.
//  Copyright (c) 2014 Simple Guy. All rights reserved.
//

import UIKit

class XYZAddToDoItemViewController: UIViewController {



    var toDoItem:XYZToDoItem = XYZToDoItem(name: "")
    
    init(coder aDecoder: NSCoder!) {
      super.init(coder: aDecoder)
    }
    
    @IBAction func unwindToList2 (segue: UIStoryboardSegue) {
        
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Outlets are locations for UI widgets to send events to, I think.
    @IBOutlet var doneButton : UIBarButtonItem

    
    @IBOutlet var textField : UITextField
    
    // Add a to-do item if they clicked "done"
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
        if sender as? NSObject != doneButton { return } // TODO: this `as?` thing?
        if textField.text.utf16count > 0 { // Some baloney: https://developer.apple.com/library/prerelease/ios/documentation/swift/conceptual/swift_programming_language/StringsAndCharacters.html#//apple_ref/doc/uid/TP40014097-CH7-XID_368
            
            self.toDoItem = XYZToDoItem(name: textField.text)
            
        }
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }

}
