//
//  ViewController.swift
//  iQuiz
//
//  Created by Samael Melo on 07/05/25.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var botaoIniciarQuiz: UIButton!
    
    @IBAction func botaoPressionado(_ sender: Any) {
        print("o botao foi pressionado")
       
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        configuraLayout()
    }
    
    func configuraLayout(){
        navigationItem.hidesBackButton = true
        botaoIniciarQuiz.layer.cornerRadius = 12.0

    }

}

