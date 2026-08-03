import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/services/network_service.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class NetworkListener extends StatefulWidget {
  final Widget child;

  const NetworkListener({super.key, required this.child});

  @override
  State<NetworkListener> createState() => _NetworkListenerState();
}

class _NetworkListenerState extends State<NetworkListener> {
  late StreamSubscription<List<ConnectivityResult>> subscription;

  bool hasInternet = true;

  @override
  void initState() {
    super.initState();

    subscription = NetworkService.onConnectionChanged.listen((result) {
      setState(() {
        hasInternet = !result.contains(ConnectivityResult.none);
      });
    });
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        if (!hasInternet)
          SafeArea(
            child: Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: .circular(16),
                color: AppColors.redColor,
              ),
              width: double.infinity,
              child: Row(
                spacing: 10,
                children: [
                  Icon(Icons.error, color: AppColors.whiteColor),
                  Text(
                    AppLocalizations.of(context)!.no_internet,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
