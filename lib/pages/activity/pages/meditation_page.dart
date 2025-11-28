import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';


class MeditationPage extends StatefulWidget {
  const MeditationPage({super.key});

  @override
  State<MeditationPage> createState() => _MeditationPageState();
}

class _MeditationPageState extends State<MeditationPage>
    with TickerProviderStateMixin {

  int totalSeconds = 60;
  int remainingSeconds = 60;
  Stopwatch _sessionStopwatch = Stopwatch();
  Timer? _sessionTimer;
  Timer? _timer;
  bool isRunning = false;

  List<Map<String, dynamic>> phases = [
    {"icon": "🧘", "title": "Settling In", "instruction": "Find a comfortable position. Close your eyes or soften your gaze."},
    {"icon": "✨", "title": "Body Scan", "instruction": "Notice sensations in your body. Release any tension you find."},
    {"icon": "💭", "title": "Mind Awareness", "instruction": "Let thoughts pass. Bring your focus back to the breath."},
    {"icon": "💗", "title": "Heart Space", "instruction": "Feel warmth and peace in your heart."},
    {"icon": "🌿", "title": "Reflection", "instruction": "Relax deeply. Feel grounded and present."},
  ];

  int currentPhase = 0;

  @override
  void dispose() {
    _timer?.cancel();
    _sessionTimer?.cancel();
    super.dispose();
  }

  void startSession() {
    if (isRunning) return;
    isRunning = true;

    _sessionStopwatch.start();
    _sessionTimer = Timer.periodic(const Duration(seconds: 1), (_) => setState(() {}));

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds > 0) {
        setState(() => remainingSeconds--);
      } else {
        if (currentPhase < 4) {
          setState(() {
            currentPhase++;
            remainingSeconds = totalSeconds;
          });
        } else {
          timer.cancel();
        }
      }
    });
  }

  void pauseSession() {
    isRunning = false;
    _timer?.cancel();
    _sessionStopwatch.stop();
    setState(() {});
  }

  void resetSession() {
    setState(() {
      currentPhase = 0;
      remainingSeconds = totalSeconds;
      isRunning = false;
      _timer?.cancel();
      _sessionStopwatch.reset();
    });
  }

  String get formattedTime {
    int m = remainingSeconds ~/ 60;
    int s = remainingSeconds % 60;
    return "$m:${s.toString().padLeft(2, '0')}";
  }

  String get sessionTimeDisplay {
    final elapsed = _sessionStopwatch.elapsed;
    return "${elapsed.inMinutes}:${(elapsed.inSeconds % 60).toString().padLeft(2, "0")}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3B1B66),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF512DA8), Color(0xFF3B1B66)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        Text("Guided Meditation",
                            style: GoogleFonts.lato(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                        SizedBox(height: 4),
                        Text("Mindful Awareness",
                            style: GoogleFonts.lato(fontSize: 14, color: Colors.white70)),
                      ],
                    ),
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const CircleAvatar(
              radius: 16,
              backgroundColor: Color(0xFF6C4BA3),
              child: Icon(Icons.close, color: Colors.white),
            ),
          ),
                  ],
                ),
              ),
              Text(
                phases[currentPhase]["icon"],
                style:  GoogleFonts.lato(fontSize: 46),
              ),
              Text(
                phases[currentPhase]["title"],
                style:  GoogleFonts.lato(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                "Phase ${currentPhase + 1} of 5",
                style: const TextStyle(color: Colors.white70),
              ),
              const SizedBox(height: 30),
              CircularPercentIndicator(
                radius: 140,
                lineWidth: 10,
                percent: (totalSeconds - remainingSeconds) / totalSeconds,
                animation: true,
                animateFromLastPercent: true,
                progressColor: Colors.white,
                backgroundColor: Colors.white24,
                circularStrokeCap: CircularStrokeCap.round,
                center: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(formattedTime,
                        style: const TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                     Text("remaining", style: GoogleFonts.lato(color: Colors.white70)),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Text(
                  phases[currentPhase]["instruction"],
                  style: const TextStyle(color: Colors.white70, fontSize: 15),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 10),

              Text("Total Session: $sessionTimeDisplay",
                  style:  GoogleFonts.lato(color: Colors.white54)),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _controlButton(
                    icon: isRunning ? Icons.pause : Icons.play_arrow,
                    onTap: () => isRunning ? pauseSession() : startSession(),
                    isPrimary: true,
                  ),
                  const SizedBox(width: 18),
                  _controlButton(icon: Icons.refresh, onTap: resetSession),
                  const SizedBox(width: 18),
                  _controlButton(icon: Icons.volume_up, onTap: () {}),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: 40,
                    height: 6,
                    decoration: BoxDecoration(
                      color: index <= currentPhase ? Colors.white : Colors.white24,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  );
                }),
              ),

              const SizedBox(height: 22),
            ],
          ),
        ),
      ),
    );
  }

  Widget _controlButton({required IconData icon, required VoidCallback onTap, bool isPrimary = false}) {
    return InkWell(
      onTap: onTap,
      child: CircleAvatar(
        radius: isPrimary ? 32 : 28,
        backgroundColor: isPrimary ? Colors.white : Colors.white24,
        child: Icon(icon, color: isPrimary ? Color(0xFF5E35B1) : Colors.white, size: 28),
      ),
    );
  }
}
