//
//  FieldTableViewCell.swift
//  PlayMaker
//
//  Created by Артем Фролов on 12.04.2021.
//

import UIKit

protocol FieldTableViewCellProtocol: AnyObject {
    func notificationChanged(value: Bool)
}

class FieldTableViewCell: UITableViewCell {

    weak var delegate: FieldTableViewCellProtocol?
    private let iconImageView = UIImageView()
    private let titleLabel = UILabel()
    private let subTitleLabel = UILabel()
    private let indicatorImageView = UIImageView()
    private let notificationSwitch = UISwitch()
    private let separatorView = UIView()
    private let segmentedPicker = UISegmentedControl(items: ["°C","°F"])
    private let datePicker = UIDatePicker()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(_ field: Field, _ isOn: Bool?) {
        iconImageView.image = UIImage(named: field.image)?.withRenderingMode(.alwaysTemplate)
        iconImageView.tintColor = .lightGray
        if let nextImage = field.nextImage {
            indicatorImageView.image = UIImage(named: nextImage)?.withRenderingMode(.alwaysTemplate)
            indicatorImageView.tintColor = UIColor.black.withAlphaComponent(0.15)
        }
        titleLabel.text = NSLocalizedString(field.title, comment: "")
        subTitleLabel.text = field.subtitle
        notificationSwitch.isHidden = field.switchField == nil
        segmentedPicker.isHidden = field.picker == nil
        datePicker.isHidden = field.datePicker == nil
        datePicker.datePickerMode = .date
        datePicker.backgroundColor = UIColor.white
        datePicker.locale = Locale.current
        notificationSwitch.isOn = isOn ?? false
//        datePicker.preferredDatePickerStyle = .wheels
    }
    
    private func configureUI() {
        [iconImageView, titleLabel, subTitleLabel, separatorView, indicatorImageView, notificationSwitch, segmentedPicker, datePicker]
            .forEach { contentView.addSubview($0) }
        selectionStyle = .none
        separatorView.backgroundColor = UIColor.black.withAlphaComponent(0.1)
        titleLabel.numberOfLines = .zero
        notificationSwitch.addTarget(self, action: #selector(switchChanged), for: .valueChanged)
        datePicker.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
        datePicker.frame  = CGRect(origin: .zero, size: frame.size)
    }
    
    private func configureLayout() {
        separatorView.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.leading.equalTo(iconImageView.snp.trailing).offset(10)
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        iconImageView.snp.makeConstraints { make in
            make.top.leading.equalTo(10)
            make.size.equalTo(25)
        }
        
        indicatorImageView.snp.makeConstraints { make in
            make.trailing.equalTo(-15)
            make.centerY.equalToSuperview()
            make.size.equalTo(15)
        }
        
        notificationSwitch.snp.makeConstraints { make in
            make.trailing.equalTo(-15)
            make.centerY.equalToSuperview()
        }
        
        datePicker.snp.makeConstraints { make in
            make.trailing.equalTo(-15)
            make.centerY.equalToSuperview()
//            make.width.equalTo(280)
            make.height.equalTo(60)
        }
        
        segmentedPicker.snp.makeConstraints { make in
            make.trailing.equalTo(-15)
            make.centerY.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(iconImageView.snp.trailing).offset(10)
            make.top.equalTo(25)
            make.bottom.equalTo(-25)
            make.trailing.equalTo(indicatorImageView.snp.leading).offset(-10)
        }
    }
    
    @objc private func switchChanged(switch: UISwitch) {
        delegate?.notificationChanged(value: notificationSwitch.isOn)
        print (notificationSwitch.isOn)
    }
    
    @objc private func datePickerValueChanged(_ sender: UIDatePicker){
            
            // Create date formatter
            let dateFormatter: DateFormatter = DateFormatter()
            
            // Set date format
            dateFormatter.dateFormat = "MM/dd/yyyy"
            
            // Apply date format
            let selectedDate: String = dateFormatter.string(from: sender.date)
            
            print("Selected value \(selectedDate)")
        }
    
}
