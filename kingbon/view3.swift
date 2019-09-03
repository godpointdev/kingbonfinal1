import UIKit

class ViewController3: UIViewController,UITextFieldDelegate
{
    var myTextView: UITextView!
    var setnumber = 0
    var limnumber = 0
    var max:Int = Int.max

    @IBOutlet weak var showans: UITextView!
    @IBOutlet weak var allokbt: UIButton!
    @IBOutlet weak var vartext: UITextField!
    @IBOutlet weak var talltextfield: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.vartext.delegate = self;
        setNeedsStatusBarAppearanceUpdate()
        if(vartext.text == "" )
        {
            allokbt.isEnabled = false
            showans.text = "Please input number"
        }
    }
  
    class test
    {
        var name: String = ""
        var names: Int = 0
    }
    
    @IBAction func okbutton(_ sender: Any)
    {
        showans.text = ""
        let vartextint : Int? = Int(vartext.text!)
        let convert =  vartextint!
        let convertext = Int(convert)
        
        let vartalltext : Int? = Int(talltextfield.text!)
        let convartalltext =  vartalltext!
        let convertalltextfield = Int(convartalltext)
        
        //var values = Array<Int>(repeating:0, count:1024)
        
        for i in stride (from: 0,through:convertalltextfield,by:convertext)
        {
            //values[i] = (i)*1
         //   var value = test01(names: i)
            let value = test()
            value.names = i
            let message = test()
            message.name =  String(i , radix: 16)
            //values[i].description
            showans.text = showans.text + String(value.names) + "   ---->>>  " + message.name + "\n"
        }
    }

    @IBAction func talltextchg(_ sender: UITextField)
    {
        if talltextfield.text == ""
        {
            allokbt.isEnabled = false
            showans.text = "error please input flag number"
        }
        else if talltextfield.text == "0"
        {
            allokbt.isEnabled = false
            showans.text = "error please over 0"
            
        }
        else if vartext.text == ""
        {
            allokbt.isEnabled = false
            showans.text = "error please input number"
        }
        else
        {
            let vartextint : Int? = Int(vartext.text!)
            let convert =  vartextint!
            let convertext = Int(convert)
            
            let vartalltext : Int? = Int(talltextfield.text!)
            let convartalltext =  vartalltext!
            let convertalltextfield = Int(convartalltext)
            
            if convertalltextfield <= convertext
            {
                allokbt.isEnabled = false
                showans.text = "error number key can not over ALL NUMBER"
            }
           
            else if convertalltextfield > 9999
            {
                allokbt.isEnabled = false
                showans.text = "error number key can not over 9999"
            }
            else if convertalltextfield > 100
            {
                showans.text = "注意！轉換越大等待時間會變長"
            }
            else
            {
                
                allokbt.isEnabled = true
                showans.text = "PUSH OK!"
            }
        }
        
    }
    @IBAction func textchg(_ sender: UITextField)
    {
     
        if vartext.text == ""
        {
            allokbt.isEnabled = false
            showans.text = "error please input number"
        }
        else if vartext.text == "0"
        {
            allokbt.isEnabled = false
            showans.text = "error please over 0"
            
        }
        else if talltextfield.text == ""
        {
            allokbt.isEnabled = false
            showans.text = "error please input flag number"
        }
        else
        {
            allokbt.isEnabled = true
            showans.text = ""

        }
    }
    

     override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        self.view.endEditing(true)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
    }
    override var prefersStatusBarHidden: Bool
    {
            return true
    }
    
}

