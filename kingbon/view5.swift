
import UIKit

class ViewController5: UIViewController {
    
    @IBOutlet weak var showans: UILabel!
    @IBOutlet weak var startbtn: UIButton!
    @IBOutlet weak var restbtn: UIButton!
    @IBOutlet weak var ans: UILabel!
    @IBOutlet weak var plusintime: UIButton!
    
    var intime = 0
    var time = 0
    var mytimer : Timer?
 
     @objc func countDown()
     {
        time += 1
        showans.text = "\(time)"
        if time == 0
        {
            mytimer?.invalidate()
            startbtn.setTitle("START", for: .normal)
            time = 0
            showans.text = "\(time)"
        }
     }
     
     
 
    
    @IBAction func restaction(_ sender: UIButton)
    {
        if startbtn.titleLabel?.text == "START"
        {
            mytimer?.invalidate()
            time = 0
            intime = 0
            ans.text = String(intime)
            showans.text = "\(time)"
            plusintime.isEnabled = false
            startbtn.setTitle("START", for: .normal)
            
        }
        else
        {
            mytimer?.invalidate()
            time = 0
            intime = 0
            ans.text = String(intime)
            showans.text = "\(time)"
            plusintime.isEnabled = false
            startbtn.setTitle("START", for: .normal)
        }
        
    }
    
    @IBAction func startaction(_ sender: UIButton)
    {
        if sender.titleLabel?.text == "START"
        {
            mytimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector:
                #selector(ViewController5.countDown), userInfo: nil, repeats: true)
            //  showans.text = String(plusplus3)
            plusintime.isEnabled = true
            sender.setTitle("STOP", for: .normal)
        }
        else
        {
            mytimer?.invalidate()
            plusintime.isEnabled = false
            sender.setTitle("START", for: .normal)
        }

    }
    @IBAction func plus(_ sender: UIButton)
    {
        intime = intime + 1
        ans.text = String (intime)
    }
    
    
    override func viewDidLoad()
    {
        plusintime.isEnabled = false
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
}

