//
//  QuestaoViewController.swift
//  iQuiz
//
//  Created by Samael Melo on 07/05/25.
//

import UIKit

class QuestaoViewController: UIViewController {
    
    var pontuacao = 0
    var numeroQuestoa = 0
    

    @IBOutlet var respostaBotoes: [UIButton]!
    
    @IBOutlet weak var tituloQuestaoLabel: UILabel!
    
    @IBAction func respostaBotaoPressionado(_ sender: UIButton) {
        print(sender.tag)
        
        let ususarioAcertouResposta = questoes[numeroQuestoa].respostaCorreta == sender.tag
        
        if ususarioAcertouResposta {
            pontuacao += 1
            sender.backgroundColor = UIColor(red: 11/255, green: 161/255, blue: 53/255, alpha: 1.0)
        } else {
            sender.backgroundColor = UIColor(red: 211/255, green: 17/255, blue: 17/255, alpha: 1.0)
        }
        
        if numeroQuestoa < questoes.count - 1 {
            numeroQuestoa += 1
            
            Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(configurarQuestao), userInfo: nil, repeats: false )
           
        } else {
            navegaParaTelaDesempenho()
   
        }
        
    }
    
    func navegaParaTelaDesempenho(){
        performSegue(withIdentifier: "irParaTelaDesempenho", sender: nil)
      
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        configurarlayout()
        configurarQuestao()
        
    }
    
    func configurarlayout(){
        navigationItem.hidesBackButton = true
        tituloQuestaoLabel.numberOfLines = 0
        for botao in respostaBotoes {
            botao.layer.cornerRadius = 12
        }
        
    }
    
    @objc func configurarQuestao(){
        tituloQuestaoLabel.text = questoes[numeroQuestoa].titulo
        
        for botao in respostaBotoes {
            let titulo = questoes[numeroQuestoa].respostas[botao.tag]
            botao.setTitle(titulo, for: .normal)
            
            botao.backgroundColor = UIColor(red: 116/255, green: 50/255, blue: 255/255, alpha: 1.0)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        
        guard let desempenhoVC = segue.destination as? DesempenhoViewController else { return }
        
        desempenhoVC.pontuacao = pontuacao
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
