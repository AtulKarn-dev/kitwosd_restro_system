enum FoodItemCategory {
  all,
  brunch,
  dinner,
  burgers,
  chinese,
  pizza,
  salads,
  soups,
  breakfast;

  String get value {
    switch (this) {
      case FoodItemCategory.all:
        return "all";
      case FoodItemCategory.brunch:
        return "br";
      case FoodItemCategory.dinner:
        return "d";
      case FoodItemCategory.burgers:
        return "b";
      case FoodItemCategory.chinese:
        return "c";
      case FoodItemCategory.pizza:
        return "p";
      case FoodItemCategory.salads:
        return "s";
      case FoodItemCategory.soups:
        return "sp";
      case FoodItemCategory.breakfast:
        return "brk";
    }
  }

  String get title {
    switch (this) {
      case FoodItemCategory.all:
        return "ALL";
      case FoodItemCategory.brunch:
        return "BRUNCH";
      case FoodItemCategory.dinner:
        return "DINNER";
      case FoodItemCategory.burgers:
        return "BURGERS";
      case FoodItemCategory.chinese:
        return "CHINESE";
      case FoodItemCategory.pizza:
        return "PIZZA";
      case FoodItemCategory.salads:
        return "SALADS";
      case FoodItemCategory.soups:
        return "SOUPS";
      case FoodItemCategory.breakfast:
        return "BREAKFAST";
    }
  }
}

enum FoodItemDietary {
  any,
  vegetarian,
  vegan,
  nonVeg;

  String get value {
    switch (this) {
      case FoodItemDietary.any:
        return 'ANY';
      case FoodItemDietary.vegetarian:
        return 'VEGETARIAN';
      case FoodItemDietary.vegan:
        return 'VEGAN';
      case FoodItemDietary.nonVeg:
        return 'NON-VEG';
    }
  }

  String get title {
    switch (this) {
      case FoodItemDietary.any:
        return 'ANY';
      case FoodItemDietary.vegetarian:
        return 'VEGETARIAN';
      case FoodItemDietary.vegan:
        return 'VEGAN';
      case FoodItemDietary.nonVeg:
        return 'NON-VEG';
    }
  }
}

enum FoodItemPrice {
  $,
  $$,
  $$$,
  $$$$;

  String get title {
    switch (this) {
      case FoodItemPrice.$:
        return '\$';
      case FoodItemPrice.$$:
        return '\$\$';
      case FoodItemPrice.$$$:
        return '\$\$\$';
      case FoodItemPrice.$$$$:
        return '\$\$\$\$';
    }
  }
}