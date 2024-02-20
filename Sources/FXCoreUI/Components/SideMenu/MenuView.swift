//
//  File.swift
//  
//
//  Created by Ansyar Hafid on 07/02/24.
//

import UIKit

public protocol MenuViewDelegate: AnyObject {
    func menuViewDidSelectItem(item: MenuItem)
}

public struct MenuItem: Hashable {
    public let leftImage: UIImage?
    public let title: String?
    public let subtitle: String?
    public let rightImage: UIImage?
    
    public var onTap: (() -> Void)?
    
    public init(leftImage: UIImage? = nil, 
                title: String? = nil,
                subtitle: String? = nil,
                rightImage: UIImage? = nil,
                onTap: (() -> Void)? = nil) {
        self.leftImage = leftImage
        self.title = title
        self.subtitle = subtitle
        self.rightImage = rightImage
        self.onTap = onTap
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(title)
        hasher.combine(subtitle)
    }
    
    public static func == (lhs: MenuItem, rhs: MenuItem) -> Bool {
        return lhs.title == rhs.title && lhs.subtitle == rhs.subtitle
    }
}


public class MenuView: UIView, UITableViewDelegate {
    
    typealias DataSource = UITableViewDiffableDataSource<Int, MenuItem>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, MenuItem>
    
    private var tableView: UITableView!
    private var dataSource: DataSource!
    
    public weak var delegate: MenuViewDelegate?
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        configureTableView()
        configureDataSource()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureTableView() {
        tableView = UITableView(frame: bounds, style: .plain)
        tableView.delegate = self
        tableView.register(MenuCell.nib, forCellReuseIdentifier: MenuCell.identifier)
        addSubview(tableView)
        tableView.cornerRadius(16, cornerType: .allBottom)
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leftAnchor.constraint(equalTo: leftAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: rightAnchor)
        ])
    }
    
    private func configureDataSource() {
        dataSource = DataSource(tableView: tableView, cellProvider: { (tableView, indexPath, menuItem) -> UITableViewCell? in
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MenuCell.identifier,
                                                           for: indexPath) as? MenuCell else { return UITableViewCell() }
            if let leftimage = menuItem.leftImage {
                cell.leftIcon.isHidden = false
                cell.leftIcon.image = leftimage
            }
            
            cell.title.text = menuItem.title
            
            if let subtitle = menuItem.subtitle {
                cell.subTitle.isHidden = false
                cell.subTitle.text = subtitle
            }
            
            if let rightImage = menuItem.rightImage {
                cell.rightIcon.isHidden = false
                cell.rightIcon.image = rightImage
            }
            
            return cell
        })
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let index = tableView.indexPathForSelectedRow,
                let selectedItem = dataSource.itemIdentifier(for: index) else {
            return
        }
        delegate?.menuViewDidSelectItem(item: selectedItem)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    public func updateItems(_ items: [MenuItem]) {
        var snapshot = Snapshot()
        snapshot.appendSections([0])
        snapshot.appendItems(items)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}

