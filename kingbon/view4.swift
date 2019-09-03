
import UIKit
import AVFoundation

class ViewController4: UIViewController, UITextFieldDelegate
{
    var time = 0
    var mytimer : Timer?
    var plusplus3 : Double = 0
    var backnumber : Double = 0
    
    var counter3 : Double = 0
    var counter1 : Double = 0
    var counterminu3 :Double = 0
    var counterpoint5 : Double = 0
    
    var indata : [String] = []
    var myUserDefaults : UserDefaults!
   
    @IBOutlet weak var counterfor3: UILabel!
    
    @IBOutlet weak var counterfor1: UILabel!
    
    @IBOutlet weak var counterforpoint5: UILabel!
    
    @IBOutlet weak var counterforminu3: UILabel!
    
    @IBOutlet weak var countdown3: UIButton!
    
    @IBOutlet weak var countdown1: UIButton!
    
    @IBOutlet weak var countdownpoint5: UIButton!
    
    @IBOutlet weak var countdownminu3: UIButton!
    
    
    
    
    @IBOutlet weak var downlabel: UILabel!
    @IBOutlet weak var start: UIButton!
    @IBOutlet weak var rest: UIButton!
    @IBOutlet weak var minus3: UIButton!
    @IBOutlet weak var plus05: UIButton!
    @IBOutlet weak var plus1: UIButton!
    @IBOutlet weak var plus3: UIButton!
    @IBOutlet weak var showans: UILabel!
    @IBOutlet weak var databtn: UIButton!
    @IBOutlet weak var minus3label: UILabel!
    @IBOutlet weak var p5label: UILabel!
    @IBOutlet weak var p1label: UILabel!
    @IBOutlet weak var p3label: UILabel!
    @IBOutlet weak var keyintime: UITextField!
    @IBOutlet weak var savedata: UIButton!

    //time
    
    
    //save data
    @IBAction func savepoint(_ sender: UIButton)
    {
       
        let alertController = UIAlertController (title: "是否儲存？", message: showans.text, preferredStyle: UIAlertController.Style.alert)
        let okaction = UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler:  { (action: UIAlertAction!) -> Void in  print("update data"); self.indata.append("總: \(self.backnumber)分 扣: \(self.counterminu3)分 0.5: \(self.counterpoint5)分 1: \(self.counter1)分 3: \(self.counter3)分" ); self.myUserDefaults.set( self.indata, forKey: "data"); self.myUserDefaults.synchronize(); self.savedata.isEnabled = false; self.start.isEnabled = true; self.plusplus3  = 0 ; self.showans.text = String(self.plusplus3) } )
        
        let cancelAction: UIAlertAction = UIAlertAction(title: "canale", style: UIAlertAction.Style.cancel, handler:{ (action: UIAlertAction!) -> Void in self.myUserDefaults.synchronize(); self.savedata.isEnabled = false; self.start.isEnabled = true; self.plusplus3 = 0 ; self.showans.text = String(self.plusplus3)  })
        
