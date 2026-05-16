//
//  PaymentViewController.swift
//  QRISApp-iOS
//
//  Created by Yonathan Hilkia on 16/05/26.
//

import UIKit
import SnapKit

final class PaymentViewController: UIViewController {
    
    private let presenter: PaymentPresenterProtocol
    
    init(presenter: PaymentPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let merchantTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Merchant"
        label.font = .systemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()
    
    private let merchantLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .black
        return label
    }()
    
    private let transactionIDTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "ID Transaksi"
        label.font = .systemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()
    
    private let transactionIDLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .black
        return label
    }()
    
    private let amountTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Total Pembayaran"
        label.font = .systemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()
    
    private let amountLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    private let confirmButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Konfirmasi Bayar", for: .normal)
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
        title = "Konfirmasi Pembayaran"
        view.backgroundColor = .white
        
        view.addSubview(merchantTitleLabel)
        view.addSubview(merchantLabel)
        view.addSubview(transactionIDTitleLabel)
        view.addSubview(transactionIDLabel)
        view.addSubview(amountTitleLabel)
        view.addSubview(amountLabel)
        view.addSubview(confirmButton)
    }
    
    private func setupLayout() {
        merchantTitleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(40)
            $0.leading.equalToSuperview().inset(24)
        }
        
        merchantLabel.snp.makeConstraints {
            $0.top.equalTo(merchantTitleLabel.snp.bottom).offset(4)
            $0.leading.equalToSuperview().inset(24)
        }
        
        transactionIDTitleLabel.snp.makeConstraints {
            $0.top.equalTo(merchantLabel.snp.bottom).offset(24)
            $0.leading.equalToSuperview().inset(24)
        }
        
        transactionIDLabel.snp.makeConstraints {
            $0.top.equalTo(transactionIDTitleLabel.snp.bottom).offset(4)
            $0.leading.equalToSuperview().inset(24)
        }
        
        amountTitleLabel.snp.makeConstraints {
            $0.top.equalTo(transactionIDLabel.snp.bottom).offset(24)
            $0.leading.equalToSuperview().inset(24)
        }
        
        amountLabel.snp.makeConstraints {
            $0.top.equalTo(amountTitleLabel.snp.bottom).offset(4)
            $0.leading.equalToSuperview().inset(24)
        }
        
        confirmButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(-24)
            $0.height.equalTo(56)
        }
    }
    
    private func setupAction() {
        confirmButton.addTarget(self, action: #selector(tappedConfirmButton), for: .touchUpInside)
    }
    
    @objc
    private func tappedConfirmButton() {
        presenter.didTapConfirmPayment()
    }
}

extension PaymentViewController: PaymentViewProtocol {
    
    func showPaymentSuccess(transaction: QRData, remainingBalance: Int) {
        merchantLabel.text = transaction.merchantName
        transactionIDLabel.text = transaction.transactionID
        amountLabel.text = FormatCurrency.format(transaction.amount)
    }
    
    func showPaymentFailed(message: String) {
        let alert = UIAlertController(title: "Gagal", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
