//
//  ScanQRViewController.swift
//  QRISApp-iOS
//
//  Created by Yonathan Hilkia on 14/05/26.
//

import UIKit
import SnapKit

final class ScanQRViewController: UIViewController {
    
    private let messageLabel: UILabel = {
        let label = UILabel()
        label.text = "hi this is a qr page"
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Scan QR"
        
        view.addSubview(messageLabel)
        
        messageLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}
