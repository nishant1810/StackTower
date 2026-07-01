import 'package:flutter/material.dart';

import '../../../core/services/storage/storage_service.dart';
import '../models/achievement_model.dart';

class AchievementCard extends StatefulWidget {
  final AchievementModel achievement;
  final VoidCallback? onRewardClaimed;

  const AchievementCard({
    super.key,
    required this.achievement,
    this.onRewardClaimed,
  });

  @override
  State<AchievementCard> createState() =>
      _AchievementCardState();
}

class _AchievementCardState
    extends State<AchievementCard> {
  bool _claiming = false;

  Future<void> _claimReward() async {
    if (_claiming) return;

    setState(() {
      _claiming = true;
    });

    await StorageService.addCoins(
      widget.achievement.reward,
    );

    await StorageService
        .claimAchievementReward(
      widget.achievement.id,
    );

    if (mounted) {
      setState(() {
        _claiming = false;
      });
    }

    widget.onRewardClaimed?.call();
  }

  @override
  Widget build(BuildContext context) {
    final achievement =
        widget.achievement;

    final isUnlocked =
        achievement.unlocked;

    final rewardClaimed =
        achievement.rewardClaimed;

    final displayProgress =
    achievement.progress >
        achievement.target
        ? achievement.target
        : achievement.progress;

    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius:
        BorderRadius.circular(24),
        color: Colors.white.withValues(
          alpha: 0.08,
        ),
        border: Border.all(
          color: isUnlocked
              ? Colors.amber
              : Colors.white24,
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: isUnlocked
                ? Colors.amber.withValues(
              alpha: 0.22,
            )
                : Colors.black26,
            blurRadius: 20,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [
          Container(
            width: 68,
            height: 68,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isUnlocked
                  ? Colors.amber
                  .withValues(
                  alpha: 0.18)
                  : Colors.white10,
            ),
            child: Icon(
              achievement.icon,
              size: 32,
              color: isUnlocked
                  ? Colors.amber
                  : Colors.white70,
            ),
          ),

          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Text(
                  achievement.title,
                  style: TextStyle(
                    color: isUnlocked
                        ? Colors.white
                        : Colors.white70,
                    fontSize: 18,
                    fontWeight:
                    FontWeight.w700,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  achievement.description,
                  style: const TextStyle(
                    color: Colors.white60,
                    fontSize: 13,
                  ),
                ),

                const SizedBox(height: 12),

                ClipRRect(
                  borderRadius:
                  BorderRadius.circular(
                    12,
                  ),
                  child:
                  LinearProgressIndicator(
                    minHeight: 8,
                    value: achievement
                        .progressPercent
                        .clamp(
                      0.0,
                      1.0,
                    ),
                    backgroundColor:
                    Colors.white10,
                    valueColor:
                    AlwaysStoppedAnimation(
                      isUnlocked
                          ? Colors.amber
                          : Colors.cyan,
                    ),
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  '$displayProgress/${achievement.target}',
                  style:
                  const TextStyle(
                    color:
                    Colors.white70,
                    fontSize: 12,
                    fontWeight:
                    FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 12),

                Container(
                  padding:
                  const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration:
                  BoxDecoration(
                    borderRadius:
                    BorderRadius.circular(
                        12),
                    color: Colors.amber
                        .withValues(
                      alpha: 0.15,
                    ),
                  ),
                  child: Row(
                    mainAxisSize:
                    MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons
                            .monetization_on,
                        color:
                        Colors.amber,
                        size: 18,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        '${achievement.reward} Coins',
                        style:
                        const TextStyle(
                          color:
                          Colors.amber,
                          fontWeight:
                          FontWeight
                              .w700,
                        ),
                      ),
                    ],
                  ),
                ),

                if (isUnlocked)
                  Padding(
                    padding:
                    const EdgeInsets.only(
                      top: 12,
                    ),
                    child: rewardClaimed
                        ? Container(
                      padding:
                      const EdgeInsets
                          .symmetric(
                        horizontal:
                        14,
                        vertical: 8,
                      ),
                      decoration:
                      BoxDecoration(
                        color: Colors
                            .green
                            .withValues(
                          alpha: 0.18,
                        ),
                        borderRadius:
                        BorderRadius
                            .circular(
                          12,
                        ),
                      ),
                      child: const Row(
                        mainAxisSize:
                        MainAxisSize
                            .min,
                        children: [
                          Icon(
                            Icons.check,
                            color: Colors
                                .green,
                            size: 18,
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            'CLAIMED',
                            style:
                            TextStyle(
                              color: Colors
                                  .green,
                              fontWeight:
                              FontWeight
                                  .w700,
                            ),
                          ),
                        ],
                      ),
                    )
                        : SizedBox(
                      height: 42,
                      child:
                      ElevatedButton(
                        onPressed:
                        _claiming
                            ? null
                            : _claimReward,
                        style:
                        ElevatedButton
                            .styleFrom(
                          backgroundColor:
                          Colors
                              .amber,
                          foregroundColor:
                          Colors
                              .black,
                          elevation: 0,
                          shape:
                          RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius
                                .circular(
                              12,
                            ),
                          ),
                        ),
                        child: _claiming
                            ? const SizedBox(
                          width: 18,
                          height:
                          18,
                          child:
                          CircularProgressIndicator(
                            strokeWidth:
                            2,
                          ),
                        )
                            : const Text(
                          'CLAIM',
                          style:
                          TextStyle(
                            fontWeight:
                            FontWeight
                                .w800,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),

          const SizedBox(width: 12),

          Icon(
            isUnlocked
                ? Icons.verified
                : Icons.lock_outline,
            color: isUnlocked
                ? Colors.amber
                : Colors.white54,
            size: 28,
          ),
        ],
      ),
    );
  }
}