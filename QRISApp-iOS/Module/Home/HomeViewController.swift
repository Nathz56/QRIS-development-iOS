//
//  HomeViewController.swift
//  QRISApp-iOS
//
//  Created by Yonathan Hilkia on 14/05/26.
//

import UIKit
import SnapKit

final class HomeViewController: UIViewController {
    
    private let presenter: HomePresenterProtocol
    
    init(presenter: HomePresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let balanceTitleLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.systemFont(ofSize: 32, weight: .semibold)
        label.textColor = .black
        label.text = "Balance"
        
        return label
    }()
    
    private let balanceLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .black
        
        return label
    }()
    
    private let scanButton: UIButton = {
        let button = UIButton(type: .custom)
        
        button.setImage(UIImage(systemName: "paperplane"), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        button.backgroundColor = .systemBlue
        button.tintColor = .white
        button.layer.cornerRadius = 12
        
        return button
    }()
    
    private let scanButtonLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .black
        label.text = "Scan QR"
        label.numberOfLines = 2
        label.textAlignment = .center
        
        return label
    }()
    
    private let historyButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.setImage(UIImage(systemName: "newspaper"), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        button.backgroundColor = .systemBlue
        button.tintColor = .white
        button.layer.cornerRadius = 12

        return button
    }()
    
    private let historyButtonLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .black
        label.text = "History"
        label.numberOfLines = 3
        label.textAlignment = .center
        
        return label
    }()
    
    private let generateQRButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.setImage(UIImage(systemName: "qrcode"), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        button.backgroundColor = .systemBlue
        button.tintColor = .white
        button.layer.cornerRadius = 12
        
        return button
    }()
    
    private let generateQRButtonLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .black
        label.text = "Generate QR"
        label.numberOfLines = 2
        label.textAlignment = .center
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupLayout()
        setupAction()
        
        presenter.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewWillAppear()
    }

    private func setupView() {
        title = "Home"
        view.backgroundColor = .white

        view.addSubview(balanceTitleLabel)
        view.addSubview(balanceLabel)
        view.addSubview(scanButton)
        view.addSubview(scanButtonLabel)
        view.addSubview(historyButton)
        view.addSubview(historyButtonLabel)
        view.addSubview(generateQRButton)
        view.addSubview(generateQRButtonLabel)

    }

    private func setupLayout() {
        
        balanceTitleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(50)
            $0.leading.equalTo(40)
            
        }
        
        balanceLabel.snp.makeConstraints {
            $0.top.equalTo(balanceTitleLabel.snp.top).offset(50)
            $0.leading.equalTo(40)
        }

        scanButton.snp.makeConstraints {
            $0.top.equalTo(balanceLabel.snp.bottom).offset(135)

            $0.centerX.equalToSuperview().offset(-125)
            $0.width.equalTo(55)
            $0.height.equalTo(50)
        }
        
        scanButtonLabel.snp.makeConstraints {
            $0.top.equalTo(scanButton.snp.bottom).offset(0)
            
            $0.centerX.equalToSuperview().offset(-125)
            $0.width.equalTo(55)
            $0.height.equalTo(50)
        }
        
        historyButton.snp.makeConstraints {
            $0.top.equalTo(balanceLabel.snp.bottom).offset(135)

            $0.centerX.equalToSuperview().offset(0)
            $0.width.equalTo(55)
            $0.height.equalTo(50)
        }
        
        historyButtonLabel.snp.makeConstraints {
            $0.top.equalTo(historyButton.snp.bottom).offset(0)
            
            $0.centerX.equalToSuperview().offset(0)
            $0.width.equalTo(60)
            $0.height.equalTo(40)
        }
        
        generateQRButton.snp.makeConstraints {
            $0.top.equalTo(balanceLabel.snp.bottom).offset(135)
            
            $0.centerX.equalToSuperview().offset(125)
            $0.width.equalTo(60)
            $0.height.equalTo(50)
        }
        
        generateQRButtonLabel.snp.makeConstraints {
            $0.top.equalTo(generateQRButton.snp.bottom).offset(0)
            
            $0.centerX.equalToSuperview().offset(125)
            $0.width.equalTo(71)
            $0.height.equalTo(50)
        }
    }
    
    private func setupAction() {
        
        scanButton.addTarget(self, action: #selector(tappedScanButton), for: .touchUpInside)
        historyButton.addTarget(self, action: #selector(tappedHistoryButton), for: .touchUpInside)
        generateQRButton.addTarget(self, action: #selector(tappedGenerateQRButton), for: .touchUpInside)
    }
    
    @objc
    private func tappedScanButton() {
        presenter.didTapScan()
    }
    
    @objc
    private func tappedHistoryButton() {
        presenter.didTapHistory()
    }
    
    @objc
    private func tappedGenerateQRButton() {
        presenter.didTapGenerateQR()
    }
}

extension HomeViewController: HomeViewProtocol {
    
    func showBalance(_ balance: Int) {
        balanceLabel.text = FormatCurrency.format(balance)
      }
    
}