        alertController.addAction(cancelAction)
        alertController.addAction(okaction)
        present(alertController, animated: true, completion: nil)
        
    }
    
    //^^^^save data^^^^
    // input time set
    @IBAction func keychg(_ sender: UITextField)
    {
        if keyintime.text == ""
        {
            let speechUtterance =  AVSpeechUtterance(string: "set time")
            speechUtterance.voice = AVSpeechSynthesisVoice(language: "JP")
            let synth = AVSpeechSynthesizer()
            synth.speak(speechUtterance)
            start.isEnabled = false
            rest.isEnabled = false
            downlabel.text = "SET TIME "
        }
       
        else if  keyintime.text ==  "0"
        {
            let speechUtterance =  AVSpeechUtterance(string: "over 2")
            speechUtterance.voice = AVSpeechSynthesisVoice(language: "JP")
            let synth = AVSpeechSynthesizer()
            synth.speak(speechUtterance)
            rest.isEnabled = false
            start.isEnabled = false
            downlabel.text = "over 2 "
        }
        else if  keyintime.text ==  "1"
        {
            let speechUtterance =  AVSpeechUtterance(string: "over 2")
            speechUtterance.voice = AVSpeechSynthesisVoice(language: "JP")
            let synth = AVSpeechSynthesizer()
            synth.speak(speechUtterance)
            rest.isEnabled = false
            start.isEnabled = false
            downlabel.text = "over 2 "
        }
        else if  keyintime.text ==  "2"
        {
            let speechUtterance =  AVSpeechUtterance(string: "over 2")
            speechUtterance.voice = AVSpeechSynthesisVoice(language: "JP")
            let synth = AVSpeechSynthesizer()
            synth.speak(speechUtterance)
            rest.isEnabled = false
            start.isEnabled = false
            downlabel.text = "over 2 "
        }
        else
        {
            let varkeytext : Int? = Int(keyintime.text!)
            let convarkeytext =  varkeytext!
            let converkeytextfield = Int(convarkeytext)
            
            if converkeytextfield > 9999999
            {
                start.isEnabled = false
                rest.isEnabled = false
                downlabel.text = "< 9999999"
            }
            else
            {
                let speakstt = keyintime.text
                let speechUtterance =  AVSpeechUtterance(string: speakstt!)
                speechUtterance.voice = AVSpeechSynthesisVoice(language: "JP")
                let synth = AVSpeechSynthesizer()
                synth.speak(speechUtterance)
                downlabel.text = keyintime.text
                start.isEnabled = true
                rest.isEnabled = true
            }
        }
     
    }
    //^^^^^^^^^^^input time set
    //countdown
    @objc func countDown()
    {
        time -= 1
        downlabel.text = "\(time)"
        if counterminu3 <= 0
        {
            countdownminu3.isEnabled = false
        }
        else
        {
            countdownminu3.isEnabled = true
        }
        if counterpoint5 <= 0
        {
            countdownpoint5.isEnabled = false
        }
        else
        {
            countdownpoint5.isEnabled = true
        }
        if counter1 <= 0
        {
            countdown1.isEnabled = false
        }
        else
        {
            countdown1.isEnabled = true
        }
        if counter3 <= 0
        {
            countdown3.isEnabled = false
        }
        else
        {
            countdown3.isEnabled = true
        }
        if time == 0
        {
            mytimer?.invalidate()
            counterminu3 = counterminu3 * -3
            counterpoint5 = counterpoint5 * 0.5
            counter1 = counter1 * 1
            counter3 = counter3 * 3
            backnumber = counterminu3 + counterpoint5 + counter1 + counter3
            showans.text = String(backnumber)
            //self.showans.text!
            let controller = UIAlertController(title: "score:\(backnumber)", message: "快速儲存?", preferredStyle: .actionSheet)
            let okAction = UIAlertAction(
                title: "是",
                style: .default,
                handler:   { (action: UIAlertAction!) -> Void in  print("update data"); self.indata.append("總: \(self.backnumber) 扣: \(self.counterminu3) 0.5: \(self.counterpoint5) 1: \(self.counter1) 3: \(self.counter3)"  ); self.myUserDefaults.set( self.indata, forKey: "data"); self.myUserDefaults.synchronize(); self.savedata.isEnabled = false; self.start.isEnabled = true; self.plusplus3  = 0 ; self.showans.text = String(self.plusplus3) } )
            controller.addAction(okAction)
            
            let restAction = UIAlertAction(
                title: " 重置",
                style: .default,
                handler:   { (action: UIAlertAction!) -> Void in  self.savedata.isEnabled = false; self.start.isEnabled = true; self.plusplus3  = 0 ;self.downlabel.text = "SET TIME" ;self.keyintime.text = "" ; self.showans.text = String(self.plusplus3) } )
            controller.addAction(restAction)
            let nocountAction = UIAlertAction(
                title: " 不計分",
                style: .default,
                handler:   { (action: UIAlertAction!) -> Void in   self.savedata.isEnabled = true; self.start.isEnabled = false; self.showans.text = String(self.plusplus3) } )
            controller.addAction(nocountAction)
             let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler:   { (action: UIAlertAction!) -> Void in   self.savedata.isEnabled = true; self.start.isEnabled = false; self.showans.text = String(self.plusplus3) } )
             controller.addAction(cancelAction)
             present(controller, animated: true, completion: nil)
            
            start.setTitle("START", for: .normal)
            downlabel.text = "\(time)"
            start.isEnabled = true
            savedata.isEnabled = true
            databtn.isEnabled = true
            minus3.isEnabled = false
            plus3.isEnabled = false
            plus05.isEnabled = false
            plus1.isEnabled = false
            
            countdown1.isEnabled = false
            countdown3.isEnabled = false
            countdownminu3.isEnabled = false
            countdownpoint5.isEnabled = false
        }
        if time == 60
        {
            let speechUtterance =  AVSpeechUtterance(string: "1分")
            speechUtterance.voice = AVSpeechSynthesisVoice(language: "JP")
            let synth = AVSpeechSynthesizer()
            synth.speak(speechUtterance)
        }
        if time == 10
        {
            let speechUtterance =  AVSpeechUtterance(string: "10")
            speechUtterance.voice = AVSpeechSynthesisVoice(language: "JP")
            let synth = AVSpeechSynthesizer()
            synth.speak(speechUtterance)
        }
        if time == 9
        {
            let speechUtterance =  AVSpeechUtterance(string: "9")
            speechUtterance.voice = AVSpeechSynthesisVoice(language: "JP")
            let synth = AVSpeechSynthesizer()
            synth.speak(speechUtterance)
        }
        if time == 8
        {
            let speechUtterance =  AVSpeechUtterance(string: "8")
            speechUtterance.voice = AVSpeechSynthesisVoice(language: "JP")
            let synth = AVSpeechSynthesizer()
            synth.speak(speechUtterance)
        }
        if time == 7
        {
            let speechUtterance =  AVSpeechUtterance(string: "7")
            speechUtterance.voice = AVSpeechSynthesisVoice(language: "JP")
            let synth = AVSpeechSynthesizer()
            synth.speak(speechUtterance)
        }
        if time == 6
        {
            let speechUtterance =  AVSpeechUtterance(string: "6")
            speechUtterance.voice = AVSpeechSynthesisVoice(language: "JP")
            let synth = AVSpeechSynthesizer()
            synth.speak(speechUtterance)
        }
        if time == 5
        {
            let speechUtterance =  AVSpeechUtterance(string: "5")
            speechUtterance.voice = AVSpeechSynthesisVoice(language: "JP")
            let synth = AVSpeechSynthesizer()
            synth.speak(speechUtterance)
        }
        if time == 4
        {
            let speechUtterance =  AVSpeechUtterance(string: "4")
            speechUtterance.voice = AVSpeechSynthesisVoice(language: "JP")
            let synth = AVSpeechSynthesizer()
            synth.speak(speechUtterance)
        }
        if time == 3
        {
            let speechUtterance =  AVSpeechUtterance(string: "3")
            speechUtterance.voice = AVSpeechSynthesisVoice(language: "JP")
            let synth = AVSpeechSynthesizer()
            synth.speak(speechUtterance)
        }
        if time == 2
        {
            let speechUtterance =  AVSpeechUtterance(string: "2")
            speechUtterance.voice = AVSpeechSynthesisVoice(language: "JP")
            let synth = AVSpeechSynthesizer()
            synth.speak(speechUtterance)
        }
        if time == 1
        {
            let speechUtterance =  AVSpeechUtterance(string: "1")
            speechUtterance.voice = AVSpeechSynthesisVoice(language: "JP")
            let synth = AVSpeechSynthesizer()
            synth.speak(speechUtterance)
        }
    }
    //＾＾＾＾＾＾倒數
    //data
    @IBAction func data(_ sender: UIButton)
    {
        
    }
    //^^^^^^^^data
    //start
    @IBAction func startbtn(_ sender: UIButton)
    {
        //showans.text = String(self.plusplus3)
        if sender.titleLabel?.text == "START"
        {
            mytimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector:
                #selector(ViewController4.countDown), userInfo: nil, repeats: true)
            time = Int (keyintime.text!)!
            plusplus3 = 0
            counter3 = 0
            counter1 = 0
            counterminu3 = 0
            counterpoint5 = 0
            counterforminu3.text = String(counterminu3)
            counterforpoint5.text = String(counterpoint5)
            counterfor1.text = String(counter1)
            counterfor3.text = String(counter3)
            savedata.isEnabled = false
            minus3.isEnabled = true
            plus3.isEnabled = true
            plus05.isEnabled = true
            plus1.isEnabled = true
            countdown1.isEnabled = true
            countdown3.isEnabled = true
            countdownminu3.isEnabled = true
            countdownpoint5.isEnabled = true
            databtn.isEnabled = false
            sender.setTitle("STOP", for: .normal)
        }
        else
        {
            mytimer?.invalidate()
            minus3.isEnabled = false
            plus3.isEnabled = false
            plus05.isEnabled = false
            plus1.isEnabled = false
            databtn.isEnabled = false
            
            countdown1.isEnabled = false
            countdown3.isEnabled = false
            countdownminu3.isEnabled = false
            countdownpoint5.isEnabled = false
            
            savedata.isEnabled = true
            sender.setTitle("START", for: .normal)
        }
        
    }
    //^^^^start
    // rest
    @IBAction func restbtn(_ sender: UIButton)
    {

        if start.titleLabel?.text == "START"
        {
            // start.setTitle("START", for: .normal)
            if plusplus3 > 0 || plusplus3 < 0
            {
                start.isEnabled = true
                savedata.isEnabled = false
                minus3.isEnabled = false
                plus3.isEnabled = false
                plus05.isEnabled = false
                plus1.isEnabled = false
                databtn.isEnabled = false
                
                countdown1.isEnabled = false
                countdown3.isEnabled = false
                countdownminu3.isEnabled = false
                countdownpoint5.isEnabled = false
                
                plusplus3  = 0
                showans.text = String(plusplus3)
            }
            else
            {
                mytimer?.invalidate()
                keyintime.text = ""
                //time = Int (keyintime.text!)!
                //downlabel.text = "\(time)"
                downlabel.text = "SET TIME"
                plusplus3  = 0
                showans.text = String(plusplus3)
                
                counter3 = 0
                counter1 = 0
                counterminu3 = 0
                counterpoint5 = 0
                counterforminu3.text = String(counterminu3)
                counterforpoint5.text = String(counterpoint5)
                counterfor1.text = String(counter1)
                counterfor3.text = String(counter3)
                
            }
            
        }
        else
        {
            mytimer?.invalidate()
            /*time = Int (keyintime.text!)!
            downlabel.text = "\(time)"*/
            
            countdown1.isEnabled = false
            countdown3.isEnabled = false
            countdownminu3.isEnabled = false
            countdownpoint5.isEnabled = false
            
            start.isEnabled = false
            savedata.isEnabled = false
            minus3.isEnabled = false
            plus3.isEnabled = false
            plus05.isEnabled = false
            plus1.isEnabled = false
            databtn.isEnabled = true
            plusplus3  = 0
            showans.text = String(plusplus3)
            keyintime.text = ""
            downlabel.text = "SET TIME"
            
            counter3 = 0
            counter1 = 0
            counterminu3 = 0
            counterpoint5 = 0
            counterforminu3.text = String(counterminu3)
            counterforpoint5.text = String(counterpoint5)
            counterfor1.text = String(counter1)
            counterfor3.text = String(counter3)
            
            start.setTitle("START", for: .normal)
        }
        
        
    }
