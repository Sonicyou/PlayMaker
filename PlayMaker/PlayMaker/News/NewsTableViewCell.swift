//
//  NewsTableViewCell.swift
//  PlayMaker
//
//  Created by Артем Фролов on 21.06.2021.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    private let authorLabel = UILabel()
    private let title = UILabel()
    private let descriptionLabel = UILabel()
    private let sourceLabel = UILabel()
    private let publishedTimeLabel = UILabel()
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(text: String?) {
        title.text = text
        authorLabel.text = "Michael Jackson"
        title.text = "The end of COVID-19"
        descriptionLabel.text = "Ssjdfnjsndf sdkfndkjsf djfndjnfsk wejq wlkmxznc wqlekmqkw sldkmsada wqlkelkqwnd asdnlsakdm aslkdksn dsniw wije wkene dnd ddmd ddkdn fdskfnd dkfnsd dfkds dksdfn dfkdsnf dfndkfs dkfdfn lkjsdfk dkfnd dkfndsf kslnfd dkfkdf nkdfnknd lsdkf kdnfkn fkdnfnf"
        sourceLabel.text = "BBC News"
        publishedTimeLabel.text = "April 1, 2020"
    }
    
    private func configureUI() {
        [authorLabel, title, descriptionLabel, sourceLabel, publishedTimeLabel].forEach {
            contentView.addSubview($0)
        }
        descriptionLabel.numberOfLines = 4
        selectionStyle = .none
    }
    
    private func configureLayout() {
        sourceLabel.snp.makeConstraints { make in
            make.top.leading.equalTo(15)
        }
        
        title.snp.makeConstraints { make in
            make.top.equalTo(sourceLabel.snp.bottom).offset(20)
            make.leading.equalTo(15)
            make.width.equalTo(250)
        }
        
        publishedTimeLabel.snp.makeConstraints { make in
            make.top.equalTo(15)
            make.trailing.equalTo(-15)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(title.snp.bottom).offset(20)
            make.leading.equalTo(15)
            make.trailing.equalTo(-15)
        }
        
        authorLabel.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(20)
            make.leading.equalTo(15)
            make.bottom.equalTo(-15)
            make.width.equalTo(250)
        }
        
    }
    
}
