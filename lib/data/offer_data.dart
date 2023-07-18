
class Offer {
  final String description;
  final String currentPrice;
  final String offerPrice;
  final String startDate;
  final String endDate;
  // final String name;
  // final int percent;

  Offer(this.description,this.currentPrice,this.offerPrice,this.startDate,this.endDate);

  static List<Offer> offers = [];

  static List<Offer> getOffers() {
    return offers;
  }
  static void addOffer(Offer o) {
    offers.add(o);
    print(offers);
  }
}