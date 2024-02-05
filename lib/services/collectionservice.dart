import 'package:shared_preferences/shared_preferences.dart';

class Collectionservice {


//collected functions

  static void addCardToCollected ({String collectionname = "default" ,required String set, required String collector_number}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> collectionlist = prefs.getStringList(collectionname) ?? [];
    print("Debug addCardToCollected, erhaltene Liste: $collectionlist");

    //check if List already contains Card

    if (!collectionlist.contains("set: $set, collector_number: $collector_number")){
    collectionlist.add("set: $set, collector_number: $collector_number");
    print("Debug addCardToCollected, erhaltene Liste nach add: $collectionlist");
    prefs.setStringList(collectionname, collectionlist);}

    else {print("Card is already marked as collected");}

}
static void removeCardFromCollected({String collectionname = "default", required String set, required String collector_number}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> collectionlist = prefs.getStringList(collectionname) ?? [];
    print("Debug removeCardfromCollected, erhaltene Liste: $collectionlist");
    try{   collectionlist.remove("set: $set, collector_number: $collector_number");}
 catch(e){print("error, $collectionname-$collector_number could not removed from collection\n"
     "Error: $e");}
    print("Debug remveCardFromCollected: $collectionlist");
    prefs.setStringList(collectionname, collectionlist);
}

//Collection functions

static void createCollection({required String collectionname}) async {
     SharedPreferences prefs = await SharedPreferences.getInstance();
     List<String> collections = prefs.getStringList("collections") ?? [];
     collections.add(collectionname);
}
static void removeCollection({required String collectionname}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> collections = prefs.getStringList("collections") ?? [];
    try{collections.remove(collectionname); }
        catch(e){
        print("Collection could not be removed!\n"
            "error: $e");
        }
    prefs.setStringList("collections", collections);
}

static Future<List<String>> getCollections() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List <String> collections = prefs.getStringList("collections") ?? [];
    return collections;
}

// wishlist function

static createWishList({required String wishlistname}) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String> wishlists =  prefs.getStringList("wishlists") ?? [];
      wishlists.add(wishlistname);
      prefs.setStringList("wishlists", wishlists);
}
static removeWishList({required String wishlistname}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> wishlists =  prefs.getStringList("wishlists") ?? [];
    wishlists.remove(wishlistname);
    prefs.setStringList("wishlists", wishlists);
}

static Future<List<String>> getWishLists() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> wishlists =  prefs.getStringList("wishlists") ?? [];
    return wishlists;
}

//Single Wishlist function

static addCardToWishlist({String wishlistname = "default", required String set, required String collectornumber }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> cards = prefs.getStringList(wishlistname) ?? [];
    cards.add("set: $set, collector_number: $collectornumber");

}
static removeCardFromWishlist({String wishlistname = "default", required String set, required String collectornumber }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> cards = prefs.getStringList(wishlistname) ?? [];
    cards.remove("set: $set, collector_number: $collectornumber");
}

static Future<List<String>> getCardsFromWishList ({String wishlistname = "default"}) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List <String> cards = prefs.getStringList(wishlistname) ?? [];
      return cards;
}

}