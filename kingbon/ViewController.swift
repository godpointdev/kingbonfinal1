//
//  ViewController.swift
//  kingbon
//
//  Created by jimmy on 2018/10/31.
//  Copyright © 2018 JIMMY. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController
{

    @IBAction func welcome(_ sender: UIButton)
    {
        let speechUtterance =  AVSpeechUtterance(string: "WELCOME")
        speechUtterance.voice = AVSpeechSynthesisVoice(language: "JP")
        let synth = AVSpeechSynthesizer()
        synth.speak(speechUtterance)
    }
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

