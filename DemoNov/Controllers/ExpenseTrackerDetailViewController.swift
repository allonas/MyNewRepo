//
//  ExpenseTrackerDetailViewController.swift
//  DemoNov
//
//  This App has been generated using IBM Mobile UI Builder
//

import UIKit

class ExpenseTrackerDetailViewController: DataViewController<CategoriesDSItem> {
    
    var didSetupConstraints = false
	
	var imageView1: UIImageView!
	var textLabel2: UILabel!
	var textLabel3: UILabel!
	var textLabel3Button: UIButton!
	
	

	override init() {
        super.init()
        
        datasource = DatasourceManager.sharedInstance.CategoriesDS
        dataResponse = self
    }
	
	override func viewDidLoad() {
        super.viewDidLoad()

		AnalyticsManager.sharedInstance?.analytics?.logPage("{CategoriesDS.Title}")
		
		
		imageView1 = createImageView()
		addSubview(imageView1)	
		
		textLabel2 = createLabel()
		addSubview(textLabel2)	
		
		textLabel3 = createLabel(Style.sharedInstance.font(Fonts.Sizes.large, bold: false, italic: false), textColor: UIColor(rgb: 0x607d8b))
		addSubview(textLabel3)	
		
		textLabel3Button = createButton(Images.arrow)
        addSubview(textLabel3Button)
		 

        for behavior in self.behaviors {
            behavior.load()
        }
		
		updateViewConstraints()
		
		loadData()
	}
    
    override func updateViewConstraints() {
        
        if !didSetupConstraints {
            
            didSetupConstraints = true
            setupConstraints()
        }
        super.updateViewConstraints()
    }

	func setupConstraints() {
        
        let views:[String: UIView] = [
            "scrollView": scrollView,
            "contentView": contentView,
			"imageView1": imageView1,
			"textLabel2": textLabel2,
			"textLabel3": textLabel3,
			"textLabel3Button": textLabel3Button,
        ]
        
        let metrics:[String: CGFloat] = [
            "zero": Dimens.Margins.none,
            "margin": Dimens.Margins.large,
            "buttonSize": Dimens.Sizes.small
        ]
		
		contentView.removeConstraints(contentConstraints)
        scrollView.removeConstraints(scrollConstraints)
        view.removeConstraints(mainConstraints)
		
		scrollView.translatesAutoresizingMaskIntoConstraints = false
		mainConstraints.appendContentsOf(NSLayoutConstraint.constraintsWithVisualFormat("H:|[scrollView]|",
            options: .DirectionLeadingToTrailing,
            metrics: metrics,
            views: views))
        
        mainConstraints.appendContentsOf(NSLayoutConstraint.constraintsWithVisualFormat("V:|[scrollView]|",
            options: .DirectionLeadingToTrailing,
            metrics: metrics,
            views: views))
        
		contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollConstraints.appendContentsOf(NSLayoutConstraint.constraintsWithVisualFormat("H:|[contentView(==scrollView)]|",
            options: .DirectionLeadingToTrailing,
            metrics: metrics,
            views: views))
        
        scrollConstraints.appendContentsOf(NSLayoutConstraint.constraintsWithVisualFormat("V:|[contentView]|",
            options: .DirectionLeadingToTrailing,
            metrics: metrics,
            views: views))
			
		imageView1.translatesAutoresizingMaskIntoConstraints = false
		contentConstraints.appendContentsOf(NSLayoutConstraint.constraintsWithVisualFormat("H:|[imageView1]|",
            options: .DirectionLeadingToTrailing,
            metrics: metrics,
            views: views))
        
        contentConstraints.append(NSLayoutConstraint(item: imageView1,
            attribute: .CenterX,
            relatedBy: .Equal,
            toItem: contentView,
            attribute: .CenterX,
            multiplier: 1.0,
            constant: 0))
		textLabel2.translatesAutoresizingMaskIntoConstraints = false
        contentConstraints.appendContentsOf(NSLayoutConstraint.constraintsWithVisualFormat("H:|-margin-[textLabel2]-margin-|",
            options: .DirectionLeadingToTrailing,
            metrics: metrics,
            views: views))
		
		textLabel3.translatesAutoresizingMaskIntoConstraints = false
        contentConstraints.appendContentsOf(NSLayoutConstraint.constraintsWithVisualFormat("H:|-margin-[textLabel3]-margin-[textLabel3Button(buttonSize)]-margin-|",
            options: .DirectionLeadingToTrailing,
            metrics: metrics,
            views: views))
		
		textLabel3Button.translatesAutoresizingMaskIntoConstraints = false
        contentConstraints.appendContentsOf(NSLayoutConstraint.constraintsWithVisualFormat("V:[textLabel3Button(buttonSize)]",
            options: .DirectionLeadingToTrailing,
            metrics: metrics,
            views: views))
		
		contentConstraints.append(NSLayoutConstraint(item: textLabel3Button,
            attribute: .CenterY,
            relatedBy: .Equal,
            toItem: textLabel3,
            attribute: .CenterY,
            multiplier: 1.0,
            constant: 0))
			
		contentConstraints.appendContentsOf(NSLayoutConstraint.constraintsWithVisualFormat("V:|-margin-[imageView1]-margin-[textLabel2]-margin-[textLabel3]-(>=margin)-|",
            options: .DirectionLeadingToTrailing,
            metrics: metrics,
            views: views))

		view.addConstraints(mainConstraints)
        contentView.addConstraints(contentConstraints)
        scrollView.addConstraints(scrollConstraints)
	}
}

extension ExpenseTrackerDetailViewController: DataResponse {

    func success() {
        
        navigationItem.title = item?.title
        
 		imageView1.loadImage(datasource.imagePath(item?.icon), containerView: view)
		
		textLabel2.text = item?.dataField1
		
		textLabel3.text = String(format: "%@ expenses", item?.title ?? "")
		
		let expensesViewController = ExpensesViewController()
        expensesViewController.categoriesDSItem = item
        let expensesViewControllerAction = NavigationPushAction(rootViewController: self, destinationViewController: expensesViewController)
		
		setAction(expensesViewControllerAction, view: textLabel3)
		setAction(expensesViewControllerAction, view: textLabel3Button)
		 
       
    }
    
    func failure(error: NSError?) {
        ErrorManager.show(error, rootController: self)
    }
}