//^^^^^^^^^^^^^^^^^^^^^^rest
//計算｜｜｜｜｜｜
    @IBAction func p03(_ sender: UIButton)
    {
        counterminu3 = counterminu3 + 1
        counterforminu3.text = String(counterminu3)
        /*
        backnumber = 0
        backnumber = -3
        plusplus3 = plusplus3 - 3
        showans.text = String(plusplus3)
         */
    }
    @IBAction func p05(_ sender: UIButton)
    {
        counterpoint5 = counterpoint5 + 1
        counterforpoint5.text = String(counterpoint5)
        /*
        backnumber = 0
        backnumber = 0.5
        plusplus3 = plusplus3 + 0.5
        showans.text = String(plusplus3)
        */
    }
    @IBAction func p01(_ sender: UIButton)
    {
        counter1 = counter1 + 1
        counterfor1.text = String(counter1)
        /*
        backnumber = 0
        backnumber = 1
        plusplus3 = plusplus3 + 1
        showans.text = String(plusplus3)
        */
    }
    @IBAction func pp03(_ sender: UIButton)
    {
        counter3 = counter3 + 1
        counterfor3.text = String(counter3)
        
        /*backnumber = 0
        backnumber = 3
        plusplus3 = plusplus3 + 3
        showans.text = String(plusplus3)
        */
    }
    
    @IBAction func down3(_ sender: UIButton)
    {
        counter3 = counter3 - 1
        counterfor3.text = String(counter3)
    }
    
    @IBAction func down1(_ sender: UIButton)
    {
        counter1 = counter1 - 1
        counterfor1.text = String(counter1)
    }
    
    @IBAction func downpoint5(_ sender: UIButton)
    {
        counterpoint5 = counterpoint5 - 1
        counterforpoint5.text = String(counterpoint5)
    }
    
    @IBAction func downminu3(_ sender: UIButton)
    {
        counterminu3 = counterminu3 - 1
        counterforminu3.text = String(counterminu3)
    }
    
    
    
    
    
    
   // ^^^^^^^^^^^^^^^^^^^^^計算
    
    override func viewDidLoad()
    {
        
        let speechUtterance =  AVSpeechUtterance(string: "set time")
        speechUtterance.voice = AVSpeechSynthesisVoice(language: "JP")
        let synth = AVSpeechSynthesizer()
        synth.speak(speechUtterance)
    
        myUserDefaults = UserDefaults.standard
        self.keyintime.delegate = self;
        setNeedsStatusBarAppearanceUpdate()
        super.viewDidLoad()
        if keyintime.text == ""
        {
            start.isEnabled = false
            rest.isEnabled = false
            downlabel.text = "SET TIME "
        }
        plusplus3 = 0
        counter3 = 0
        counter1 = 0
        counterminu3 = 0
        counterpoint5 = 0
        counterforminu3.text = String(counterminu3)
        counterforpoint5.text = String(counterpoint5)
        counterfor1.text = String(counter1)
        counterfor3.text = String(counter3)
        //showans.text = String(plusplus3)
        countdown1.isEnabled = false
        countdown3.isEnabled = false
        countdownminu3.isEnabled = false
        countdownpoint5.isEnabled = false
        minus3.isEnabled = false
        plus3.isEnabled = false
        plus05.isEnabled = false
        plus1.isEnabled = false
        savedata.isEnabled = false
        databtn.isEnabled = true
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

