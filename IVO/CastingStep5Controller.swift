
//
//  CastingStep5Controller.swift
//  IVO
//
//  Created by user on 1/23/17.
//  Copyright © 2017 3dlink. All rights reserved.
//

import Foundation
import UIKit
import CoreText


class CastingStep5Controller: UIViewController {
    
    @IBOutlet weak var subt: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1. El texto
        subt.text = "LOREM IPSUM DOLOR SIT, CONSECTETUR ADIPISCING ELIT. FUSCE VITAE LOREM IPSUM DOLOR SIT"
        
        // 2. Ahora necesitamos saber el rango de cada línea teniendo en cuenta los saltos de línea (ver extension UILabel)
        guard let initialRanges = subt.everyLineRange() else { return }
        
        // 3. Para poder realizar el efecto, debemos añadir un salto de línea al texto en función de cada rango (cada línea)
        var stringN = ""
        for r in initialRanges {
            let text = (subt.text! as NSString).substring(with: r).trimmingCharacters(in: .whitespacesAndNewlines)
            stringN += text + "\n"
        }
        
        // 4. Asignamos el texto de nuevo
        subt.text = stringN
        
        // 5. Volvemos a sacar los rangos omitiendo los \n (ver extension UILabel)
        guard let ranges = subt.everyLineRange(skipN: true) else { return }
        
        // 6. Añadimos separación a lo parágrafos y el fondo blanco
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.paragraphSpacing = 5.0
        
        let attributedText = NSMutableAttributedString(string: subt.text ?? "", attributes: [NSParagraphStyleAttributeName: paragraphStyle])
        for r in ranges {
            attributedText.addAttributes([NSBackgroundColorAttributeName: UIColor.white], range: r)
        }
        
        // 7. Asignamos el texto final
        subt.attributedText = attributedText
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }
    
}

extension UILabel {
    
    func everyLineRange(skipN: Bool = false) -> [NSRange]? {
        
        self.layoutIfNeeded()
        
        let font: CTFont = CTFontCreateWithName((self.text ?? "") as CFString, self.font.pointSize, nil)
        
        let mutableString = NSMutableAttributedString(string: self.text ?? "", attributes: [kCTFontAttributeName as String: font])
        let frameSetter: CTFramesetter = CTFramesetterCreateWithAttributedString(mutableString)
        
        let path = CGMutablePath()
        path.addRect(CGRect(x: 0.0, y: 0.0, width: self.bounds.size.width, height: CGFloat.greatestFiniteMagnitude))
        
        let frame = CTFramesetterCreateFrame(frameSetter, CFRangeMake(0, 0), path, nil)
        guard let lines: [CTLine] = CTFrameGetLines(frame) as? [CTLine] else {
            return nil
        }
        
        var ranges = [NSRange]()
        for l in lines {
            let r = CTLineGetStringRange(l)
            ranges.append(NSMakeRange(r.location, skipN ? r.length - 1 : r.length))
        }
        
        return ranges
        
    }
    
}
