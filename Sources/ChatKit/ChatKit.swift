
import SendbirdUIKit
import UIKit

public struct ChatKit {
    public private(set) var text = "Hello, World!"

    public init() {

    }
    
    public init(appId: String, userId:String, nickName:String, profileURL:String, accessToken: String) {
        SendbirdUI.initialize(applicationId: appId) { // This is the origin.
            // Initialization of SendbirdUIKit has started.
            // Show a loading indicator.
        } migrationHandler: {
            // DB migration has started.
        } completionHandler: { error in
            // If DB migration is successful, proceed to the next step.
            // If DB migration fails, an error exists.
            // Hide the loading indicator.
        }

        // Case 1: USER_ID only
        //SBUGlobals.currentUser = SBUUser(userId: userId)

        // Case 2: Specify all fields
        SBUGlobals.currentUser = SBUUser(userId: userId, nickname:nickName, profileURL:profileURL)
        SBUGlobals.accessToken = accessToken;
    }
    
    public func showChannelList(viewController: UIViewController) {
        let params = GroupChannelListQueryParams()
        params.includeEmptyChannel = false
        params.includeFrozenChannel = true
        let channelListQuery = GroupChannel.createMyGroupChannelListQuery(params: params)

        let channelListVC = CKSBUChannelListViewController(channelListQuery: channelListQuery)
        let navigationController = UINavigationController(rootViewController: channelListVC)
        viewController.present(navigationController, animated: true)
    }
}
