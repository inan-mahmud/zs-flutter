class MenuModel {
  MenuModel({
    this.id,
    this.name,
    this.menus,
    this.weight,
  });

  int id;
  String name;
  List<Menu> menus;
  int weight;

  factory MenuModel.fromJson(Map<String, dynamic> json) => MenuModel(
    id: json["id"],
    name: json["name"],
    menus: List<Menu>.from(json["menus"].map((x) => Menu.fromJson(x))),
    weight: json["weight"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "menus": List<dynamic>.from(menus.map((x) => x.toJson())),
    "weight": weight,
  };
}

class Menu {
  Menu({
    this.id,
    this.title,
    this.slug,
    this.price,
    this.ingredientLists,
    this.specialNotes,
    this.photo,
    this.dineIn,
    this.takeaway,
    this.addonCategories,
  });

  int id;
  String title;
  String slug;
  String price;
  String ingredientLists;
  String specialNotes;
  String photo;
  bool dineIn;
  bool takeaway;
  List<AddonCategory> addonCategories;

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
    id: json["id"],
    title: json["title"],
    slug: json["slug"],
    price: json["price"],
    ingredientLists: json["ingredient_lists"],
    specialNotes: json["special_notes"],
    photo: json["photo"],
    dineIn: json["dine_in"],
    takeaway: json["takeaway"],
    addonCategories: List<AddonCategory>.from(json["addon_categories"].map((x) => AddonCategory.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "slug": slug,
    "price": price,
    "ingredient_lists": ingredientLists,
    "special_notes": specialNotes,
    "photo": photo,
    "dine_in": dineIn,
    "takeaway": takeaway,
    "addon_categories": List<dynamic>.from(addonCategories.map((x) => x.toJson())),
  };
}

class AddonCategory {
  AddonCategory({
    this.id,
    this.menu,
    this.category,
    this.isMandatory,
    this.minimumRequired,
    this.maximumAllowed,
    this.addOnItems,
  });

  int id;
  int menu;
  Category category;
  bool isMandatory;
  int minimumRequired;
  int maximumAllowed;
  List<dynamic> addOnItems;

  factory AddonCategory.fromJson(Map<String, dynamic> json) => AddonCategory(
    id: json["id"],
    menu: json["menu"],
    category: Category.fromJson(json["category"]),
    isMandatory: json["is_mandatory"],
    minimumRequired: json["minimum_required"],
    maximumAllowed: json["maximum_allowed"],
    addOnItems: List<dynamic>.from(json["add_on_items"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "menu": menu,
    "category": category.toJson(),
    "is_mandatory": isMandatory,
    "minimum_required": minimumRequired,
    "maximum_allowed": maximumAllowed,
    "add_on_items": List<dynamic>.from(addOnItems.map((x) => x)),
  };
}

class Category {
  Category({
    this.id,
    this.name,
  });

  int id;
  String name;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
