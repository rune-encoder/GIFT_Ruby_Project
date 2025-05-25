module AdminsHelper
  def sidebar_buttons
    [
      { icon: "home",     text: "Home",     menu: "home" },
      { icon: "list",     text: "Listings", menu: "products", disables: [ "products", "categories" ] },
      { icon: "truck",    text: "Orders",   menu: "orders" },
      { icon: "line-chart",    text: "Reports",  menu: "reports" },
      { icon: "users",    text: "Admins",   menu: "admins" }
    ]
  end
end
