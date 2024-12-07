
import 'package:first_try_signup/Style/Style_Meriem/styles.dart';
import 'package:flutter/material.dart';

class HackImageBox extends StatelessWidget {
  final Color color; // This will allow passing a color to the box

  const HackImageBox({
    super.key,
    required this.color, // Accept color as a parameter
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Full width of the screen
      decoration: BoxDecoration(
        color: color, // Set the passed color as the background color
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(16), // Rounded bottom left corner
          bottomRight: Radius.circular(16), // Rounded bottom right corner
        ),
      ),
      height: 350, // Set a fixed height for the container
    );
  }
}


//// time line
class HackathonTimeline extends StatelessWidget {
  final String startDate; // Start date as a parameter
  final String endDate; // End date as a parameter
  final String location; // Location as a parameter

  // Constructor to accept dynamic values for start date, end date, and location
  const HackathonTimeline({
    super.key,
    required this.startDate,
    required this.endDate,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color.fromARGB(0, 0, 0, 0), Color.fromARGB(0, 0, 0, 0)], // Purple gradient
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Start Label and Date
              Column(
                children: [
                  const Text(
                    'start',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    startDate, // Dynamic start date
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              // Timeline Line with Circles
              Expanded(
                child: Row(
                  children: const [
                    SizedBox(width: 8),
                    CircleAvatar(
                      radius: 5,
                      backgroundColor: Colors.white,
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.white,
                        thickness: 1,
                      ),
                    ),
                    CircleAvatar(
                      radius: 5,
                      backgroundColor: Colors.white,
                    ),
                    SizedBox(width: 8),
                  ],
                ),
              ),
              // End Label and Date
              Column(
                children: [
                  const Text(
                    'end',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    endDate, // Dynamic end date
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Location Section
          Row(
            children: [
              const Icon(
                Icons.location_on,
                color: Colors.white,
                size: 18,
              ),
              const SizedBox(width: 8),
              Text(
                location, // Dynamic location
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


////  Title of the section 
class TitleOfSection extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;

  const TitleOfSection({
    Key? key,
    required this.title,
    required this.icon,
    this.color = Colors.yellow, // Default color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: color),
        const SizedBox(width: 3),
        Text(
          title,
          style: TextStyle(
            color: color,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}


//// Description card 
class TopicDescriptionCard extends StatelessWidget {
  final String topicDescription;

  const TopicDescriptionCard({
    Key? key,
    required this.topicDescription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 700,
      child: Card(
        color: Colors.white.withOpacity(0.6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            topicDescription,
            style: const TextStyle(
              color: Color(0xFF656565), // Hex color 656565
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}

//// tagbox 
class TagBox extends StatelessWidget {
  final List<String> tags;
  final IconData icon;

  const TagBox({
    Key? key,
    required this.tags,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center, // Center the row content vertically
      children: [
        // Icon appears at the start
        
        Icon(
          icon ?? Icons.tag, // Use the provided icon or a default placeholder
          color: const Color(0xFF72609E),
          size: icon == Icons.tag ? 0 : 34, // Size 0 when icon is null
        ),
        if (icon != null) const SizedBox(width: 8), // Add spacing only if the icon is visible
        const SizedBox(width: 8),
        
        Expanded( // Ensure tags wrap nicely if there isn't enough space
          child: Wrap(
            spacing: 10, // Space between tags
            runSpacing: 4, // Space between rows
            children: tags.map((tag) {
              return Chip(
                backgroundColor: const Color(0xFF72609E), // Box color
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(22)), // Rounded corners
                ),
                labelPadding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                label: Text(
                  tag,
                  style: const TextStyle(
                    color: Colors.white, // White text color
                    fontSize: 15,
                    fontFamily: 'Poppins', // Poppins font
                    fontWeight: FontWeight.w400, // Bold weight
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}


//////////////////////////////////////////////////////

// The main widget that displays the card
class TopicCard extends StatelessWidget {
  final String topicDescription; // For the "BLA BLA BLA" text
  final List<String> tags; // List of tags like "Machine Learning"

  // Constructor to accept dynamic values
  const TopicCard({
    super.key,
    required this.topicDescription,
    required this.tags,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 600,
      child: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color.fromARGB(0, 106, 13, 173), // Purple background
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title section
            TitleOfSection(title: 'Topic of the hackathon', icon: Icons.crisis_alert),
      
            const SizedBox(height: 14),
      
            // Topic description (BLA BLA BLA)
            TopicDescriptionCard(topicDescription: " BLA BLA BLA BLA ...",),
            const SizedBox(height: 24),
            
            
            // Tags Section
           TagBox(tags: tags, icon: Icons.extension )
          ],
        ),
      ),
    );
  }
}


/////// Skills section
class SkillsSection extends StatelessWidget {
  final String title;
  final List<String> skills;

  const SkillsSection({
    Key? key,
    required this.title,
    required this.skills,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(

      child: Container(
         margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TitleOfSection(title: title, icon: Icons.checklist_rtl_outlined),
            SizedBox(height: 10), // Space between title and tag box
            TagBox(tags: skills,  icon: Icons.tag,), // Use TagBox without an icon
          ],
        ),
      ),
    );
  }
}


//// description section :
class DescriptionSection extends StatelessWidget {
  final String title;
  final IconData icon;
  final String descriptionText;

  const DescriptionSection({
    Key? key,
    required this.title,
    required this.icon,
    required this.descriptionText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 440,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleOfSection(title: title, icon: icon),
          const SizedBox(height: 16), // Space between title and description
          TopicDescriptionCard(topicDescription: descriptionText),
        ],
      ),
    );
  }
}


/////// sponsor card
class SponsorCard extends StatelessWidget {
  final String name; // Name of the person
  final Color? image; // Color for background (can be null for no image)

  const SponsorCard({
    super.key,
    required this.name,
    this.image, // Can be null for no image
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 163, // Set the width to 163
      height: 204, // Set the height to 204
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10), // Adjusted left and right margin to 20
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: Colors.white.withOpacity(0.3),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display image or a default color background (if image is null)
            Container(
              width: 100, // Set width of the rectangular "avatar"
              height: 100, // Set height of the rectangular "avatar"
              decoration: BoxDecoration(
                color: image ?? Colors.blueGrey, // If no image, use default color
                borderRadius: BorderRadius.circular(12), // Set rounded corners
              ),
              child: const Icon(
                Icons.account_circle,
                size: 50, // Icon size inside the rectangle
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            // Display name
            Text(
              name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


/////// sponsor list 
class HorizontalSponsorList extends StatelessWidget {
  final double height;
  final int itemCount;
  final List<String> names;
  final List<Color> colors;

  const HorizontalSponsorList({
    Key? key,
    required this.height,
    required this.itemCount,
    required this.names,
    required this.colors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height, // Set the fixed height for the sponsor list
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal, // Horizontal scrolling
        itemCount: itemCount, // Number of items to display
        itemBuilder: (context, index) {
          // You can modify this part if SponsorCard requires other parameters
          return SponsorCard(
            name: names[index], // Name of the company
            image: colors[index % colors.length], // Color for the image background
          );
        },
      ),
    );
  }
}


//// sponsor section
class SponsorSection extends StatelessWidget {
  final String title;
  final double height;
  final int itemCount;
  final List<String> names;
  final List<Color> colors;

  const SponsorSection({
    Key? key,
    required this.title,
    required this.height,
    required this.itemCount,
    required this.names,
    required this.colors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
         
          margin: EdgeInsetsDirectional.only(start: 30, top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            TitleOfSection(title: title, icon: Icons.sentiment_satisfied_alt_rounded),
            SizedBox(height: 16), // Space between title and list
        
            // The HorizontalSponsorList widget as an object here
            HorizontalSponsorList(
              height: height,
              itemCount: itemCount,
              names: names,
              colors: colors,
            ),
          ],
        ),
    );
  }
}




//////////////////////////////////////////


// Custom Avatar Widget
class CustomAvatar extends StatelessWidget {
  final String name;
  final Color color;
  final EdgeInsetsGeometry margin;

  const CustomAvatar({
    Key? key,
    required this.name,
    required this.color,
    this.margin = const EdgeInsets.symmetric(horizontal: 8.0), // Default margin
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Circle Avatar
          CircleAvatar(
            radius: 30,
            backgroundColor: color,
            child: const Icon(
              Icons.person,
              color: Colors.white,
              size: 30,
            ),
          ),
          const SizedBox(height: 8),
          // Name
          Text(
            name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

// Avatar List Widget
class AvatarList extends StatelessWidget {
  final List<String> names;
  final List<Color> colors;

  const AvatarList({
    Key? key,
    required this.names,
    required this.colors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100, // Define the height for horizontal scrolling
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: names.length,
        itemBuilder: (context, index) {
          return CustomAvatar(
            name: names[index],
            color: colors.isNotEmpty ? colors[index % colors.length] : Colors.grey,
          );
        },
      ),
    );
  }
}


class OrganizerSection extends StatelessWidget {
  final String sectionTitle;
  final IconData sectionIcon;
  final List<String> avatarNames;
  final List<Color> avatarColors;

  const OrganizerSection({
    Key? key,
    required this.sectionTitle,
    required this.sectionIcon,
    required this.avatarNames,
    required this.avatarColors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title of the Section
          TitleOfSection(
            title: sectionTitle,
            icon: sectionIcon,
          ),
          const SizedBox(height: 16), // Add some space between title and avatar list
          
          // Avatar List - Removed Expanded widget to allow horizontal scrolling
          AvatarList(
            names: avatarNames,
            colors: avatarColors,
          ),
        ],
      ),
    );
  }
}



///////////////////////////
class AgendaCard extends StatelessWidget {
  final String eventName;
  final String eventTime;

  const AgendaCard({
    super.key,
    required this.eventName, // Event name (e.g., "Opening Ceremony")
    required this.eventTime, // Event time (e.g., "08:00 AM - 09:00 AM")
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.6), // White with opacity for background
          borderRadius: BorderRadius.circular(20), // Rounded corners
        ),
        child: Row(
          children: [
            // Small circle (dot) on the left side
            Container(
              width: 69,
              height: 65,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 206, 176, 246), // You can change the color of the dot
                borderRadius: BorderRadius.all(Radius.circular(25))
              ),
            ),
            const SizedBox(width: 10), // Space between the dot and text
            // Column for event name and time
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Event Name
                  Text(
                    eventName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue, // Blue color for the text
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Event Time
                  Text(
                    eventTime,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.blueAccent, // Accent blue for the time text
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class GlowingCircle extends StatelessWidget {
  const GlowingCircle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        color: Colors.blue,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.yellow.withOpacity(0.6),
            blurRadius: 10,
            spreadRadius: 4,
          ),
        ],
      ),
    );
  }
}


class CircleWithAgenda extends StatelessWidget {
  final String eventName;
  final String eventTime;
  final bool isFirst; // Indicates if it's the first item
  final bool isLast; // Indicates if it's the last item

  const CircleWithAgenda({
    Key? key,
    required this.eventName,
    required this.eventTime,
    this.isFirst = false,
    this.isLast = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Vertical Line with Glowing Circle
        Column(
          children: [
            // Top line (only visible if not the first item)
            
              Container(
                height: 52,
                width: 2,
                color: isFirst ? const Color.fromARGB(0, 255, 255, 255) : const Color.fromARGB(255, 224, 224, 224),
              ),
            // Glowing Circle
            const GlowingCircle(),
            // Bottom line (only visible if not the last item)
            if (!isLast)
              Container(
                height: 53,
                width: 2,
                color: Colors.grey.shade300,
              ),
          ],
        ),
        const SizedBox(width: 15), // Space between the circle and the agenda
        // Agenda Card
        AgendaCard(
          eventName: eventName,
          eventTime: eventTime,
        ),
      ],
    );
  }
}


///////////////////////////


class ApplyCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 450,
      height: 212,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.4),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Decorative cut-out circles on the left and right
          Positioned(
            top: 120,
            left: -15,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: 120,
            right: -15,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
            ),
          ),
          // Main content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 35.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "💲 Paid/Not Paid",
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Price: XXXX \$",
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: const [
                        Icon(Icons.people, color: Color.fromARGB(255, 0, 0, 0)),
                        SizedBox(width: 8),
                        Text(
                          "TEAM / INDIV : [ Min , Max ]",
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                // Button
                Container(
                  margin: EdgeInsets.only(top: 20),
                  width: 220,
                  height: 50,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.greenAccent, Colors.yellowAccent],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Center(
                    child: Text(
                      "Apply Now",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}









/////////////////////
class DaySelector extends StatefulWidget {
  const DaySelector({Key? key}) : super(key: key);

  @override
  _DaySelectorState createState() => _DaySelectorState();
}

class _DaySelectorState extends State<DaySelector> {
  int currentDay = 1; // Initial day

  void _changeDay(int increment) {
    setState(() {
      currentDay += increment;
      if (currentDay < 1) currentDay = 1; // Prevent day from going below 1
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: const Color.fromARGB(0, 155, 39, 176),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Left Arrow
          IconButton(
            icon: const Icon(Icons.arrow_left, color: Colors.yellow),
            onPressed: () => _changeDay(-1),
          ),

          // Day Text
          Text(
            "DAY $currentDay",
            style: const TextStyle(
              color: Colors.yellow,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          // Right Arrow
          IconButton(
            icon: const Icon(Icons.arrow_right, color: Colors.yellow),
            onPressed: () => _changeDay(1),
          ),
        ],
      ),
    );
  }
}


