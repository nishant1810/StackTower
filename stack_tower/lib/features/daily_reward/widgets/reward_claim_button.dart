import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RewardClaimButton extends StatefulWidget {
  const RewardClaimButton({
    super.key,
    required this.canClaim,
    required this.onPressed,
  });

  final bool canClaim;
  final Future<void> Function() onPressed;

  @override
  State<RewardClaimButton> createState() =>
      _RewardClaimButtonState();
}

class _RewardClaimButtonState
    extends State<RewardClaimButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  bool _loading = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1600,
      ),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _claim() async {
    if (_loading || !widget.canClaim) return;

    setState(() {
      _loading = true;
    });

    HapticFeedback.mediumImpact();

    await widget.onPressed();

    if (!mounted) return;

    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        final glow = widget.canClaim
            ? 25 +
            math.sin(
              _controller.value *
                  math.pi,
            ) *
                15
            : 0;

        return AnimatedOpacity(
          duration: const Duration(
            milliseconds: 300,
          ),
          opacity: widget.canClaim ? 1 : .65,
          child: SizedBox(
            width: double.infinity,
            height: 64,
            child: ElevatedButton(
              onPressed: widget.canClaim
                  ? _claim
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor:
                const Color(
                  0xFFFFB300,
                ),
                foregroundColor:
                Colors.black,
                elevation: 0,
                shape:
                RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(
                    20,
                  ),
                ),
                shadowColor: Colors.amber
                    .withValues(
                  alpha: .45,
                ),
              ).copyWith(
                shadowColor:
                WidgetStatePropertyAll(
                  Colors.amber.withValues(
                    alpha: .45,
                  ),
                ),
              ),
              child: Ink(
                decoration: BoxDecoration(
                  borderRadius:
                  BorderRadius.circular(
                    20,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.amber
                          .withValues(
                        alpha: .45,
                      ),
                      blurRadius: glow,
                    ),
                  ],
                ),
                child: Center(
                  child: _loading
                      ? const SizedBox(
                    width: 26,
                    height: 26,
                    child:
                    CircularProgressIndicator(
                      strokeWidth: 3,
                      color:
                      Colors.black,
                    ),
                  )
                      : Row(
                    mainAxisAlignment:
                    MainAxisAlignment
                        .center,
                    children: [
                      const Icon(
                        Icons.card_giftcard,
                        size: 28,
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(
                        widget.canClaim
                            ? "CLAIM REWARD"
                            : "COME BACK TOMORROW",
                        style:
                        const TextStyle(
                          fontWeight:
                          FontWeight
                              .w900,
                          fontSize: 18,
                          letterSpacing:
                          1.2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}