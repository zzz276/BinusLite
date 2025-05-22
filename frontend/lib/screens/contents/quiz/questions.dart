import 'package:binus_lite/models/components/question.dart';
import 'package:binus_lite/screens/contents/quiz/result.dart';
import 'package:flutter/material.dart';

class Questions extends StatefulWidget {
  const Questions({super.key});

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  late List<Question> questions;
  late List<double> sliderValues;
  late List<dynamic> radioValues;
  late String? textValue; 
  late String result;
  final TextEditingController textArea = TextEditingController();

  String? generateLabel(double v) {
    switch (v) {
      case 1.0:
        return "I don't like it at all.";
      case 2.0:
        return "I don't like it.";
      case 3.0:
        return "I'm not sure.";
      case 4.0:
        return "I like it.";
      case 5.0:
        return "I like it very much.";
      default:
        return null;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sliderValues = List.generate(8, (index) => (3.0 + 0 * index), growable: false);
    radioValues = List.generate(8, (index) => (1 + 0 * index), growable: false);
    textValue = "";
  }

  @override
  Widget build(BuildContext context) {
    questions = [
      Question(
        title: "How much did you enjoy these subjects at school?\nChoose the number 1 to 5 for each item!",
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text("A. Mathematics"),
            Slider(
              divisions: 4,
              label: generateLabel(sliderValues[0]),
              max: 5.0,
              min: 1.0,
              onChanged: (value) => setState(() => sliderValues[0] = value),
              value: sliderValues[0]
            ),
            
            const SizedBox(height: 8.0),
            const Text("B. Indonesian"),
            Slider(
              divisions: 4,
              label: generateLabel(sliderValues[1]),
              max: 5.0,
              min: 1.0,
              onChanged: (value) => setState(() => sliderValues[1] = value),
              value: sliderValues[1]
            ),
            
            const SizedBox(height: 8.0),
            const Text("C. Biology"),
            Slider(
              divisions: 4,
              label: generateLabel(sliderValues[2]),
              max: 5.0,
              min: 1.0,
              onChanged: (value) => setState(() => sliderValues[2] = value),
              value: sliderValues[2]
            ),
            
            const SizedBox(height: 8.0),
            const Text("D. Physics"),
            Slider(
              divisions: 4,
              label: generateLabel(sliderValues[3]),
              max: 5.0,
              min: 1.0,
              onChanged: (value) => setState(() => sliderValues[3] = value),
              value: sliderValues[3]
            ),
            
            const SizedBox(height: 8.0),
            const Text("E. Economy"),
            Slider(
              divisions: 4,
              label: generateLabel(sliderValues[4]),
              max: 5.0,
              min: 1.0,
              onChanged: (value) => setState(() => sliderValues[4] = value),
              value: sliderValues[4]
            ),
            
            const SizedBox(height: 8.0),
            const Text("F. Sociology"),
            Slider(
              divisions: 4,
              label: generateLabel(sliderValues[5]),
              max: 5.0,
              min: 1.0,
              onChanged: (value) => setState(() => sliderValues[5] = value),
              value: sliderValues[5]
            ),
            
            const SizedBox(height: 8.0),
            const Text("G. Foreign Languages (e.g. English, Japanese, etc.)"),
            Slider(
              divisions: 4,
              label: generateLabel(sliderValues[6]),
              max: 5.0,
              min: 1.0,
              onChanged: (value) => setState(() => sliderValues[6] = value),
              value: sliderValues[6]
            ),
            
            const SizedBox(height: 8.0),
            const Text("H. Arts (Paintings, Musics, Designs)"),
            Slider(
              divisions: 4,
              label: generateLabel(sliderValues[7]),
              max: 5.0,
              min: 1.0,
              onChanged: (value) => setState(() => sliderValues[7] = value),
              value: sliderValues[7]
            )
          ]
        )
      ),

      Question(
        title: "If given a group assignment, which role do you usually take?",
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RadioListTile(
              activeColor: const Color(0xFFEF8800),
              contentPadding: EdgeInsets.zero,
              controlAffinity: ListTileControlAffinity.leading,
              groupValue: radioValues[0],
              onChanged: (value) {
                setState(() => radioValues[0] = value);
              },

              title: const Text("Innovator"),
              value: 1
            ),

            RadioListTile(
              activeColor: const Color(0xFFEF8800),
              contentPadding: EdgeInsets.zero,
              controlAffinity: ListTileControlAffinity.leading,
              groupValue: radioValues[0],
              onChanged: (value) {
                setState(() => radioValues[0] = value);
              },

              title: const Text("Data Analyst"),
              value: 2
            ),

            RadioListTile(
              activeColor: const Color(0xFFEF8800),
              contentPadding: EdgeInsets.zero,
              controlAffinity: ListTileControlAffinity.leading,
              groupValue: radioValues[0],
              onChanged: (value) {
                setState(() => radioValues[0] = value);
              },

              title: const Text("Technician"),
              value: 3
            ),

            RadioListTile(
              activeColor: const Color(0xFFEF8800),
              contentPadding: EdgeInsets.zero,
              controlAffinity: ListTileControlAffinity.leading,
              groupValue: radioValues[0],
              onChanged: (value) {
                setState(() => radioValues[0] = value);
              },

              title: const Text("Designer"),
              value: 4
            ),

            RadioListTile(
              activeColor: const Color(0xFFEF8800),
              contentPadding: EdgeInsets.zero,
              controlAffinity: ListTileControlAffinity.leading,
              groupValue: radioValues[0],
              onChanged: (value) {
                setState(() => radioValues[0] = value);
              },

              title: const Text("Leader"),
              value: 5
            )
          ]
        )
      ),

      Question(
        title: "Which kind of activities do you like to fill your leisure time?",
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RadioListTile(
              activeColor: const Color(0xFFEF8800),
              contentPadding: EdgeInsets.zero,
              controlAffinity: ListTileControlAffinity.leading,
              groupValue: radioValues[1],
              onChanged: (value) {
                setState(() => radioValues[1] = value);
              },

              title: const Text("Reading or writing"),
              value: 1
            ),

            RadioListTile(
              activeColor: const Color(0xFFEF8800),
              contentPadding: EdgeInsets.zero,
              controlAffinity: ListTileControlAffinity.leading,
              groupValue: radioValues[1],
              onChanged: (value) {
                setState(() => radioValues[1] = value);
              },

              title: const Text("Drawing or creating visual design"),
              value: 2
            ),

            RadioListTile(
              activeColor: const Color(0xFFEF8800),
              contentPadding: EdgeInsets.zero,
              controlAffinity: ListTileControlAffinity.leading,
              groupValue: radioValues[1],
              onChanged: (value) {
                setState(() => radioValues[1] = value);
              },

              title: const Text("Playing games or coding"),
              value: 3
            ),

            RadioListTile(
              activeColor: const Color(0xFFEF8800),
              contentPadding: EdgeInsets.zero,
              controlAffinity: ListTileControlAffinity.leading,
              groupValue: radioValues[1],
              onChanged: (value) {
                setState(() => radioValues[1] = value);
              },

              title: const Text("Discussing"),
              value: 4
            ),

            RadioListTile(
              activeColor: const Color(0xFFEF8800),
              contentPadding: EdgeInsets.zero,
              controlAffinity: ListTileControlAffinity.leading,
              groupValue: radioValues[1],
              onChanged: (value) {
                setState(() => radioValues[1] = value);
              },

              title: const Text("Watching documentary films or exploring scientific topics"),
              value: 5
            )
          ],
        )
      ),

      Question(
        title: "Which one of the following skills are you good at?",
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RadioListTile(
              activeColor: const Color(0xFFEF8800),
              contentPadding: EdgeInsets.zero,
              controlAffinity: ListTileControlAffinity.leading,
              groupValue: radioValues[2],
              onChanged: (value) {
                setState(() => radioValues[2] = value);
              },

              title: const Text("Calculating and analyzing numbers"),
              value: 1
            ),

            RadioListTile(
              activeColor: const Color(0xFFEF8800),
              contentPadding: EdgeInsets.zero,
              controlAffinity: ListTileControlAffinity.leading,
              groupValue: radioValues[2],
              onChanged: (value) {
                setState(() => radioValues[2] = value);
              },

              // Menyampaikan ide lewat tulisan
              title: const Text("Idea Elicitation"),
              value: 2
            ),

            RadioListTile(
              activeColor: const Color(0xFFEF8800),
              contentPadding: EdgeInsets.zero,
              controlAffinity: ListTileControlAffinity.leading,
              groupValue: radioValues[2],
              onChanged: (value) {
                setState(() => radioValues[2] = value);
              },

              title: const Text("Public speaking"),
              value: 3
            ),

            RadioListTile(
              activeColor: const Color(0xFFEF8800),
              contentPadding: EdgeInsets.zero,
              controlAffinity: ListTileControlAffinity.leading,
              groupValue: radioValues[2],
              onChanged: (value) {
                setState(() => radioValues[2] = value);
              },

              title: const Text("Operating or producing with a computer"),
              value: 4
            ),

            RadioListTile(
              activeColor: const Color(0xFFEF8800),
              contentPadding: EdgeInsets.zero,
              controlAffinity: ListTileControlAffinity.leading,
              groupValue: radioValues[2],
              onChanged: (value) {
                setState(() => radioValues[2] = value);
              },

              title: const Text("Interacting and helping others"),
              value: 5
            )
          ],
        )
      ),

      Question(
        title: "Which topics spark your curiosity?",
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RadioListTile(
              activeColor: const Color(0xFFEF8800),
              contentPadding: EdgeInsets.zero,
              controlAffinity: ListTileControlAffinity.leading,
              groupValue: radioValues[3],
              onChanged: (value) {
                setState(() => radioValues[3] = value);
              },

              title: const Text("Business and Economics"),
              value: 1
            ),

            RadioListTile(
              activeColor: const Color(0xFFEF8800),
              contentPadding: EdgeInsets.zero,
              controlAffinity: ListTileControlAffinity.leading,
              groupValue: radioValues[3],
              onChanged: (value) {
                setState(() => radioValues[3] = value);
              },

              title: const Text("Human Physiology and Health"),
              value: 2
            ),

            RadioListTile(
              activeColor: const Color(0xFFEF8800),
              contentPadding: EdgeInsets.zero,
              controlAffinity: ListTileControlAffinity.leading,
              groupValue: radioValues[3],
              onChanged: (value) {
                setState(() => radioValues[3] = value);
              },

              title: const Text("Psychology and Human Behaviors"),
              value: 3
            ),

            RadioListTile(
              activeColor: const Color(0xFFEF8800),
              contentPadding: EdgeInsets.zero,
              controlAffinity: ListTileControlAffinity.leading,
              groupValue: radioValues[3],
              onChanged: (value) {
                setState(() => radioValues[3] = value);
              },

              title: const Text("Technology, Computer, and Robotics"),
              value: 4
            ),

            RadioListTile(
              activeColor: const Color(0xFFEF8800),
              contentPadding: EdgeInsets.zero,
              controlAffinity: ListTileControlAffinity.leading,
              groupValue: radioValues[3],
              onChanged: (value) {
                setState(() => radioValues[3] = value);
              },

              title: const Text("Design, Art, and Visual Expressions"),
              value: 5
            )
          ],
        )
      ),

      Question(
        title: "If you must decide what to do for your final project, you'll choose to ....",
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RadioListTile(
              activeColor: const Color(0xFFEF8800),
              contentPadding: EdgeInsets.zero,
              controlAffinity: ListTileControlAffinity.leading,
              groupValue: radioValues[4],
              onChanged: (value) {
                setState(() => radioValues[4] = value);
              },

              title: const Text("Create a software or computer program"),
              value: 1
            ),

            RadioListTile(
              activeColor: const Color(0xFFEF8800),
              contentPadding: EdgeInsets.zero,
              controlAffinity: ListTileControlAffinity.leading,
              groupValue: radioValues[4],
              onChanged: (value) {
                setState(() => radioValues[4] = value);
              },

              title: const Text("Do social phenomenon or human behavior research"),
              value: 2
            ),

            RadioListTile(
              activeColor: const Color(0xFFEF8800),
              contentPadding: EdgeInsets.zero,
              controlAffinity: ListTileControlAffinity.leading,
              groupValue: radioValues[4],
              onChanged: (value) {
                setState(() => radioValues[4] = value);
              },

              title: const Text("Design a product or artwork"),
              value: 3
            ),

            RadioListTile(
              activeColor: const Color(0xFFEF8800),
              contentPadding: EdgeInsets.zero,
              controlAffinity: ListTileControlAffinity.leading,
              groupValue: radioValues[4],
              onChanged: (value) {
                setState(() => radioValues[4] = value);
              },

              title: const Text("Write a business or market study report"),
              value: 4
            ),

            RadioListTile(
              activeColor: const Color(0xFFEF8800),
              contentPadding: EdgeInsets.zero,
              controlAffinity: ListTileControlAffinity.leading,
              groupValue: radioValues[4],
              onChanged: (value) {
                setState(() => radioValues[4] = value);
              },

              title: const Text("Initiate a heath or social campaign"),
              value: 5
            )
          ],
        )
      ),

      Question(
        title: "From the following list, which professions are your calling?",
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RadioListTile(
              activeColor: const Color(0xFFEF8800),
              contentPadding: EdgeInsets.zero,
              controlAffinity: ListTileControlAffinity.leading,
              groupValue: radioValues[5],
              onChanged: (value) {
                setState(() => radioValues[5] = value);
              },

              title: const Text("Doctor, Nurse, or Farmacist"),
              value: 1
            ),

            RadioListTile(
              activeColor: const Color(0xFFEF8800),
              contentPadding: EdgeInsets.zero,
              controlAffinity: ListTileControlAffinity.leading,
              groupValue: radioValues[5],
              onChanged: (value) {
                setState(() => radioValues[5] = value);
              },

              title: const Text("Accountant, Business Analyst, or Manager"),
              value: 2
            ),

            RadioListTile(
              activeColor: const Color(0xFFEF8800),
              contentPadding: EdgeInsets.zero,
              controlAffinity: ListTileControlAffinity.leading,
              groupValue: radioValues[5],
              onChanged: (value) {
                setState(() => radioValues[5] = value);
              },

              title: const Text("Psychologist, Counselor, or HRD"),
              value: 3
            ),

            RadioListTile(
              activeColor: const Color(0xFFEF8800),
              contentPadding: EdgeInsets.zero,
              controlAffinity: ListTileControlAffinity.leading,
              groupValue: radioValues[5],
              onChanged: (value) {
                setState(() => radioValues[5] = value);
              },

              title: const Text("Programmer, Software Engineer, or IT Consultant"),
              value: 4
            ),

            RadioListTile(
              activeColor: const Color(0xFFEF8800),
              contentPadding: EdgeInsets.zero,
              controlAffinity: ListTileControlAffinity.leading,
              groupValue: radioValues[5],
              onChanged: (value) {
                setState(() => radioValues[5] = value);
              },

              title: const Text("Graphic Designer, Architech, or Illustrator"),
              value: 5
            )
          ],
        )
      ),

      Question(
        title: "How much do you like to work with computers and technologies?",
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RadioListTile(
              activeColor: const Color(0xFFEF8800),
              contentPadding: EdgeInsets.zero,
              controlAffinity: ListTileControlAffinity.leading,
              groupValue: radioValues[6],
              onChanged: (value) {
                setState(() => radioValues[6] = value);
              },

              title: const Text("I like it very much and I learn it independently."),
              value: 1
            ),

            RadioListTile(
              activeColor: const Color(0xFFEF8800),
              contentPadding: EdgeInsets.zero,
              controlAffinity: ListTileControlAffinity.leading,
              groupValue: radioValues[6],
              onChanged: (value) {
                setState(() => radioValues[6] = value);
              },

              title: const Text("Quite, especially when directed to."),
              value: 2
            ),

            RadioListTile(
              activeColor: const Color(0xFFEF8800),
              contentPadding: EdgeInsets.zero,
              controlAffinity: ListTileControlAffinity.leading,
              groupValue: radioValues[6],
              onChanged: (value) {
                setState(() => radioValues[6] = value);
              },

              title: const Text("So so."),
              value: 3
            ),

            RadioListTile(
              activeColor: const Color(0xFFEF8800),
              contentPadding: EdgeInsets.zero,
              controlAffinity: ListTileControlAffinity.leading,
              groupValue: radioValues[6],
              onChanged: (value) {
                setState(() => radioValues[6] = value);
              },

              title: const Text("Not quite."),
              value: 4
            ),

            RadioListTile(
              activeColor: const Color(0xFFEF8800),
              contentPadding: EdgeInsets.zero,
              controlAffinity: ListTileControlAffinity.leading,
              groupValue: radioValues[6],
              onChanged: (value) {
                setState(() => radioValues[6] = value);
              },

              title: const Text("I don't like it at all."),
              value: 5
            )
          ],
        )
      ),

      Question(
        title: "When studying, which method helps you understand the subject?",
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RadioListTile(
              activeColor: const Color(0xFFEF8800),
              contentPadding: EdgeInsets.zero,
              controlAffinity: ListTileControlAffinity.leading,
              groupValue: radioValues[7],
              onChanged: (value) {
                setState(() => radioValues[7] = value);
              },

              title: const Text("Looking at a visual object, picture, or diagram"),
              value: 1
            ),

            RadioListTile(
              activeColor: const Color(0xFFEF8800),
              contentPadding: EdgeInsets.zero,
              controlAffinity: ListTileControlAffinity.leading,
              groupValue: radioValues[7],
              onChanged: (value) {
                setState(() => radioValues[7] = value);
              },

              title: const Text("Listening a lecture and discussing"),
              value: 2
            ),

            RadioListTile(
              activeColor: const Color(0xFFEF8800),
              contentPadding: EdgeInsets.zero,
              controlAffinity: ListTileControlAffinity.leading,
              groupValue: radioValues[7],
              onChanged: (value) {
                setState(() => radioValues[7] = value);
              },

              title: const Text("Reading and writing independently"),
              value: 3
            ),

            RadioListTile(
              activeColor: const Color(0xFFEF8800),
              contentPadding: EdgeInsets.zero,
              controlAffinity: ListTileControlAffinity.leading,
              groupValue: radioValues[7],
              onChanged: (value) {
                setState(() => radioValues[7] = value);
              },

              title: const Text("Practicing"),
              value: 4
            ),

            RadioListTile(
              activeColor: const Color(0xFFEF8800),
              contentPadding: EdgeInsets.zero,
              controlAffinity: ListTileControlAffinity.leading,
              groupValue: radioValues[7],
              onChanged: (value) {
                setState(() => radioValues[7] = value);
              },

              title: const Text("Teaching and retell it to others"),
              value: 5
            )
          ],
        )
      ),

      Question(
        title: "In your opinion, which kind of major that suits you and why?",
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: textArea,
              decoration: InputDecoration(
                errorText: (textValue == "") ? "Text area can't be empty" : null,
                hintText: "Type here ..."
              ),

              maxLines: 10,
              onChanged: (value) {
                setState(() {
                  textValue = value;
                });
              }
            )
          ],
        )
      ),
    ];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text("Answer these questions!"),
            const Text(
              "There's no right or wrong answer.",
              style: TextStyle(fontWeight: FontWeight.bold)
            ),

            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Question ${index + 1}",
                          style: const TextStyle(color: Color(0xFF6DCAF6), fontWeight: FontWeight.bold)
                        ),

                        Text(questions[index].title),
                        const SizedBox(height: 16.0),
                        questions[index].content
                      ]
                    )
                  );
                },

                itemCount: questions.length
              )
            ),

            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                if (textValue == "") return;

                // Score Evaluation

                result = "Engineer";

                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Result(result)
                  )
                );
              },

              child: const SizedBox(
                width: double.infinity,
                child: Text("Submit", textAlign: TextAlign.center)
              )
            )
          ]
        )
      )
    );
  }
}
