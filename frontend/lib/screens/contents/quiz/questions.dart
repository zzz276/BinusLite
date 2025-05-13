import 'package:binus_lite/models/components/question.dart';
import 'package:binus_lite/screens/contents/quiz/result.dart';
import 'package:flutter/material.dart';

class Questions extends StatefulWidget {
  const Questions({super.key});

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  static late List<Question> questions;
  static late List<double> sliderValues;
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
    sliderValues = List.generate(8, (index) => (1.0 + index * 0), growable: false);
    questions = [
      Question(
        title: "How much did you enjoy these subjects at school?\n(1-scale: \"I don't like it at all.\",\n5-scale: \"I like it very much.\")\nChoose the number 1 to 5 for each item!",
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
            
            const Text("B. Indonesian"),
            Slider(
              divisions: 4,
              label: generateLabel(sliderValues[1]),
              max: 5.0,
              min: 1.0,
              onChanged: (value) => setState(() => sliderValues[1] = value),
              value: sliderValues[1]
            ),
            
            const Text("C. Biology"),
            Slider(
              divisions: 4,
              label: generateLabel(sliderValues[2]),
              max: 5.0,
              min: 1.0,
              onChanged: (value) => setState(() => sliderValues[2] = value),
              value: sliderValues[2]
            ),
            
            const Text("D. Physics"),
            Slider(
              divisions: 4,
              label: generateLabel(sliderValues[3]),
              max: 5.0,
              min: 1.0,
              onChanged: (value) => setState(() => sliderValues[3] = value),
              value: sliderValues[3]
            ),
            
            const Text("E. Economy"),
            Slider(
              divisions: 4,
              label: generateLabel(sliderValues[4]),
              max: 5.0,
              min: 1.0,
              onChanged: (value) => setState(() => sliderValues[4] = value),
              value: sliderValues[4]
            ),
            
            const Text("F. Sociology"),
            Slider(
              divisions: 4,
              label: generateLabel(sliderValues[5]),
              max: 5.0,
              min: 1.0,
              onChanged: (value) => setState(() => sliderValues[5] = value),
              value: sliderValues[5]
            ),
            
            const Text("G. Foreign Languages (e.g. English, Japanese, etc.)"),
            Slider(
              divisions: 4,
              label: generateLabel(sliderValues[6]),
              max: 5.0,
              min: 1.0,
              onChanged: (value) => setState(() => sliderValues[6] = value),
              value: sliderValues[6]
            ),
            
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

          ],
        )
      ),

      Question(
        title: "Which kind of activities do you like to fill your leisure time?",
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

          ],
        )
      ),

      Question(
        title: "Which one of the following skills are you good at?",
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

          ],
        )
      ),

      Question(
        title: "Which topics spark your curiosity?",
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

          ],
        )
      ),

      Question(
        title: "If you must decide what to do for your final project, you'll choose:",
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

          ],
        )
      ),

      Question(
        title: "From the following list, which professions are your calling?",
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

          ],
        )
      ),

      Question(
        title: "How much do you like to work with computers and technologies?",
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

          ],
        )
      ),

      Question(
        title: "When studying, which one helps you understand the subject?",
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

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
              decoration: const InputDecoration(hintText: "Type here ..."),
              maxLines: 10
            )
          ],
        )
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text(
                "Answer these questions!"
              ),

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
      )
    );
  }
}
