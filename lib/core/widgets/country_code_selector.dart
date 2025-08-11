import 'package:flutter/material.dart';

class CountryCodeSelector extends StatefulWidget {
  final Function(CountryCode)? onCountrySelected;

  const CountryCodeSelector({
    Key? key,
    this.onCountrySelected,
  }) : super(key: key);

  @override
  State<CountryCodeSelector> createState() => _CountryCodeSelectorState();
}

class _CountryCodeSelectorState extends State<CountryCodeSelector> {
  CountryCode selectedCountry = CountryCode.israel;
  bool isExpanded = false;

  final List<CountryCode> countries = [
    CountryCode.israel,
    CountryCode.france,
    CountryCode.usa,
    CountryCode.germany,
    CountryCode.uk,
    CountryCode.canada,
    CountryCode.italy,
    CountryCode.spain,
    CountryCode.japan,
    CountryCode.australia,
    CountryCode.brazil,
    CountryCode.india,
    CountryCode.china,
    CountryCode.russia,
    CountryCode.mexico,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.24),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Selected country (always visible)
          GestureDetector(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.white, width: 1),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: selectedCountry.flag,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        selectedCountry.code,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Transform.rotate(
                    angle: isExpanded ? 0 : 3.14159,
                    child: const Icon(
                      Icons.keyboard_arrow_up,
                      color: Colors.white70,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Expanded list
          if (isExpanded) ...[
            const Divider(
              color: Colors.white24,
              height: 1,
              thickness: 1,
              indent: 16,
              endIndent: 16,
            ),
            Container(
              height: 200, // Fixed height for scrollable area
              child: SingleChildScrollView(
                child: Column(
                  children: countries
                      .where((country) => country != selectedCountry)
                      .map(
                        (country) => GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCountry = country;
                          isExpanded = false;
                        });
                        widget.onCountrySelected?.call(country);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        child: Row(
                          children: [
                            Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.white, width: 1),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: country.flag,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              country.code,
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                      .toList(),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

enum CountryCode {
  israel('+972', 'Israel'),
  france('+33', 'France'),
  usa('+1', 'United States'),
  germany('+49', 'Germany'),
  uk('+44', 'United Kingdom'),
  canada('+1', 'Canada'),
  italy('+39', 'Italy'),
  spain('+34', 'Spain'),
  japan('+81', 'Japan'),
  australia('+61', 'Australia'),
  brazil('+55', 'Brazil'),
  india('+91', 'India'),
  china('+86', 'China'),
  russia('+7', 'Russia'),
  mexico('+52', 'Mexico');

  const CountryCode(this.code, this.name);

  final String code;
  final String name;

  Widget get flag {
    switch (this) {
      case CountryCode.israel:
        return Container(
          color: Colors.white,
          child: Stack(
            children: [
              // White background with blue stripes
              Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(color: Colors.white),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(color: const Color(0xFF0038B8)),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(color: Colors.white),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(color: const Color(0xFF0038B8)),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(color: Colors.white),
                  ),
                ],
              ),
              // Star of David in center
              Center(
                child: Icon(
                  Icons.star,
                  color: const Color(0xFF0038B8),
                  size: 12,
                ),
              ),
            ],
          ),
        );
      case CountryCode.france:
        return Row(
          children: [
            Expanded(child: Container(color: const Color(0xFF002395))),
            Expanded(child: Container(color: Colors.white)),
            Expanded(child: Container(color: const Color(0xFFED2939))),
          ],
        );
      case CountryCode.usa:
        return Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF002868),
                Color(0xFFBF0A30),
              ],
              stops: [0.4, 0.6],
            ),
          ),
          child: const Center(
            child: Icon(
              Icons.star,
              color: Colors.white,
              size: 8,
            ),
          ),
        );
      case CountryCode.germany:
        return Column(
          children: [
            Expanded(child: Container(color: Colors.black)),
            Expanded(child: Container(color: const Color(0xFFDD0000))),
            Expanded(child: Container(color: const Color(0xFFFFCE00))),
          ],
        );
      case CountryCode.uk:
        return Container(
          color: const Color(0xFF012169),
          child: Stack(
            children: [
              // Red cross
              Center(
                child: Container(
                  width: double.infinity,
                  height: 3,
                  color: const Color(0xFFC8102E),
                ),
              ),
              Center(
                child: Container(
                  width: 3,
                  height: double.infinity,
                  color: const Color(0xFFC8102E),
                ),
              ),
            ],
          ),
        );
      case CountryCode.canada:
        return Row(
          children: [
            Expanded(child: Container(color: const Color(0xFFFF0000))),
            Expanded(flex: 2, child: Container(
              color: Colors.white,
              child: const Center(
                child: Icon(Icons.eco, color: Color(0xFFFF0000), size: 12),
              ),
            )),
            Expanded(child: Container(color: const Color(0xFFFF0000))),
          ],
        );
      case CountryCode.italy:
        return Row(
          children: [
            Expanded(child: Container(color: const Color(0xFF009246))),
            Expanded(child: Container(color: Colors.white)),
            Expanded(child: Container(color: const Color(0xFFCE2B37))),
          ],
        );
      case CountryCode.spain:
        return Column(
          children: [
            Expanded(child: Container(color: const Color(0xFFAA151B))),
            Expanded(flex: 2, child: Container(color: const Color(0xFFF1BF00))),
            Expanded(child: Container(color: const Color(0xFFAA151B))),
          ],
        );
      case CountryCode.japan:
        return Container(
          color: Colors.white,
          child: const Center(
            child: Icon(
              Icons.circle,
              color: Color(0xFFBC002D),
              size: 12,
            ),
          ),
        );
      case CountryCode.australia:
        return Container(
          color: const Color(0xFF012169),
          child: const Center(
            child: Icon(
              Icons.star,
              color: Colors.white,
              size: 8,
            ),
          ),
        );
      case CountryCode.brazil:
        return Container(
          color: const Color(0xFF009739),
          child: const Center(
            child: Icon(
              Icons.circle,
              color: Color(0xFFFEDF00),
              size: 12,
            ),
          ),
        );
      case CountryCode.india:
        return Column(
          children: [
            Expanded(child: Container(color: const Color(0xFFFF9933))),
            Expanded(child: Container(color: Colors.white)),
            Expanded(child: Container(color: const Color(0xFF138808))),
          ],
        );
      case CountryCode.china:
        return Container(
          color: const Color(0xFFDE2910),
          child: const Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.all(2),
              child: Icon(
                Icons.star,
                color: Color(0xFFFFDE00),
                size: 6,
              ),
            ),
          ),
        );
      case CountryCode.russia:
        return Column(
          children: [
            Expanded(child: Container(color: Colors.white)),
            Expanded(child: Container(color: const Color(0xFF0039A6))),
            Expanded(child: Container(color: const Color(0xFFD52B1E))),
          ],
        );
      case CountryCode.mexico:
        return Row(
          children: [
            Expanded(child: Container(color: const Color(0xFF006847))),
            Expanded(child: Container(color: Colors.white)),
            Expanded(child: Container(color: const Color(0xFFCE1126))),
          ],
        );
    }
  }
}

// Example usage widget
class CountryCodeSelectorDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: CountryCodeSelector(
          onCountrySelected: (country) {
            print('Selected: ${country.name} ${country.code}');
          },
        ),
      ),
    );
  }
}

// Main app to demonstrate the widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Country Code Selector',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CountryCodeSelectorDemo(),
    );
  }
}

void main() {
  runApp(MyApp());
}