
import UIKit

class ViewController6: UIViewController,UITableViewDelegate,UITableViewDataSource
{
    var indata : [String] = []
    
    override func viewDidLoad()
    {
        inputdata()
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
   
    func inputdata()
    {
        var output : [String]?
        output = UserDefaults.standard.object(forKey: "data") as? [String]
        if let inputdata = output
        {
            self.indata = inputdata
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.indata.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell =  UITableViewCell()
        cell.textLabel?.text = self.indata [indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == .delete
        {
            self.indata.remove(at: indexPath.row)
            UserDefaults.standard.removeObject(forKey: "data")
            UserDefaults.standard.set(self.indata, forKey: "data")
            UserDefaults.standard.synchronize()
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        else if editingStyle == .insert
        {
            
        }
    }
}
