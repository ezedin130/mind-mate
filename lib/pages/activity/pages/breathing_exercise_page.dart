import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';

enum BreathPhase { inhale, hold, exhale, idle }

class BreathingExercisePage extends StatefulWidget {
  const BreathingExercisePage({super.key});

  @override
  State<BreathingExercisePage> createState() => _BreathingExercisePageState();
}

class _BreathingExercisePageState extends State<BreathingExercisePage>
    with TickerProviderStateMixin {
  final Map<BreathPhase, int> _phaseDurations = {
    BreathPhase.inhale: 4,
    BreathPhase.hold: 4,
    BreathPhase.exhale: 6,
  };

  BreathPhase _phase = BreathPhase.idle;

  int _remaining = 0;

  bool _isRunning = false;
  bool _isPaused = false;

  Timer? _phaseTimer;
  Stopwatch _sessionStopwatch = Stopwatch();
  Timer? _sessionTimer;

  late AnimationController _animController;
  late Animation<double> _centerScaleAnim;
  late Animation<double> _fillScaleAnim;

  late AnimationController _holdController;

  @override
  void initState() {
    super.initState();

    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _centerScaleAnim = Tween<double>(begin: 0.85, end: 1.15).animate(
      CurvedAnimation(parent: _animController, curve: Curves.easeInOut),
    );

    _fillScaleAnim = Tween<double>(begin: 0.18, end: 1.0).animate(
      CurvedAnimation(parent: _animController, curve: Curves.easeInOut),
    );

    _holdController = AnimationController(vsync: this, duration: const Duration(seconds: 1));

    _resetToIdle();
    _animController.value = 0.5;
  }

  @override
  void dispose() {
    _phaseTimer?.cancel();
    _sessionTimer?.cancel();
    _animController.dispose();
    _holdController.dispose();
    super.dispose();
  }

  void _resetToIdle() {
    _stopEverything();
    setState(() {
      _phase = BreathPhase.idle;
      _remaining = _phaseDurations[BreathPhase.inhale]!;
      _isRunning = false;
      _isPaused = false;
      _animController.value = 0.5;
      _holdController.reset();
      _sessionStopwatch.reset();
    });
  }

  void _stopEverything() {
    _phaseTimer?.cancel();
    _sessionTimer?.cancel();
    _sessionStopwatch.stop();
  }

  void _startSession() {
    if (_isRunning && !_isPaused) return;
    setState(() {
      if (!_isRunning) {
        _phase = BreathPhase.inhale;
        _remaining = _phaseDurations[_phase]!;
      }
      _isRunning = true;
      _isPaused = false;
    });

    if (!_sessionStopwatch.isRunning) {
      _sessionStopwatch.start();
      _sessionTimer = Timer.periodic(const Duration(seconds: 1), (_) {
        setState(() {});
      });
    }

    _startPhaseTimer();
    _startPhaseAnimation();
  }

  void _pauseSession() {
    if (!_isRunning || _isPaused) return;
    _phaseTimer?.cancel();
    _sessionStopwatch.stop();
    setState(() {
      _isPaused = true;
    });
    _animController.stop();
    _holdController.stop();
  }

  void _togglePlayPause() {
    if (!_isRunning) {
      _startSession();
    } else if (_isPaused) {
      setState(() {
        _isPaused = false;
      });
      _sessionStopwatch.start();
      _sessionTimer ??=
          Timer.periodic(const Duration(seconds: 1), (_) => setState(() {}));
      _startPhaseTimer();
      _startPhaseAnimation();
    } else {
      _pauseSession();
    }
  }

  void _resetSession() {
    _resetToIdle();
  }

  void _startPhaseTimer() {
    _phaseTimer?.cancel();
    _phaseTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_isPaused) return;
      setState(() {
        _remaining--;
        if (_remaining <= 0) {
          _advancePhase();
        }
      });
    });
  }

  void _advancePhase() {
    _phaseTimer?.cancel();
    final next = _getNextPhase(_phase);
    setState(() {
      _phase = next;
      _remaining = _phaseDurations[next]!;
    });
    if (_isRunning && !_isPaused) {
      _startPhaseTimer();
      _startPhaseAnimation();
    }
  }

  BreathPhase _getNextPhase(BreathPhase current) {
    switch (current) {
      case BreathPhase.inhale:
        return BreathPhase.hold;
      case BreathPhase.hold:
        return BreathPhase.exhale;
      case BreathPhase.exhale:
        return BreathPhase.inhale;
      case BreathPhase.idle:
      default:
        return BreathPhase.inhale;
    }
  }

  void _startPhaseAnimation() {
    if (_phase == BreathPhase.inhale) {
      _holdController.reset();
      _animController.animateTo(
        1.0,
        duration: Duration(seconds: _phaseDurations[BreathPhase.inhale]!),
        curve: Curves.easeInOut,
      );
    } else if (_phase == BreathPhase.hold) {
      _animController.animateTo(
        0.5,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
      _holdController.duration = Duration(seconds: _phaseDurations[BreathPhase.hold]!);
      _holdController.reset();
      _holdController.forward();
    } else if (_phase == BreathPhase.exhale) {
      _holdController.reset();
      _animController.animateTo(
        0.0,
        duration: Duration(seconds: _phaseDurations[BreathPhase.exhale]!),
        curve: Curves.easeInOut,
      );
    }
  }

  String get _phaseLabel {
    switch (_phase) {
      case BreathPhase.inhale:
        return 'Breathe In';
      case BreathPhase.hold:
        return 'Hold';
      case BreathPhase.exhale:
        return 'Breathe Out';
      default:
        return 'Ready';
    }
  }

  String get _sessionTimeFormatted {
    final elapsed = _sessionStopwatch.elapsed;
    final minutes = elapsed.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = elapsed.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3B1B66),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF47307A), Color(0xFF43194B)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Breathing Exercise',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              '4-4-6 Technique',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
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

                const SizedBox(height: 12),
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 260,
                          height: 260,
                          child: AnimatedBuilder(
                            animation: Listenable.merge([_animController, _holdController]),
                            builder: (context, child) {
                              final fill = _fillScaleAnim.value; // 0.18..1.0
                              final centerScale = _centerScaleAnim.value; // 0.85..1.15
                              final outerSize = 260.0;
                              final outerRadius = outerSize / 2;
                              final fillSize = (outerRadius * 2) * fill; // circle that fills from center
                              final fillRadius = fillSize / 2;
                              final outerOpacity = lerpDouble(0.12, 0.28, 1.0 - fill)!;

                              return Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    width: outerSize,
                                    height: outerSize,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient: RadialGradient(
                                        colors: [
                                          Colors.deepPurple.withOpacity(outerOpacity),
                                          Colors.transparent,
                                        ],
                                        stops: const [0.5, 1.0],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: outerSize * 0.8,
                                    height: outerSize * 0.8,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient: RadialGradient(
                                        colors: [
                                          Colors.pink.withOpacity(0.10 + (fill * 0.1)),
                                          Colors.deepPurple.withOpacity(0.03),
                                        ],
                                      ),
                                    ),
                                  ),
                                  if (fill > 0.02)
                                    Container(
                                      width: fillSize.clamp(0.0, outerSize),
                                      height: fillSize.clamp(0.0, outerSize),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        gradient: RadialGradient(
                                          colors: [
                                            const Color(0xFFFFD5F2).withOpacity(0.95 * fill),
                                            const Color(0xFFFFB2DB).withOpacity(0.95 * fill),
                                          ],
                                          stops: const [0.0, 1.0],
                                        ),
                                      ),
                                    ),
                                  if (_phase == BreathPhase.hold)
                                    _HoldDots(
                                      controller: _holdController,
                                      outerRadius: outerRadius * 0.92,
                                      innerRadius: outerRadius * 0.22,
                                      dotColor: Colors.white70,
                                      dotCount: 9,
                                    ),
                                  Transform.scale(
                                    scale: centerScale,
                                    child: _BreathingMainCircle(
                                      centerNumber:
                                      _isRunning ? '$_remaining' : '${_phaseDurations[BreathPhase.inhale]}',
                                      centerLabel: _isRunning ? _phaseLabel : 'Breathe In',
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 28),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30.0),
                          child: Text(
                            'Take a slow, deep breath in through your nose',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Session Time: ${_sessionTimeFormatted}',
                          style: const TextStyle(color: Colors.white54, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 26, vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(18),
                          backgroundColor: Colors.white,
                          elevation: 6,
                        ),
                        onPressed: _togglePlayPause,
                        child: Icon(
                          !_isRunning || _isPaused ? Icons.play_arrow : Icons.pause,
                          color: Colors.deepPurple,
                          size: 28,
                        ),
                      ),
                      const SizedBox(width: 18),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(14),
                          backgroundColor: Colors.white24,
                          elevation: 0,
                        ),
                        onPressed: _resetSession,
                        child: const Icon(
                          Icons.refresh,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Row(
                          children: [
                            Icon(Icons.lightbulb, color: Colors.white70),
                            SizedBox(width: 8),
                            Text(
                              'Tips for Best Results',
                              style: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Text(
                          '• Find a comfortable seated position\n'
                              '• Close your eyes or soften your gaze\n'
                              '• Focus on the rhythm of your breath\n'
                              '• Practice for 3-5 minutes daily',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
class _BreathingMainCircle extends StatelessWidget {
  final String centerNumber;
  final String centerLabel;
  const _BreathingMainCircle({
    required this.centerNumber,
    required this.centerLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 160,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFF3A8E2), Color(0xFFEE8AB9)],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            offset: const Offset(0, 6),
            blurRadius: 18,
          ),
        ],
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              centerNumber,
              style: const TextStyle(
                fontSize: 46,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              centerLabel,
              style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white70,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}

class _HoldDots extends StatelessWidget {
  final AnimationController controller;
  final double outerRadius;
  final double innerRadius;
  final int dotCount;
  final Color dotColor;

  const _HoldDots({
    required this.controller,
    required this.outerRadius,
    required this.innerRadius,
    this.dotCount = 8,
    this.dotColor = Colors.white70,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final t = controller.value;
        final dots = <Widget>[];
        final baseRadius = lerpDouble(outerRadius, innerRadius, t)!;

        for (int i = 0; i < dotCount; i++) {
          final angle = (2 * math.pi * i) / dotCount - math.pi / 2;
          final dx = baseRadius * math.cos(angle);
          final dy = baseRadius * math.sin(angle);

          final size = lerpDouble(8.0, 4.0, t)!;
          final opacity = lerpDouble(0.95, 0.35, t)!;

          dots.add(Transform.translate(
            offset: Offset(dx, dy),
            child: Opacity(
              opacity: opacity,
              child: Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  color: dotColor,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ));
        }

        return Stack(children: dots);
      },
    );
  }
}

double? lerpDouble(num? a, num? b, double t) {
  if (a == null && b == null) return null;
  a = a ?? 0.0;
  b = b ?? 0.0;
  return a + (b - a) * t;
}