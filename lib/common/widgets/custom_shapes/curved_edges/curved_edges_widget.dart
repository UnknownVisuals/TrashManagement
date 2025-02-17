import 'package:flutter/material.dart';
import 'package:trash_management/common/widgets/custom_shapes/curved_edges/curved_edges.dart';

class REYCurvedEdgesWidget extends StatelessWidget {
  const REYCurvedEdgesWidget({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: REYCustomCurvedEdges(),
      child: child,
    );
  }
}
