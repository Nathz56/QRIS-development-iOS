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
    
    private let balanceLabel : UILabel = {
        let balanceLabel = UILabel()
        balanceLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        return balanceLabel
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

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupLayout()
        setupAction()
        
        presenter.viewDidLoad()
    }

    private func setupView() {
        title = "Home"
        view.backgroundColor = .white

        view.addSubview(balanceLabel)
        view.addSubview(scanButton)
    }

    private func setupLayout() {
        balanceLabel.snp.makeConstraints {
            $0.top.equalTo(180)
            $0.leading.equalTo(40)
        }

        scanButton.snp.makeConstraints {
            $0.top.equalTo(balanceLabel.snp.bottom).offset(135)

            $0.centerX.equalToSuperview().offset(-125)
            $0.width.equalTo(55)
            $0.height.equalTo(50)
        }
    }
    
    private func setupAction() {
        
        scanButton.addTarget(self, action: #selector(tappedScanButton), for: .touchUpInside)
    }
    
    @objc
    private func tappedScanButton() {
        presenter.didTapScan()
    }
    
    private func formatCurrency(_ amount: Int) -> String {
        let amountString = String(amount)
        let pattern = "(\\d)(?=(\\d{3})+(?!\\d))"
        let regex = try! NSRegularExpression(pattern: pattern, options: [])
        let range = NSRange(amountString.startIndex..., in: amountString)
        let formatted = regex.stringByReplacingMatches(in: amountString, options: [], range: range, withTemplate: "$1.")
        return "Rp \(formatted)"
    }
}

extension HomeViewController: HomeViewProtocol {
    
    func showBalance(_ balanceAmount: Int) {
          balanceLabel.text = formatCurrency(balanceAmount)
      }
    
}
