import 'package:base_project/core/constants/app_images.dart';

class CoursesViewModel {
  final String categoryName;
  final List<Course> courses;

  const CoursesViewModel({
    required this.categoryName,
    required this.courses,
  });

  static const List<CoursesViewModel> coursesList = [
    CoursesViewModel(
      categoryName: "For You",
      courses: [
        Course(
          title: "Positive Power",
          description: "Unlock the strength of positivity and transform challenges into opportunities.",
          backgroundImage: AppImages.courseBackgroundImage8,
          duration: "04:20 hr / 5 lessons",
          timeLine: TimeLine(minutes: 4, seconds: 20),
        ),
        Course(
          title: "Think Positive",
          description: "Train your mind to focus on growth, gratitude, and the brighter side of life.",
          backgroundImage: AppImages.courseBackgroundImage7,
          duration: "03:15 hr / 4 lessons",
          timeLine: TimeLine(minutes: 3, seconds: 15),
        ),
        Course(
          title: "Optimism 101",
          description: "Learn the science and habits of optimism to boost your daily happiness.",
          backgroundImage: AppImages.courseBackgroundImage6,
          duration: "04:15 hr / 3 lessons",
          timeLine: TimeLine(minutes: 4, seconds: 15),
        ),
        Course(
          title: "Mindset Shift",
          description: "Rewire your thinking patterns to unlock new levels of success and confidence.",
          backgroundImage: AppImages.courseBackgroundImage5,
          duration: "06:15 hr / 1 lessons",
          timeLine: TimeLine(minutes: 6, seconds: 15),
        ),
        Course(
          title: "Stay Positive",
          description: "Practical strategies to stay motivated and upbeat, even in tough times.",
          backgroundImage: AppImages.courseBackgroundImage4,
          duration: "06:00 hr / 1 lessons",
          timeLine: TimeLine(minutes: 6, seconds: 0),
        ),
        Course(
          title: "Bright Thinking",
          description: "Develop a clear, constructive mindset that lights the way forward.",
          backgroundImage: AppImages.courseBackgroundImage3,
          duration: "05:00 hr / 1 lessons",
          timeLine: TimeLine(minutes: 5, seconds: 0),
        ),
        Course(
          title: "Positive Path",
          description: "Step-by-step guidance to create a fulfilling, positive lifestyle.",
          backgroundImage: AppImages.courseBackgroundImage2,
          duration: "01:00 hr / 2 lessons",
          timeLine: TimeLine(minutes: 1, seconds: 0),
        ),
        Course(
          title: "Good Vibes",
          description: "Boost your mood and spread energy that uplifts everyone around you.",
          backgroundImage: AppImages.courseBackgroundImage1,
          duration: "00:40 hr / 2 lessons",
          timeLine: TimeLine(minutes: 0, seconds: 40),
        ),
      ],
    ),

    CoursesViewModel(
      categoryName: "Financial",
      courses: [
        Course(
          title: "Smart Money",
          description: "Master money management skills that keep your finances stress-free.",
          backgroundImage: AppImages.courseBackgroundImage1,
          duration: "02:30 hr / 3 lessons",
          timeLine: TimeLine(minutes: 2, seconds: 30),
        ),
        Course(
          title: "Wealth Habits",
          description: "Daily habits and routines that lead to long-term financial freedom.",
          backgroundImage: AppImages.courseBackgroundImage2,
          duration: "03:45 hr / 4 lessons",
          timeLine: TimeLine(minutes: 3, seconds: 45),
        ),
        Course(
          title: "Money Mindset",
          description: "Reprogram how you think about money to attract success and abundance.",
          backgroundImage: AppImages.courseBackgroundImage3,
          duration: "01:20 hr / 2 lessons",
          timeLine: TimeLine(minutes: 1, seconds: 20),
        ),
        Course(
          title: "Finance Basics",
          description: "Learn the essentials of budgeting, saving, and smart spending.",
          backgroundImage: AppImages.courseBackgroundImage4,
          duration: "04:10 hr / 5 lessons",
          timeLine: TimeLine(minutes: 4, seconds: 10),
        ),
        Course(
          title: "Invest Smart",
          description: "Understand risk, returns, and strategies to grow your wealth safely.",
          backgroundImage: AppImages.courseBackgroundImage5,
          duration: "05:25 hr / 6 lessons",
          timeLine: TimeLine(minutes: 5, seconds: 25),
        ),
        Course(
          title: "Budget Better",
          description: "Simple, effective techniques to control spending and save more.",
          backgroundImage: AppImages.courseBackgroundImage6,
          duration: "02:15 hr / 3 lessons",
          timeLine: TimeLine(minutes: 2, seconds: 15),
        ),
        Course(
          title: "Rich Thinking",
          description: "Adopt the mindset and strategies of the world’s wealthiest people.",
          backgroundImage: AppImages.courseBackgroundImage7,
          duration: "06:40 hr / 7 lessons",
          timeLine: TimeLine(minutes: 6, seconds: 40),
        ),
        Course(
          title: "Grow Wealth",
          description: "Plan, execute, and expand your income with proven wealth strategies.",
          backgroundImage: AppImages.courseBackgroundImage8,
          duration: "03:05 hr / 4 lessons",
          timeLine: TimeLine(minutes: 3, seconds: 5),
        ),
      ],
    ),

    CoursesViewModel(
      categoryName: "Self Improvement",
      courses: [
        Course(
          title: "Daily Growth",
          description: "Practical routines to ensure steady personal and professional growth.",
          backgroundImage: AppImages.courseBackgroundImage5,
          duration: "01:15 hr / 2 lessons",
          timeLine: TimeLine(minutes: 1, seconds: 15),
        ),
        Course(
          title: "Better You",
          description: "Self-improvement methods to become the best version of yourself.",
          backgroundImage: AppImages.courseBackgroundImage4,
          duration: "02:30 hr / 3 lessons",
          timeLine: TimeLine(minutes: 2, seconds: 30),
        ),
        Course(
          title: "Mind Upgrade",
          description: "Boost mental clarity and learn skills that upgrade your life toolkit.",
          backgroundImage: AppImages.courseBackgroundImage3,
          duration: "03:45 hr / 4 lessons",
          timeLine: TimeLine(minutes: 3, seconds: 45),
        ),
        Course(
          title: "Focus Mode",
          description: "Learn deep focus strategies to eliminate distractions and get more done.",
          backgroundImage: AppImages.courseBackgroundImage2,
          duration: "04:20 hr / 5 lessons",
          timeLine: TimeLine(minutes: 4, seconds: 20),
        ),
        Course(
          title: "Life Skills",
          description: "Essential skills for communication, resilience, and everyday success.",
          backgroundImage: AppImages.courseBackgroundImage1,
          duration: "05:10 hr / 6 lessons",
          timeLine: TimeLine(minutes: 5, seconds: 10),
        ),
        Course(
          title: "Goal Getter",
          description: "Set ambitious goals and create actionable plans to achieve them.",
          backgroundImage: AppImages.courseBackgroundImage6,
          duration: "06:00 hr / 7 lessons",
          timeLine: TimeLine(minutes: 6, seconds: 0),
        ),
        Course(
          title: "Discipline Path",
          description: "Develop strong habits and discipline to stay consistent long-term.",
          backgroundImage: AppImages.courseBackgroundImage7,
          duration: "02:50 hr / 3 lessons",
          timeLine: TimeLine(minutes: 2, seconds: 50),
        ),
        Course(
          title: "Self Mastery",
          description: "Gain control over your emotions, habits, and mindset for lasting growth.",
          backgroundImage: AppImages.courseBackgroundImage8,
          duration: "03:30 hr / 4 lessons",
          timeLine: TimeLine(minutes: 3, seconds: 30),
        ),
      ],
    ),

  ];
}

class Course {
  final String title;
  final String description;
  final String backgroundImage;
  final String duration; // e.g. "03:10 hr / 3 lessons"
  final TimeLine timeLine;

  const Course({
    required this.title,
    required this.description,
    required this.backgroundImage,
    required this.duration,
    required this.timeLine,
  });
}

class TimeLine {
  final int minutes;
  final int seconds;

  const TimeLine({
    required this.minutes,
    required this.seconds,
  });
}
