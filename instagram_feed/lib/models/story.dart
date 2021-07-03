class Story {
  int id;
  String avatar;
  String name;
  bool isSeen;

  Story({
    required this.id,
    required this.avatar,
    required this.name,
    required this.isSeen,
  });
}

List<Story> storyList = [
  Story(
    id: 1,
    avatar: 'assets/images/avatar_1.jpeg',
    name: 'andreerighthand',
    isSeen: false,
  ),
  Story(
    id: 2,
    avatar: 'assets/images/avatar_2.jpeg',
    name: 'skrillex',
    isSeen: false,
  ),
  Story(
    id: 3,
    avatar: 'assets/images/avatar_3.jpeg',
    name: 'palladiumvietnam',
    isSeen: true,
  ),
  Story(
    id: 4,
    avatar: 'assets/images/avatar_4.jpeg',
    name: 'freakers.vie',
    isSeen: false,
  ),
];
