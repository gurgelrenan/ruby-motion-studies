class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @user = User.load
    @user ||= User.new(id: "123", name: "Renan",
        email: "renan@example.com", phone: "8710-5652")
    @user_controller = UserController.alloc.initWithUser(@user)
    @nav_controller = 
      UINavigationController.alloc.initWithRootViewController(@user_controller)
    @window.rootViewController = @nav_controller
    @window.makeKeyAndVisible          
    true
  end

  def applicationDidEnterBackground(application)
    @user.save
  end
end
