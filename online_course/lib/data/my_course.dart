import 'package:online_course/domain/entities/course.dart';

final List<Course> allCourses = [
  Course(
    thumbnail: 'assets/images/product_branding_course.png',
    rating: 5,
    progress: '14 Level',
    title: 'Product branding class',
    totalLesson: 24,
  ),
  Course(
    thumbnail: 'assets/images/copywriting_course.png',
    rating: 4,
    progress: '8 Level',
    title: 'Copywritting class',
    totalLesson: 24,
  ),
  Course(
    thumbnail: 'assets/images/video_editing_course.png',
    rating: 5,
    progress: 'Completed',
    title: 'Video editing class',
    totalLesson: 32,
  ),
];

final List<Course> completedCourses = [
  Course(
    thumbnail: 'assets/images/video_editing_course.png',
    rating: 5,
    progress: 'Completed',
    title: 'Video editing class',
    totalLesson: 32,
  ),
  Course(
    thumbnail: 'assets/images/interior_course.png',
    rating: 4,
    progress: 'Completed',
    title: 'Interior design',
    totalLesson: 15,
  ),
  Course(
    thumbnail: 'assets/images/development_course.jpeg',
    rating: 5,
    progress: 'Completed',
    title: 'Fundamental Engineering ',
    totalLesson: 43,
  ),
];
