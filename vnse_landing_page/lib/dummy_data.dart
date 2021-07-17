import 'entities/engage.dart';
import 'entities/engage_part.dart';
import 'entities/podcast.dart';

final List<EngagePart> engages = [
  EngagePart(
    title: 'Events',
    feature: Engage(
      thumbnail: 'assets/images/talk_space_10.png',
      title: 'TalkSpace #10 x Hack4Growth: Rethinking Failure | Linh Nguyen',
      publishedAt: 'Sat, 10 Jul',
    ),
    subTitle: 'Other Events',
    engages: [
      Engage(
        thumbnail: 'assets/images/hack4grow2.png',
        title: 'TalkSpace #9: What Does It Take To Be A Go...',
        publishedAt: 'Sat, 10 Jul',
      ),
      Engage(
        thumbnail: 'assets/images/hack4grow.png',
        title: 'HACK4GROWTH EUROPE- \nCountdown  To ...',
        publishedAt: 'Sat, 22 May',
      ),
      Engage(
        thumbnail: 'assets/images/hack4grow2.png',
        title: 'Webinar A Giant Leap into the \nUnknown - Hack...',
        publishedAt: 'Sat, 10 Jul',
      ),
    ],
  ),
  EngagePart(
    title: 'Blogs',
    feature: Engage(
      thumbnail: 'assets/images/blog_feature.png',
      title: 'From Initiation to Empowerment | N. Anh Tran',
      publishedAt: 'Sat, 10 Jul',
    ),
    subTitle: 'Other Blogs',
    engages: [
      Engage(
        thumbnail: 'assets/images/hack4grow2.png',
        title: 'TalkSpace #9: What Does It Take To Be A Go...',
        publishedAt: 'Sat, 10 Jul',
      ),
      Engage(
        thumbnail: 'assets/images/hack4grow.png',
        title: 'HACK4GROWTH EUROPE- \nCountdown  To ...',
        publishedAt: 'Sat, 22 May',
      ),
      Engage(
        thumbnail: 'assets/images/hack4grow2.png',
        title: 'Webinar A Giant Leap into the \nUnknown - Hack...',
        publishedAt: 'Sat, 10 Jul',
      ),
    ],
  ),
];

final List<Podcast> podcasts = [
  Podcast(
    thumbnail: 'assets/images/podcast1.png',
    title: 'Episode 3',
    description: 'Một nghề cho chín...',
  ),
  Podcast(
    thumbnail: 'assets/images/podcast2.png',
    title: 'Episode 2',
    description: 'Energy exchange market...',
  ),
];
