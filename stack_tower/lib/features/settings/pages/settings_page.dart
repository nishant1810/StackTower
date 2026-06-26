import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../services/audio_service.dart';
import '../../services/settings_service.dart';

import 'widgets/animated_glow_border.dart';
import 'widgets/animated_gradient_text.dart';
import 'widgets/floating_particles.dart';
import 'widgets/glowing_icon_button.dart';
import 'widgets/neon_background.dart';
import 'widgets/neon_panel.dart';
import 'widgets/setting_tile.dart';
import 'widgets/version_card.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() =>
      _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen>
    with SingleTickerProviderStateMixin {
bool music = true;
bool sound = true;
bool vibration = true;

late final AnimationController _controller;
late final Animation<double> _fadeAnimation;
late final Animation<Offset> _slideAnimation;

@override
void initState() {
super.initState();

music = SettingsService.musicEnabled;
sound = SettingsService.soundEnabled;
vibration = SettingsService.vibrationEnabled;

_controller = AnimationController(
vsync: this,
duration: const Duration(milliseconds: 900),
);

_fadeAnimation = CurvedAnimation(
parent: _controller,
curve: Curves.easeOut,
);

_slideAnimation = Tween<Offset>(
begin: const Offset(0, .15),
end: Offset.zero,
).animate(
CurvedAnimation(
parent: _controller,
curve: Curves.easeOutCubic,
),
);

_controller.forward();
}

@override
void dispose() {
_controller.dispose();
super.dispose();
}

Future<void> _toggleMusic(bool value) async {
setState(() => music = value);

await SettingsService.setMusic(value);

if (value) {
await AudioService.startBackgroundMusic();
} else {
await AudioService.stopBackgroundMusic();
}
}

Future<void> _toggleSound(bool value) async {
setState(() => sound = value);
await SettingsService.setSound(value);
}

Future<void> _toggleVibration(bool value) async {
setState(() => vibration = value);
await SettingsService.setVibration(value);
}

@override
Widget build(BuildContext context) {
return Scaffold(
body: Stack(
children: [
const NeonBackground(),
const FloatingParticles(),

SafeArea(
child: FadeTransition(
opacity: _fadeAnimation,
child: SlideTransition(
position: _slideAnimation,
child: SingleChildScrollView(
padding: const EdgeInsets.symmetric(
horizontal: 20,
vertical: 24,
),
child: Center(
child: AnimatedGlowBorder(
child: NeonPanel(
child: Column(
children: [
Row(
children: [
GlowingIconButton(
icon: Icons.arrow_back_ios_new_rounded,
onTap: () => Navigator.pop(context),
),

const Spacer(),

  const AnimatedGradientText(
    "SETTINGS",
  ),

const Spacer(),

const SizedBox(width: 56),
],
),

const SizedBox(height: 36),

SettingTile(
icon: Icons.music_note_rounded,
title: "Music",
value: music,
color: const Color(0xff8B5CF6),
onChanged: _toggleMusic,
),

const SizedBox(height: 16),

SettingTile(
icon: Icons.volume_up_rounded,
title: "Sound Effects",
value: sound,
color: const Color(0xff38BDF8),
onChanged: _toggleSound,
),

const SizedBox(height: 16),

SettingTile(
icon: Icons.vibration_rounded,
title: "Vibration",
value: vibration,
color: const Color(0xffFB923C),
onChanged: _toggleVibration,
),

const SizedBox(height: 16),
  SettingTile.button(
    icon: Icons.privacy_tip_outlined,
    title: "Privacy Policy",
    color: const Color(0xFF60A5FA),
    onTap: () {
      // TODO:
      // Launch your Privacy Policy URL
    },
  ),

  const SizedBox(height: 16),

  SettingTile.button(
    icon: Icons.star_rate_rounded,
    title: "Rate Us",
    color: const Color(0xFFFACC15),
    onTap: () {
      // TODO:
      // Launch Google Play Store page
    },
  ),

  const SizedBox(height: 16),

  SettingTile.button(
    icon: Icons.info_outline_rounded,
    title: "About",
    color: const Color(0xFF22D3EE),
    onTap: () {
      showAboutDialog(
        context: context,
        applicationName: "Stack Tower",
        applicationVersion: "1.0.0",
        applicationIcon: Container(
          width: 52,
          height: 52,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                Color(0xff00E5FF),
                Color(0xff7C4DFF),
              ],
            ),
          ),
          child: const Icon(
            Icons.stacked_bar_chart_rounded,
            color: Colors.white,
            size: 30,
          ),
        ),
        children: const [
          SizedBox(height: 12),
          Text(
            "Stack Tower is a futuristic neon block stacking game built with Flutter & Flame.\n\n"
                "🎮 Stack perfectly to earn higher scores.\n"
                "💰 Collect coins and unlock new themes.\n"
                "🏆 Beat your best score.\n"
                "🚀 Designed with a premium cyberpunk style.",
            style: TextStyle(
              height: 1.5,
              fontSize: 14,
            ),
          ),
        ],
      );
    },
  ),

  const SizedBox(height: 28),

  const VersionCard(),

  const SizedBox(height: 20),
],
),
),
),
),
),
),
),
),
],
),
);
}
}