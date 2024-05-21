import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';

import 'easy_image_viewer_dismissible_dialog.dart';

class DismissibleDialogWithDelete extends EasyImageViewerDismissibleDialog {
  final VoidCallback? onDelete;

  const DismissibleDialogWithDelete(
    EasyImageProvider imageProvider, {
    Key? key,
    bool immersive = true,
    void Function(int)? onPageChanged,
    void Function(int)? onViewerDismissed,
    bool useSafeArea = false,
    bool swipeDismissible = false,
    bool doubleTapZoomable = false,
    bool infinitelyScrollable = false,
    required Color backgroundColor,
    required String closeButtonTooltip,
    required Color closeButtonColor,
    this.onDelete,
  }) : super(
          imageProvider,
          key: key,
          immersive: immersive,
          onPageChanged: onPageChanged,
          onViewerDismissed: onViewerDismissed,
          useSafeArea: useSafeArea,
          swipeDismissible: swipeDismissible,
          doubleTapZoomable: doubleTapZoomable,
          infinitelyScrollable: infinitelyScrollable,
          backgroundColor: backgroundColor,
          closeButtonTooltip: closeButtonTooltip,
          closeButtonColor: closeButtonColor,
        );

  @override
  State<DismissibleDialogWithDelete> createState() =>
      _DismissibleDialogWithDeleteState();
}

class _DismissibleDialogWithDeleteState
    extends State<DismissibleDialogWithDelete> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        EasyImageViewerDismissibleDialog(
          widget.imageProvider,
          key: widget.key,
          immersive: widget.immersive,
          onPageChanged: widget.onPageChanged,
          onViewerDismissed: widget.onViewerDismissed,
          useSafeArea: widget.useSafeArea,
          swipeDismissible: widget.swipeDismissible,
          doubleTapZoomable: widget.doubleTapZoomable,
          infinitelyScrollable: widget.infinitelyScrollable,
          backgroundColor: widget.backgroundColor,
          closeButtonTooltip: widget.closeButtonTooltip,
          closeButtonColor: widget.closeButtonColor,
        ),
        Positioned(
          top: 5,
          left: 5,
          child: IconButton(
            icon: Icon(Icons.delete,
                color: Theme.of(context).colorScheme.primary),
            onPressed: widget.onDelete,
          ),
        ),
      ],
    );
  }
}
