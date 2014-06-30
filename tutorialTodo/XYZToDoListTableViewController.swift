import UIKit

@objc(XYZToDoListTableViewController) class XYZToDoListTableViewController: UITableViewController {
    
    // Properties
    var toDoItems: XYZToDoItem[] = []
    
    // Init
    init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
    }
 
    // Called when a view under this controller's management is loaded.
    // This is the appropriate time to load in data and draw stuff.
    override func viewDidLoad() {
        super.viewDidLoad()
        loadInitialData()
    }
    
    // This lets another view (viewController?) revert back to this viewController, for like, going backwards or something. TODO: understand better.
    @IBAction func unwindToList(segue:UIStoryboardSegue) {
        let s:AnyObject = segue.sourceViewController
        switch s {
            case let c as XYZAddToDoItemViewController where c.toDoItem.name.utf16count > 0 :  toDoItems.append(c.toDoItem)
                tableView.reloadData()
            default: println("Nothing To Add")// do nothing
        }

    }



    // Load up the array with some fake data
    func loadInitialData() {
        toDoItems = [
            XYZToDoItem(name: "Thank a developer"),
            XYZToDoItem(name: "Call your mother"),
            XYZToDoItem(name: "See if Pluto is still real")
        ]
    }
    
    // How many sections are in the table view?
    override func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        return 1
    }
    
    // How many items are in each section?
    override func tableView(tableView: UITableView?, numberOfRowsInSection section: Int) -> Int {
        return toDoItems.count
    }
    
    // Get the cell data at a row index
    override func tableView(tableView: UITableView?, cellForRowAtIndexPath indexPath: NSIndexPath?) -> UITableViewCell? {
        
        let cell:AnyObject? = tableView?.dequeueReusableCellWithIdentifier("ListPrototypeCell")
        if (indexPath?.row){
            let item = toDoItems[indexPath!.row]
            if (cell){
                let c = cell as UITableViewCell
                c.accessoryType = item.completed ? UITableViewCellAccessoryType.Checkmark : UITableViewCellAccessoryType.None
                    c.textLabel.text = item.name
                    return c
            }else{
                return nil
            }
        }else{
            return nil
        }
    }
    
    // when a table view item is selected
    override func tableView(tableView: UITableView?, didSelectRowAtIndexPath indexPath: NSIndexPath?) {
        if let tv = tableView {
            tv.deselectRowAtIndexPath(indexPath, animated: false) 
            if let i = indexPath{
                let tappedItem = toDoItems[i.row]                    // Which item was tapped?
                tappedItem.completed = !tappedItem.completed                  // Toggle the completion state
                tv.reloadRowsAtIndexPaths([i], withRowAnimation: UITableViewRowAnimation.None) // Tell the table view to render the changed row
            }
        }
    }
}



