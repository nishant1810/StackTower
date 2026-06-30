import 'package:flutter/material.dart';

import '../models/game_theme.dart';

class ThemeCard extends StatelessWidget {
  final GameTheme theme;
  final bool unlocked;
  final bool selected;
  final VoidCallback onPressed;

  const ThemeCard({
    super.key,
    required this.theme,
    required this.unlocked,
    required this.selected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 190,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xFF141B2D),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: selected
              ? theme.glow
              : Colors.white12,
          width: selected ? 2.5 : 1,
        ),
        boxShadow: [
          if (selected)
            BoxShadow(
              color: theme.glow.withOpacity(0.35),
              blurRadius: 25,
              spreadRadius: 2,
            ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Column(
          children: [
            Expanded(
              flex: 7,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          theme.primary,
                          theme.secondary,
                        ],
                      ),
                    ),
                  ),

                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.45),
                          ],
                        ),
                      ),
                    ),
                  ),

                  if (selected)
                    Positioned(
                      top: 10,
                      left: 10,
                      child: Container(
                        padding:
                        const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius:
                          BorderRadius.circular(20),
                        ),
                        child: const Text(
                          'SELECTED',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight:
                            FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),

                  if (!unlocked)
                    Positioned(
                      top: 10,
                      right: 10,
                      child: Container(
                        padding:
                        const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius:
                          BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.lock,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),

                  Center(
                    child: Icon(
                      Icons.layers,
                      size: 90,
                      color: Colors.white.withOpacity(
                        0.9,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              flex: 3,
              child: Padding(
                padding:
                const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                child: Column(
                  children: [
                    Text(
                      theme.name.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight:
                        FontWeight.w800,
                        fontSize: 16,
                      ),
                    ),

                    const SizedBox(height: 8),

                    if (!unlocked)
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.diamond,
                            size: 18,
                            color:
                            Colors.purpleAccent,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '${theme.cost}',
                            style:
                            const TextStyle(
                              color:
                              Colors.white,
                              fontWeight:
                              FontWeight.bold,
                            ),
                          ),
                        ],
                      ),

                    const Spacer(),

                    SizedBox(
                      width: double.infinity,
                      height: 38,
                      child: ElevatedButton(
                        onPressed: onPressed,
                        style:
                        ElevatedButton.styleFrom(
                          backgroundColor:
                          selected
                              ? Colors.green
                              : theme.glow,
                          foregroundColor:
                          Colors.white,
                          shape:
                          RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius
                                .circular(
                              12,
                            ),
                          ),
                        ),
                        child: Text(
                          selected
                              ? 'SELECTED'
                              : unlocked
                              ? 'EQUIP'
                              : 'BUY',
                          style:
                          const TextStyle(
                            fontWeight:
                            FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}