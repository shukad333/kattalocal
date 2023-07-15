
class Offer {
  final String name;
  final int percent;

  Offer(this.name,this.percent);

  static List<Offer> offers = [];

  static List<Offer> getOffers() {
    return offers;
  }
  static void addOffer(Offer o) {
    offers.add(o);
    print(offers);
  }
}