import 'package:base_project/core/constants/app_strings.dart';
import 'package:get/get.dart';

class LocaleString extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      //===================================Onboarding View==============================================================
      "Start Your Self Improvement Journey Today!": AppStrings.startYourSelfImprovement,
      "Setting Goals Is Easy, Achieving Them- ": AppStrings.settingGoalsIsEasy,
      "That's Where We Shine.": AppStrings.thatWhereWeShine,
      "Ditch The Fear, Embrace Change,": AppStrings.ditchTheFear,
      "And Get Ready To Transform!": AppStrings.andGetReadyTo,
      "Next": "Next",
      //===================================Onboarding View 2=========================================================
      "Your Journey, Your Success": AppStrings.yourJourney,
      "Everyone's Journey Is Unique,": AppStrings.everyoneJourney,
      "Choose Your Goals,": AppStrings.chooseYourGoals,
      "Let Us Customize Your Personalized \nExperience":          AppStrings.letUsCustomize,
      //====================================Otp Verfication and Phone Login View==========================================
      "Phone": "Phone",
      "Login": "Login",
      "verification": "verification",
      "Enter Your Verification Code": "Enter Your Verification Code",
      "Invalid code. Enter the correct verification code":"Invalid code. Enter the correct verification code",
      "Didn't receive the code? Resend it now":"Didn't receive the code? Resend it now",
      "OK": "OK",
      //========================================Profile View======================================================================
      "My Profile": "My Profile",
      "First Name": "First Name",
      'Or': 'Or',
      'Last Name': 'Last Name',
      'Hajim': 'Hajim',
      'Date of birth': 'Date of birth',
      'Gender':'Gender',
      'Male': 'Male',
      'Female': 'Female',
      'Other': 'Other',
      'Email': 'Email',
      'Add a profile image':'Add a profile image',
      'I\'ve read this text & you want to receive promotional emails & messages from Pusher':'I\'ve read this text & you want to receive promotional emails & messages from Pusher',
      'Sign Up': 'Sign Up',
      'By clicking “Sign up״ button below':'By clicking “Sign up״ button below, you are agreeing to our terms of use, opening an account with Pusher, and acknowledging you have read our privacy policy',
      'Delete Account':'Delete Account',
      'Are you sure you want to delete your account? This action cannot be undone.':'Are you sure you want to delete your account? This action cannot be undone.',
      'Cancel':'Cancel',
      'Delete':'Delete',

      //====================================  Improvement View===================================
      'Please select at least one category to improve':'Please select at least one category to improve',
      'Fitness': 'Fitness',
      'Relationship': 'Relationship',
      'Motivation': 'Motivation',
      'Financial': 'Financial',
      'Social': 'Social',
      'Balance': 'Balance',
      'Selected categories': 'Selected categories',
      'Selected': 'Selected',
      //==================================Personal Goals view====================================
      'fitness': 'fitness',
      'title': 'title',
      'What\'s Your Fitness Goals ?': 'What\'s Your Fitness Goals ?',
      'icon': 'icon',
      'goals': 'goals',
      'Improve fitness': 'Improve fitness',
      'Start a new sport': 'Start a new sport',
      'Build muscle mass': 'Build muscle mass',
      'Lose weight': 'Lose weight',
      'motivation': 'motivation',
      'What\'s Your Motivation Goals ?': 'What\'s Your Motivation Goals ?',
      'Find sense of inspiration': 'Find sense of inspiration',
      'Avoid procrastination': 'Avoid procrastination',
      'Improve planning and organization': 'Improve planning and organization',
      'Set realistic goals': 'Set realistic goals',
      'relationship': 'relationship',
      'What\'s Your Relationship Goals ?': 'What\'s Your Relationship Goals ?',
      'Improve communication': 'Improve communication',
      'Spend more quality time together': 'Spend more quality time together',
      'Resolve issues and strengthen the bond':'Resolve issues and strengthen the bond',
      'Learn and grow as a couple': 'Learn and grow as a couple',
      'You can select up to 3 goals per category':'You can select up to 3 goals per category',
      'Please select at least one goal': 'Please select at least one goal',
      'Selected Goals by Category:': 'Selected Goals by Category',
      //================================Premium View===================================================================================
      'Premium': 'Premium',
      'Say Hello To Your Best Self.': 'Say Hello To Your Best Self.',
      'Get The Complete Progress For Yourself With':'Get The Complete Progress For Yourself With',
      'Premium Challenges': 'Premium Challenges',
      'Unlock Extra Challenges For 30 Days':'Unlock Extra Challenges For 30 Days',
      'Unlock Access For Pusher Courses': 'Unlock Access For Pusher Courses',
      'Upgrade 20\$': 'Upgrade 20\$',
      'Pusher VIP': 'Pusher VIP',
      'Unlock Extra Challenges For 20 Days':'Unlock Extra Challenges For 20 Days',
      'Unlock Mentor Challenge': 'Unlock Mentor Challenge',
      'Upgrade 50\$': 'Upgrade 50\$',
      'Continue With 7-Day Challenge Trial': 'Continue With 7-Day Challenge Trial',

      //===============================Well Done View=======================================
      'Well Done':'Well Done',
      'We hope you got some \nmotivation today':'We hope you got some \nmotivation today',
      'Upgrade Now':'Upgrade Now',

      //===============================Notification View=====================================
      'Notifications':'Notifications',
      'TODAY':'TODAY',
      'YESTERDAY':'YESTERDAY',

      //==============================="Motivation Video View================================
      "Motivation Video Mix":"Motivation Video Mix",
      "All Videos":"All Videos",
      '"Change Your Mind"':'"Change Your Mind"',
      'By Sam Mor - Mental Adviser':'By Sam Mor - Mental Adviser',

      //====================================Daily Goals view==================================
      'Daily Challenge':'Daily Challenge',
      'choose':'choose',
      ' One':' One',
      '\nchallenge for today':'\nchallenge for today',
      '5 Minute':'5 Minute',
      'Meditation':'Meditation',
      'Take a 5 minute break today to go outside in the sun and breathe air':'Take a 5 minute break today to go outside in the sun and breathe air',
      'Meet A':'Meet A',
      'Friend':'Friend',
      'Meeting a friend I haven\'t seen in a long time':'Meeting a friend I haven\'t seen in a long time',
      'Take A':'Take A',
      'Walk':'Walk',
      'Go for a walk in a place you like, for example at the sea or even under the house':'Go for a walk in a place you like, for example at the sea or even under the house',
      'Take This Challenge':'Take This Challenge',
      "Info":"Info",
      "Every day you can choose one daily challenge from three possible challenges. After you choose and carry it out, three new challenge will appear every other day.":"Every day you can choose one daily challenge from three possible challenges. After you choose and carry it out, three new challenge will appear every other day",


      //========================================Daily Goals Doing View========================================
      'Change Task':'Change Task',
      'Take a 5 minute break today to \ngo outside in the sun and \nbreathe air':'Take a 5 minute break today to \ngo outside in the sun and \nbreathe air',
      'start the timer':'start the timer',
      'Done':'Done',
      //'Change Task':'Change Task',

      //======================================Daily Goals Done View=======================================
      'Next Daily Goal':'Next Daily Goal',
      'Daily Challenge Completed Today':'Daily Challenge Completed Today',

      //======================================Daily Course View===========================================
      " All Videos":" All Videos",
      '"Nothing Will Stop Me"':'"Nothing Will Stop Me"',
      '"Let\'s talk for a second about life and our meaning and how nothing can stop us. We are the ones who stand in our own way."':'"Let\'s talk for a second about life and our meaning and how nothing can stop us. We are the ones who stand in our own way."',
      "Daily Course":"Daily Course",
      'Min':'Min',
      'Daily Next Goals':'Daily Next Goals',

      //====================================================Pusher Challenges===========================
      'Pusher Challenge':'Pusher Challenge',
      'Super Mix Routine':'Super Mix Routine',
      "Every day you need to complete the pusher challenge routine for 7 days, After you finish the challenge a new challenge will appear every other day.":"Every day you need to complete the pusher challenge routine for 7 days, After you finish the challenge a new challenge will appear every other day.",

      //====================================================Pusher Challenges View===========================
      "Remove":"Remove",
      "Finish":"Finish",


      //==================================================pusher Challenges done===========================
      "Upgrade from 20\$":"Upgrade from 20\$",
      "Get the complete progress for yourself with premium challenges":"Get the complete progress for yourself with premium challenges",

      //=================================================Pusher Challenges Controller==========================
      "Listening To Music":"Listening To Music",
      "45 Minutes Workout":"45 Minutes Workout",
      "Cold Shower":"Cold Shower",
      "Protein Shake":"Protein Shake",

      //===================================================Profile view================================================
      'Hi Hami':'Hi Hami',
      "Edit My Profile":"Edit My Profile",
      "Sharing The App":"Sharing The App",
      'Contact Us':'Contact Us',
      'Terms Of Use':'Terms Of Use',
      'Privacy Policy':'Privacy Policy',
      'Log Out':'Log Out',
      'Delete User':'Delete User',

      //===================================================Edit Profile View=======================================
      "Edit Profile":"Edit Profile",
      "Full Name":"Full Name",
      "Or Haim":"Or Haim",
      "Enter full name":"Enter full name",
      "Update Profile":"Update Profile",

      //=====================================================Languages view==============================================
      "Languages":"Languages",

      //=================================================courses view===================================================
      "For You":"For You",
      "Self Improvement":"Self Improvement",
      "Romantic":"Romantic",
      "Courses":"Courses",
      "Search":"Search",

      //=================================================Favorites view===================================================
      "Favorites":"Favorites",
      "No favorites yet":"No favorites yet",

      //=================================================Courses Details View===========================================
      "current lesson:":"current lesson:",
      "  Shifting Your Perspective":"  Shifting Your Perspective",

      //=================================================Viewing the Challenges Controller ==================================
      "Track Your Spending":"Track Your Spending",
      "Long-Term Planning & Review":"Long-Term Planning & Review",
      "Listen To A Financial Podcast":"Listen To A Financial Podcast",
      "Set SMART Financial Goals":"Set SMART Financial Goals",
      "Description":"Description",
      "Not Added":"Not Added",
      "Introductions":"Introductions",
      "Why It’s Important: ":"Why It’s Important: ",
      "What You Need To Do: ":"What You Need To Do: ",
      "How It Helps: ":"How It Helps: ",


      //==================================================Viewing the Challenge View=========================================
      "Financial Daily challenge completed today":"Financial Daily challenge completed today",
      "The Challenge Completed Successfully And Earned:":"The Challenge Completed Successfully And Earned:",
      "Share the achievement with friends":"Share the achievement with friends",
      "Share":"Share",
      "Day":"Day",
      "you still can complete all the challenges":"you still can complete all the challenges",
      'By':'By',
      "Complete The Challenge And Win ":"Complete The Challenge And Win ",
      "Win ":"Win ",
      "Challenges":"Challenges",

      //========================================================ImagePicker==================================================
      'Add Photo':'Add Photo',
      'Select Image':'Select Image',
      "Choose an option":"Choose an option",
      "Camera":"Camera",
      "Gallery":"Gallery",

      //==============================================================phone login controller========================================
      "Otp verification failed":"Otp verification failed",
      "Unable to verify OTP, please try again":"Unable to verify OTP, please try again",
      "Error verifying OTP":"Error verifying OTP",
      "Otp Sent Successfully":"Otp Sent Successfully",
      "Failed to send OTP":"Failed to send OTP",
      "Error parsing OTP response":"Error parsing OTP response",
      "No response while sending OTP":"No response while sending OTP",
      'Email Not Found':'Email Not Found',
      "Registration successful!":"Registration successful!",
      "Registration failed":"Registration failed",
      "Registration failed. Please try again.":"Registration failed. Please try again.",
      "Unable to register, please check your connection.":"Unable to register, please check your connection.",
      "Sign-in configuration error. Please try again.":"Sign-in configuration error. Please try again.",
      "Network error. Please check your connection.":"Network error. Please check your connection.",
      "Sign-in cancelled.":"Sign-in cancelled.",
      "Sign-in failed. Please try again.":"Sign-in failed. Please try again.",
      "An unexpected error occurred. Please try again.":"An unexpected error occurred. Please try again.",

      //============================================profile registration controller========================================================
      'Enter Your First Name':'Enter Your First Name',
      'Enter Your Last Name':'Enter Your Last Name',
      "Update failed":"Update failed",
      "Unable to Update, please check your connection.":"Unable to Update, please check your connection.",

      //============================================profile registration controller========================================================
      'Profile':'Profile',
      'Daily Goals':'Daily Goals',
      'Challenge':'Challenge',


      //==================================================Voucher_and_coins_view========================================================
      ">> To Unlock This Challenge Go Premium <<":">> To Unlock This Challenge Go Premium <<",
      "I Want This Challenge":"I Want This Challenge",
      "You purchased Premium":"You purchased Premium",
      "Days":"Days",
      "See The Challenges":"See The Challenges",

      //=================================================Viewing The Challenge view=======================================================
      'DAY':'DAY',

    },

    'he_IL': {
      //===================================Onboarding View==============================================================
      "Start Your Self Improvement Journey Today!": "התחל את מסע השיפור העצמי שלך היום!",
      "Setting Goals Is Easy, Achieving Them- ": "להציב מטרות זה קל, להשיג אותן – ",
      "That's Where We Shine.": "שם אנחנו מצטיינים.",
      "Ditch The Fear, Embrace Change,": "עזוב את הפחד, קבל את השינוי,",
      "And Get Ready To Transform!": "והתכונן להשתנות!",
      "Next": "הבא",

      //===================================Onboarding View 2=========================================================
      "Your Journey, Your Success": "המסע שלך, ההצלחה שלך",
      "Everyone's Journey Is Unique,": "המסע של כל אחד ייחודי,",
      "Choose Your Goals,": "בחר את המטרות שלך,",
      "Let Us Customize Your Personalized \nExperience": "תן לנו להתאים עבורך חוויה אישית",

      //====================================Otp Verification and Phone Login View==========================================
      "Phone": "טלפון",
      "Login": "התחברות",
      "verification": "אימות",
      "Enter Your Verification Code": "הכנס את קוד האימות שלך",
      "Invalid code. Enter the correct verification code": "קוד לא תקין. הכנס את קוד האימות הנכון",
      "Didn't receive the code? Resend it now": "לא קיבלת את הקוד? שלח שוב עכשיו",
      "OK": "אישור",

      //========================================Profile View======================================================================
      "My Profile": "הפרופיל שלי",
      "First Name": "שם פרטי",
      "Or": "או",
      "Last Name": "שם משפחה",
      "Hajim": "חג'ים",
      "Date of birth": "תאריך לידה",
      "Gender": "מגדר",
      "Male": "זכר",
      "Female": "נקבה",
      "Other": "אחר",
      "Email": "אימייל",
      "Add a profile image": "הוסף תמונת פרופיל",
      "I've read this text & you want to receive promotional emails & messages from Pusher":
      "קראתי את הטקסט הזה ואני רוצה לקבל אימיילים והודעות פרסומיות מ-Pusher",
      "Sign Up": "הרשמה",
      "By clicking “Sign up״ button below": "בלחיצה על כפתור \"הרשמה\" למטה, אתה מסכים לתנאי השימוש שלנו, פותח חשבון ב-Pusher, ומאשר שקראת את מדיניות הפרטיות שלנו",
      "Delete Account": "מחיקת חשבון",
      "Are you sure you want to delete your account? This action cannot be undone.": "האם אתה בטוח שברצונך למחוק את החשבון שלך? פעולה זו אינה ניתנת לביטול.",
      "Cancel": "ביטול",
      "Delete": "מחק",

      //====================================  Improvement View===================================
      "Please select at least one category to improve": "אנא בחר לפחות קטגוריה אחת לשיפור",
      "Fitness": "כושר",
      "Relationship": "מערכת יחסים",
      "Motivation": "מוטיבציה",
      "Financial": "כספים",
      "Social": "חברתי",
      "Balance": "איזון",
      "Selected categories": "קטגוריות נבחרות",
      "Selected": "נבחר",

      //==================================Personal Goals view====================================
      "fitness": "כושר",
      "title": "כותרת",
      "What's Your Fitness Goals ?": "מה מטרות הכושר שלך?",
      "icon": "אייקון",
      "goals": "מטרות",
      "Improve fitness": "שפר כושר",
      "Start a new sport": "התחל ספורט חדש",
      "Build muscle mass": "בנה מסת שריר",
      "Lose weight": "ירד במשקל",
      "motivation": "מוטיבציה",
      "What's Your Motivation Goals ?": "מה מטרות המוטיבציה שלך?",
      "Find sense of inspiration": "מצא תחושת השראה",
      "Avoid procrastination": "הימנע מדחיינות",
      "Improve planning and organization": "שפר תכנון וארגון",
      "Set realistic goals": "הצב מטרות ריאליות",
      "relationship": "מערכת יחסים",
      "What's Your Relationship Goals ?": "מה מטרות מערכת היחסים שלך?",
      "Improve communication": "שפר תקשורת",
      "Spend more quality time together": "בלו יותר זמן איכות ביחד",
      "Resolve issues and strengthen the bond": "פתור בעיות וחזק את הקשר",
      "Learn and grow as a couple": "למד וצמח כזוג",
      "You can select up to 3 goals per category": "אתה יכול לבחור עד 3 מטרות לכל קטגוריה",
      "Please select at least one goal": "אנא בחר לפחות מטרה אחת",
      "Selected Goals by Category:": "מטרות נבחרות לפי קטגוריה:",

      //================================Premium View===================================================================================
      "Premium": "פרימיום",
      "Say Hello To Your Best Self.": "אמור שלום לעצמך הטוב ביותר.",
      "Get The Complete Progress For Yourself With": "קבל את ההתקדמות המלאה לעצמך עם",
      "Premium Challenges": "אתגרי פרימיום",
      "Unlock Extra Challenges For 30 Days": "פתח אתגרים נוספים ל-30 יום",
      "Unlock Access For Pusher Courses": "פתח גישה לקורסי Pusher",
      "Upgrade 20\$": "שדרג 20\$",
      "Pusher VIP": "Pusher VIP",
      "Unlock Extra Challenges For 20 Days": "פתח אתגרים נוספים ל-20 יום",
      "Unlock Mentor Challenge": "פתח אתגר מנטור",
      "Upgrade 50\$": "שדרג 50\$",
      "Continue With 7-Day Challenge Trial": "המשך עם ניסיון אתגר ל-7 ימים",

      //===============================Well Done View=======================================
      "Well Done": "כל הכבוד",
      "We hope you got some \nmotivation today": "אנחנו מקווים שקיבלת קצת\nמוטיבציה היום",
      "Upgrade Now": "שדרג עכשיו",

      //===============================Notification View=====================================
      "Notifications": "התראות",
      "TODAY": "היום",
      "YESTERDAY": "אתמול",

      //==============================="Motivation Video View================================
      "Motivation Video Mix": "תערובת סרטוני מוטיבציה",
      "All Videos": "כל הסרטונים",
      "\"Change Your Mind\"": "\"שנה את דעתך\"",
      "By Sam Mor - Mental Adviser": "מאת סם מור - יועץ מנטלי",

      //====================================Daily Goals view==================================
      "Daily Challenge": "אתגר יומי",
      "choose": "בחר",
      " One": " אחד",
      "\nchallenge for today": "\nאתגר להיום",
      "5 Minute": "5 דקות",
      "Meditation": "מדיטציה",
      "Take a 5 minute break today to go outside in the sun and breathe air":
      "קח הפסקה של 5 דקות היום, צא לשמש ונשום אוויר",
      "Meet A": "פגוש",
      "Friend": "חבר",
      "Meeting a friend I haven't seen in a long time": "פגישה עם חבר שלא ראיתי זמן רב",
      "Take A": "קח",
      "Walk": "טיול",
      "Go for a walk in a place you like, for example at the sea or even under the house":
      "צא לטיול במקום שאתה אוהב, למשל בים או אפילו מתחת לבית",
      "Take This Challenge": "קח את האתגר הזה",
      "Info": "מידע",
      "Every day you can choose one daily challenge from three possible challenges. After you choose and carry it out, three new challenge will appear every other day.":
      "כל יום תוכל לבחור אתגר יומי אחד מתוך שלושה אפשריים. אחרי שתבחר ותבצע אותו, שלושה אתגרים חדשים יופיעו כל יום אחר.",

      //========================================Daily Goals Doing View========================================
      "Change Task": "שנה משימה",
      "Take a 5 minute break today to \ngo outside in the sun and \nbreathe air":
      "קח הפסקה של 5 דקות היום\nצא לשמש\nונשום אוויר",
      "start the timer": "התחל את הטיימר",
      "Done": "בוצע",

      //======================================Daily Goals Done View=======================================
      "Next Daily Goal": "האתגר היומי הבא",
      "Daily Challenge Completed Today": "האתגר היומי הושלם היום",

      //======================================Daily Course View===========================================
      " All Videos": " כל הסרטונים",
      "\"Nothing Will Stop Me\"": "\"שום דבר לא יעצור אותי\"",
      "\"Let's talk for a second about life and our meaning and how nothing can stop us. We are the ones who stand in our own way.\"":
      "\"בואו נדבר לרגע על החיים והמשמעות שלנו ואיך שום דבר לא יכול לעצור אותנו. אנחנו אלה שעומדים בדרכנו.\"",
      "Daily Course": "קורס יומי",
      "Min": "דקה",
      "Daily Next Goals": "המטרות היומיות הבאות",

      //====================================================Pusher Challenges===========================
      "Pusher Challenge": "אתגר Pusher",
      "Super Mix Routine": "שגרת סופר מיקס",
      "Every day you need to complete the pusher challenge routine for 7 days, After you finish the challenge a new challenge will appear every other day.":
      "כל יום עליך להשלים את שגרת אתגר Pusher במשך 7 ימים, לאחר שתסיים יופיע אתגר חדש כל יום אחר.",

      //====================================================Pusher Challenges View===========================
      "Remove": "הסר",
      "Finish": "סיים",

      //==================================================pusher Challenges done===========================
      "Upgrade from 20\$": "שדרג מ-20\$",
      "Get the complete progress for yourself with premium challenges":
      "קבל את ההתקדמות המלאה לעצמך עם אתגרי פרימיום",

      //=================================================Pusher Challenges Controller==========================
      "Listening To Music": "האזנה למוזיקה",
      "45 Minutes Workout": "אימון של 45 דקות",
      "Cold Shower": "מקלחת קרה",
      "Protein Shake": "שייק חלבון",

      //===================================================Profile view================================================
      "Hi Hami": "היי חמי",
      "Edit My Profile": "ערוך את הפרופיל שלי",
      "Sharing The App": "שיתוף האפליקציה",
      "Contact Us": "צור קשר",
      "Terms Of Use": "תנאי שימוש",
      "Privacy Policy": "מדיניות פרטיות",
      "Log Out": "התנתק",
      "Delete User": "מחק משתמש",

      //===================================================Edit Profile View=======================================
      "Edit Profile": "עריכת פרופיל",
      "Full Name": "שם מלא",
      "Or Haim": "אור חיים",
      "Enter full name": "הזן שם מלא",
      "Update Profile": "עדכן פרופיל",

      //=====================================================Languages view==============================================
      "Languages": "שפות",

      //=================================================courses view===================================================
      "For You": "בשבילך",
      "Self Improvement": "שיפור עצמי",
      "Romantic": "רומנטי",
      "Courses": "קורסים",
      "Search": "חיפוש",

      //=================================================Favorites view===================================================
      "Favorites": "מועדפים",
      "No favorites yet": "אין מועדפים עדיין",

      //=================================================Courses Details View===========================================
      "current lesson:": "שיעור נוכחי:",
      "  Shifting Your Perspective": "  שינוי נקודת המבט שלך",

      //=================================================Viewing the Challenges Controller ==================================
      "Track Your Spending": "עקוב אחר ההוצאות שלך",
      "Long-Term Planning & Review": "תכנון וביקורת לטווח ארוך",
      "Listen To A Financial Podcast": "האזן לפודקאסט פיננסי",
      "Set SMART Financial Goals": "הצב מטרות פיננסיות חכמות",
      "Description": "תיאור",
      "Not Added": "לא נוסף",
      "Introductions": "מבואות",
      "Why It’s Important: ": "למה זה חשוב: ",
      "What You Need To Do: ": "מה עליך לעשות: ",
      "How It Helps: ": "איך זה עוזר: ",

      //==================================================Viewing the Challenge View=========================================
      "Financial Daily challenge completed today": "אתגר יומי פיננסי הושלם היום",
      "The Challenge Completed Successfully And Earned:": "האתגר הושלם בהצלחה והרווחת:",
      "Share the achievement with friends": "שתף את ההישג עם חברים",
      "Share": "שתף",
      "Day": "יום",
      "you still can complete all the challenges": "אתה עדיין יכול להשלים את כל האתגרים",
      "By": "על ידי",
      "Complete The Challenge And Win ": "השלים את האתגר וזכה ",
      "Win ": "זכה ",
      "Challenges": "אתגרים",

      //========================================================ImagePicker==================================================
      "Add Photo": "הוסף תמונה",
      "Select Image": "בחר תמונה",
      "Choose an option": "בחר אפשרות",
      "Camera": "מצלמה",
      "Gallery": "גלריה",

      //==============================================================phone login controller========================================
      "Otp verification failed": "אימות OTP נכשל",
      "Unable to verify OTP, please try again": "לא ניתן לאמת את ה-OTP, נסה שוב",
      "Error verifying OTP": "שגיאה באימות OTP",
      "Otp Sent Successfully": "OTP נשלח בהצלחה",
      "Failed to send OTP": "שליחת OTP נכשלה",
      "Error parsing OTP response": "שגיאה בפענוח תגובת OTP",
      "No response while sending OTP": "אין תגובה בעת שליחת OTP",
      "Email Not Found": "האימייל לא נמצא",
      "Registration successful!": "הרשמה הצליחה!",
      "Registration failed": "ההרשמה נכשלה",
      "Registration failed. Please try again.": "ההרשמה נכשלה. אנא נסה שוב.",
      "Unable to register, please check your connection.": "לא ניתן להירשם, אנא בדוק את החיבור שלך.",
      "Sign-in configuration error. Please try again.": "שגיאת הגדרות כניסה. אנא נסה שוב.",
      "Network error. Please check your connection.": "שגיאת רשת. אנא בדוק את החיבור שלך.",
      "Sign-in cancelled.": "הכניסה בוטלה.",
      "Sign-in failed. Please try again.": "הכניסה נכשלה. אנא נסה שוב.",
      "An unexpected error occurred. Please try again.": "אירעה שגיאה לא צפויה. אנא נסה שוב.",

      //============================================profile registration controller========================================================
      "Enter Your First Name": "הכנס את שמך הפרטי",
      "Enter Your Last Name": "הכנס את שם המשפחה שלך",
      "Update failed": "העדכון נכשל",
      "Unable to Update, please check your connection.": "לא ניתן לעדכן, אנא בדוק את החיבור שלך.",

      //============================================profile registration controller========================================================
      "Profile": "פרופיל",
      "Daily Goals": "מטרות יומיות",
      "Challenge": "אתגר",

      //==================================================Voucher_and_coins_view========================================================
      ">> To Unlock This Challenge Go Premium <<": ">> כדי לפתוח את האתגר הזה עבור לפרימיום <<",
      "I Want This Challenge": "אני רוצה את האתגר הזה",
      "You purchased Premium": "רכשת פרימיום",

      //=================================================Viewing The Challenge view=======================================================
      "DAY": "יום",
    },


  };
}
