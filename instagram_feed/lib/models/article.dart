class Article {
  int id;
  String avatar;
  String name;
  String image;
  int likeCount;
  String content;
  String dateAgo;
  bool isSeen;

  Article({
    required this.id,
    required this.avatar,
    required this.name,
    required this.image,
    required this.likeCount,
    required this.content,
    required this.dateAgo,
    required this.isSeen,
  });
}

List<Article> articleList = [
  Article(
    id: 1,
    avatar: 'assets/images/avatar_2.jpeg',
    name: 'skrillex',
    image: 'assets/images/img_2.jpeg',
    likeCount: 512343,
    dateAgo: '1 hours ago',
    isSeen: false,
    content: 'Was it love that made you go so hard ?',
  ),
  Article(
    id: 1,
    avatar: 'assets/images/my_avatar.jpeg',
    name: 'cody0203',
    image: 'assets/images/my_img.jpeg',
    likeCount: 3,
    dateAgo: '3 hours ago',
    isSeen: true,
    content: '30 chưa phải là Tết',
  ),
  Article(
    id: 1,
    avatar: 'assets/images/avatar_1.jpeg',
    name: 'andreerighthand',
    image: 'assets/images/img_1.jpeg',
    likeCount: 304,
    dateAgo: '1 day ago',
    isSeen: false,
    content:
        'Xem thu xếp nợ tiền trả anh sớm \nCòn nợ tình thì sau 11h tối nhé',
  ),
  Article(
    id: 1,
    avatar: 'assets/images/avatar_3.jpeg',
    name: 'palladiumvietnam',
    image: 'assets/images/img_3.jpeg',
    likeCount: 44,
    dateAgo: '1 day ago',
    isSeen: true,
    content:
        'Trải nghiệm dòng giày mang phong cách thời trang bền vững bên chi tiết viền đế màu cam phản quang.',
  ),
  Article(
    id: 1,
    avatar: 'assets/images/avatar_4.jpeg',
    name: 'freakers.vie',
    image: 'assets/images/img_4.jpeg',
    likeCount: 78,
    dateAgo: '2 day ago',
    isSeen: true,
    content: 'Sản phẩm đặc biệt cho đợt pop-up sale. ',
  ),
];
