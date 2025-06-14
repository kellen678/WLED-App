import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:wled/core/core.dart';
import 'package:wled/features/wled_device/wled_device.dart';

import './device_list_slider.dart';
import './device_list_switch.dart';

/// card that displays the Wled device in the main device list and has a couple
/// controls like brightness and power
class DeviceListItem extends StatelessWidget {
  const DeviceListItem({
    Key? key,
    required this.device,
    this.onSave,
    this.onDelete,
    this.onEdit,
    this.onPower,
    this.onPressed,
    this.onSlide,
  }) : super(key: key);

  final WledDevice device;
  final VoidCallback? onSave;
  final VoidCallback? onDelete;
  final VoidCallback? onEdit;
  final VoidCallback? onPressed;
  final ValueChanged<bool>? onPower;
  final ValueChanged<int>? onSlide;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    /// the device also needs to be disabled when the device cant be reached
    /// ( because then we couldn't turn it on anyways )
    final isEnabled =
        device.state.isEnabled && device.status == DeviceStatus.functional;

    /// background gradients for pure black or pure white don't work very well
    /// so clamp the background color within a nice color range
    final color = device.state.segments[device.state.mainSegment].colors.first
        .clamp(0.15, 0.85);

    /// for functional, enabled devices show a nice gradient based on the
    /// active color, otherwise show the default background card color
    final colors = isEnabled
        ? [color.lighten(), color, color.darken()]
        : [theme.cardColor, theme.cardColor];

    /// to make sure the text is always readable we want to switch between
    /// white and black textcolor depending on the background color luminance
    final textColor = color.computeLuminance() < 0.6 || !isEnabled
        ? const Color(0xFFFFFFFF)
        : const Color(0xFF555555);

    /// main item interactions,
    return InkWell(
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      onTap: onPressed,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(colors: colors),
          boxShadow: const [
            BoxShadow(
              blurRadius: 10,
              offset: Offset(0, 3),
              color: Color.fromRGBO(0, 0, 0, 0.2935),
            )
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Icon(Icons.lightbulb, color: textColor),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          device.info.name,
                          style: theme.textTheme.headlineMedium!
                              .copyWith(color: textColor),
                        ),
                        Text(
                          device.info.ipAddress,
                          style: theme.textTheme.titleMedium!
                              .copyWith(color: textColor),
                        )
                      ],
                    ),
                  ),

                  const Spacer(),

                  /// only show the enable switch when the device
                  /// can actually be used
                  if (device.status == DeviceStatus.functional)
                    DeviceListSwitch(
                      value: isEnabled,
                      onChanged: onPower,
                    ),

                  /// menu button that opens the options menu in a bottom sheet
                  const SizedBox(width: Kpadding.medium),
                  RoundIconButton(
                    icon: FeatherIcons.delete,
                    onPressed: () {},
                    ),
                ],
              ),
            ),

            /// It's possible that a saved device is displayed but actually
            /// isn't usuable (e.g. when you're on a different network )
            /// so dont shot the slider if the device isnt reachable
            if (device.status == DeviceStatus.functional)
              DeviceListSlider(
                color: color,
                value: device.state.brightness.toDouble().clamp(0, 255),
                enabled: isEnabled,
                onChanged: onSlide,
              )
            else
              const Center(child: Text('device not reachable')),
          ],
        ),
      ),
    );
  }
}
