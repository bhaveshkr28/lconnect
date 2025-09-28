class GroupModel {
  final String name;
  final String subtitle;
  final String image;

  GroupModel({
    required this.name,
    required this.subtitle,
    required this.image,
  });
}


final List<GroupModel> groups = [
  GroupModel(
    name: "Coding",
    subtitle: "Discuss coding, tips & projects",
    image: "assets/coding.png",
  ),
  GroupModel(
    name: "Event",
    subtitle: "All about upcoming events",
    image: "assets/event.png",
  ),
  GroupModel(
    name: "Gaming",
    subtitle: "Find gaming buddies here",
    image: "assets/gaming.png",
  ),
  GroupModel(
    name: "Sports",
    subtitle: "Talk about cricket, football & more",
    image: "assets/sports.png",
  ),
  GroupModel(
    name: "Confession",
    subtitle: "Share your confessions anonymously",
    image: "assets/confession.png",
  ),
  GroupModel(
    name: "Random",
    subtitle: "Anything and everything goes here",
    image: "assets/random.png",
  ),
];
