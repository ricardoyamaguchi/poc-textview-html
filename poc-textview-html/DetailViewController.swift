//
//  DetailViewController.swift
//  poc-textview-html
//
//  Created by Ricardo Yamaguchi on 07/03/19.
//  Copyright © 2019 Ricardo Yamaguchi. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    private let text = "Com maior praticidade, no <b>App Rede</b>, vocÃª tem na palma da sua mÃ£o as principais funcionalidades.\n\n<ul>\n<li>1-Acesso aos seus extratos;</li>\n<li>2-VisualizaÃ§Ã£o dos valores que vocÃª vendeu, recebeu, antecipou e que ainda vai receber;</li>\n<li>3-AntecipaÃ§Ã£o de suas vendas;</li>\n<li>4-RelatÃ³rio de estornos (extratos);</li>\n<li>5-AssistÃªncia tÃ©cnica para sua maquininha;</li>\n<li>6-Solicitar Bobina e Kit de sinalizaÃ§Ã£o para o seu estabelecimento;</li>\n<li>7-Taxas e condiÃ§Ãµes das bandeiras de crÃ©dito e dÃ©bito;</li>\n<li>8-Valor do aluguel da maquininha</li>\n<li>9-RelatÃ³rio de acompanhamento de ofertas contratadas;</li>\n<li>10-InformaÃ§Ãµes cadastrais, dados do usuÃ¡rio e alteraÃ§Ã£o de senha de acesso.</li>\n</ul>\n\nAlÃ©m de poder recomendar o App Rede para seus amigos."
    
    @IBOutlet weak var textView: UITextView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView?.attributedText = String(text.filter { !"\n".contains($0) }).htmlToAttributedString
    }

}

extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return NSAttributedString()
        }
    }
}
