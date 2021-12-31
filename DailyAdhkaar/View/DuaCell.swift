//
//  DuaCell.swift
//  DailyAdhkaar
//
//  Created by AbuTalha on 25/12/2021.
//

import UIKit

class DuaCell: UITableViewCell {

    var indexPath: IndexPath!
    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var duaText: UILabel!
    @IBOutlet weak var repeatText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        number.text = ""
        duaText.text = ""
        duaText.font = getArabicFont()
        repeatText.text = ""
        
        self.backgroundColor = UIColor.white.withAlphaComponent(0.6)
        number.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        number.textColor = .label
        number.layer.cornerRadius = number.layer.bounds.height / 2
        number.clipsToBounds = true
        duaText.textColor = .label
        repeatText.textColor = .secondaryLabel
    }
    
    func updateCell(dua: Dua) {
        if (indexPath.row == 0) {
            number.isHidden = false
            number.text = "\(dua.id)"
        } else {
            number.isHidden = true
        }
        duaText.text = dua.group[indexPath.row].dua
        repeatText.text = dua.group[indexPath.row].repeattext
    }
    
    func getArabicFont(_ withSize: CGFloat = 20) -> UIFont {
        let fontSize = 22
        guard let customFont = UIFont(name: "XBNiloofar", size:CGFloat(fontSize)) else {
            return UIFont.boldSystemFont(ofSize:withSize)
        }
        return customFont
    }
}
