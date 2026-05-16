//
//  GenerateQRViewController.swift
//  QRISApp-iOS
//
//  Created by Yonathan Hilkia on 16/05/26.
//


import UIKit
import SnapKit

final class GenerateQRViewController: UIViewController {
    
    private let presenter: GenerateQRPresenterProtocol
    
    init(presenter: GenerateQRPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let qrImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.isHidden = true
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupLayout()
        presenter.viewDidLoad()
    }
    
    private func setupView() {
        title = "Scan the QR"
        view.backgroundColor = .white
        
        view.addSubview(qrImageView)
    }
    
    private func setupLayout() {
        qrImageView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.height.equalTo(250)
        }
    }
}

extension GenerateQRViewController: GenerateQRViewProtocol {
    func showGeneratedQRCode(_ image: UIImage?) {
        qrImageView.image = image
        qrImageView.isHidden = false
    }
}
