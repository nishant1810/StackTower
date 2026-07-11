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

    final size =
        MediaQuery.of(context).size;

    final horizontalMargin =
    (size.width * 0.04)
        .clamp(12.0, 20.0);

    final verticalMargin =
    (size.height * 0.01)
        .clamp(6.0, 12.0);

    final cardPadding =
    (size.width * 0.045)
        .clamp(14.0, 20.0);

    final avatarSize =
    (size.width * 0.16)
        .clamp(56.0, 72.0);

    final achievementIconSize =
    (size.width * 0.075)
        .clamp(26.0, 34.0);

    final titleSize =
    (size.width * 0.045)
        .clamp(16.0, 20.0);

    final descSize =
    (size.width * 0.033)
        .clamp(12.0, 14.0);

    final progressSize =
    (size.width * 0.032)
        .clamp(11.0, 13.0);

    final rewardIconSize =
    (size.width * 0.045)
        .clamp(16.0, 20.0);

    final statusIconSize =
    (size.width * 0.07)
        .clamp(22.0, 30.0);

    final buttonHeight =
    (size.height * 0.055)
        .clamp(40.0, 48.0);

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: horizontalMargin,
        vertical: verticalMargin,
      ),
      padding: EdgeInsets.all(
        cardPadding,
      ),
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
                ? Colors.amber
                .withValues(
                alpha: 0.22)
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
            width: avatarSize,
            height: avatarSize,
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
              size:
              achievementIconSize,
              color: isUnlocked
                  ? Colors.amber
                  : Colors.white70,
            ),
          ),

          SizedBox(
            width: size.width * 0.04,
          ),

          Expanded(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment
                  .start,
              children: [
                Text(
                  achievement.title,
                  maxLines: 1,
                  overflow:
                  TextOverflow
                      .ellipsis,
                  style: TextStyle(
                    color: isUnlocked
                        ? Colors.white
                        : Colors
                        .white70,
                    fontSize:
                    titleSize,
                    fontWeight:
                    FontWeight
                        .w700,
                  ),
                ),

                SizedBox(
                  height:
                  size.height *
                      0.005,
                ),

                Text(
                  achievement
                      .description,
                  maxLines: 2,
                  overflow:
                  TextOverflow
                      .ellipsis,
                  style: TextStyle(
                    color: Colors
                        .white60,
                    fontSize:
                    descSize,
                  ),
                ),

                SizedBox(
                  height:
                  size.height *
                      0.015,
                ),

                ClipRRect(
                  borderRadius:
                  BorderRadius
                      .circular(
                    12,
                  ),
                  child:
                  LinearProgressIndicator(
                    minHeight:
                    (size.height *
                        0.01)
                        .clamp(
                      6.0,
                      10.0,
                    ),
                    value: achievement
                        .progressPercent
                        .clamp(
                      0.0,
                      1.0,
                    ),
                    backgroundColor:
                    Colors
                        .white10,
                    valueColor:
                    AlwaysStoppedAnimation(
                      isUnlocked
                          ? Colors
                          .amber
                          : Colors
                          .cyan,
                    ),
                  ),
                ),

                SizedBox(
                  height:
                  size.height *
                      0.01,
                ),

                Text(
                  '$displayProgress/${achievement.target}',
                  style:
                  TextStyle(
                    color: Colors
                        .white70,
                    fontSize:
                    progressSize,
                    fontWeight:
                    FontWeight
                        .w600,
                  ),
                ),

                SizedBox(
                  height:
                  size.height *
                      0.015,
                ),

                Container(
                  padding:
                  EdgeInsets.symmetric(
                    horizontal:
                    size.width *
                        0.025,
                    vertical:
                    size.height *
                        0.008,
                  ),
                  decoration:
                  BoxDecoration(
                    borderRadius:
                    BorderRadius
                        .circular(
                      12,
                    ),
                    color: Colors
                        .amber
                        .withValues(
                      alpha: 0.15,
                    ),
                  ),
                  child: Row(
                    mainAxisSize:
                    MainAxisSize
                        .min,
                    children: [
                      Icon(
                        Icons
                            .monetization_on,
                        color: Colors
                            .amber,
                        size:
                        rewardIconSize,
                      ),

                      SizedBox(
                        width:
                        size.width *
                            0.015,
                      ),

                      Flexible(
                        child: Text(
                          '${achievement.reward} Coins',
                          overflow:
                          TextOverflow
                              .ellipsis,
                          style:
                          TextStyle(
                            color: Colors
                                .amber,
                            fontWeight:
                            FontWeight
                                .w700,
                            fontSize:
                            progressSize +
                                1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                if (isUnlocked)
                  Padding(
                    padding:
                    EdgeInsets.only(
                      top: size.height *
                          0.015,
                    ),
                    child:
                    rewardClaimed
                        ? Container(
                      padding:
                      EdgeInsets.symmetric(
                        horizontal:
                        size.width *
                            0.035,
                        vertical:
                        size.height *
                            0.01,
                      ),
                      decoration:
                      BoxDecoration(
                        color: Colors
                            .green
                            .withValues(
                          alpha:
                          0.18,
                        ),
                        borderRadius:
                        BorderRadius.circular(
                          12,
                        ),
                      ),
                      child: Row(
                        mainAxisSize:
                        MainAxisSize
                            .min,
                        children: [
                          Icon(
                            Icons
                                .check,
                            color:
                            Colors.green,
                            size:
                            rewardIconSize,
                          ),

                          SizedBox(
                            width:
                            size.width *
                                0.015,
                          ),

                          Text(
                            'CLAIMED',
                            style:
                            TextStyle(
                              color: Colors
                                  .green,
                              fontWeight:
                              FontWeight.w700,
                              fontSize:
                              progressSize +
                                  1,
                            ),
                          ),
                        ],
                      ),
                    )
                        : SizedBox(
                      height:
                      buttonHeight,
                      child:
                      ElevatedButton(
                        onPressed:
                        _claiming
                            ? null
                            : _claimReward,
                        style:
                        ElevatedButton.styleFrom(
                          backgroundColor:
                          Colors.amber,
                          foregroundColor:
                          Colors.black,
                          elevation:
                          0,
                          shape:
                          RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(
                              12,
                            ),
                          ),
                        ),
                        child:
                        _claiming
                            ? SizedBox(
                          width:
                          rewardIconSize,
                          height:
                          rewardIconSize,
                          child:
                          const CircularProgressIndicator(
                            strokeWidth:
                            2,
                          ),
                        )
                            : Text(
                          'CLAIM',
                          style:
                          TextStyle(
                            fontWeight:
                            FontWeight.w800,
                            fontSize:
                            progressSize +
                                2,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),

          SizedBox(
            width: size.width * 0.03,
          ),

          Icon(
            isUnlocked
                ? Icons.verified
                : Icons.lock_outline,
            color: isUnlocked
                ? Colors.amber
                : Colors.white54,
            size: statusIconSize,
          ),
        ],
      ),
    );
  }
}