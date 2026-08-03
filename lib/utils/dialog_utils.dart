import 'package:evently_app/utils/app_assets.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DialogUtils {
  static Future<void> dialog({
    required BuildContext context,
    required Function onDelete,
    required VoidCallback onCancel,
    required bool isLoading,
    required String eventName,
  }) {
    return showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              title: Column(
                spacing: 8,
                children: [
                  CircleAvatar(
                    radius: 26,
                    backgroundColor: AppColors.redColor.withValues(alpha: 0.1),
                    child: SvgPicture.asset(AppAssets.trashIcon, width: 32),
                  ),
                  Text('Delete Event?'),
                ],
              ),
              content: Column(
                mainAxisSize: .min,
                crossAxisAlignment: .stretch,
                children: [
                  Text(
                    textAlign: .center,
                    'Are you sure you want to delete',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text(textAlign: .center, '"$eventName Event"?'),
                  SizedBox(height: 10),
                  Text(
                    textAlign: .center,
                    'This action can`t be undone.',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Divider(height: 30),
                  Row(
                    spacing: 10,
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: onCancel,
                          child: Container(
                            padding: .symmetric(vertical: 8, horizontal: 16),
                            decoration: BoxDecoration(
                              border: .all(color: AppColors.disableColor),
                              borderRadius: .circular(8),
                            ),
                            child: Row(
                              spacing: 4,
                              mainAxisSize: .min,
                              children: [
                                Icon(
                                  Icons.cancel_outlined,
                                  color: Theme.of(context).cardColor,
                                ),
                                Text('Cancel'),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () async {
                            setState(() {
                              isLoading = true;
                            });
                            await onDelete();
                            setState(() {
                              isLoading = false;
                            });
                          },
                          child: Container(
                            padding: .symmetric(vertical: 8, horizontal: 16),
                            clipBehavior: .antiAlias,
                            decoration: BoxDecoration(
                              color: AppColors.redColor,
                              borderRadius: .circular(8),
                            ),
                            child: isLoading
                                ? Center(
                                    child: SizedBox(
                                      height: 24,
                                      width: 24,
                                      child: CircularProgressIndicator(
                                        color: AppColors.whiteColor,
                                      ),
                                    ),
                                  )
                                : Row(
                                    spacing: 4,
                                    mainAxisSize: .min,
                                    children: [
                                      Icon(
                                        Icons.delete_outline,
                                        color: AppColors.whiteColor,
                                      ),
                                      Text(
                                        'Delete',
                                        style: TextStyle(
                                          color: AppColors.whiteColor,
                                        ),
                                      ),
                                    ],
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
