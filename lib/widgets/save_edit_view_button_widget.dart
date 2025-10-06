import 'package:dashboard/widgets/json_viewer.dart';
import 'package:flutter/material.dart';

class SaveEditViewButtonWidget extends StatelessWidget {
  final String jsonHeaderName;
  final Map<String,dynamic> jsonObject;
  const SaveEditViewButtonWidget({super.key, required this.jsonHeaderName, required this.jsonObject});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildCircleButton(
          color: Colors.orangeAccent,
          icon: Icons.edit,
          onPressed: () {
            print('Edit clicked');
          },
        ),
         const SizedBox(width: 8),
        _buildCircleButton(
          color: Colors.green,
          icon: Icons.save,
          onPressed: () {
            print('Save clicked');
          },
        ),
        const SizedBox(width: 8),
        _buildCircleButton(
          color: Colors.blue,
          icon: Icons.visibility,
          onPressed: () {
             print(" before to Open Json Viewer");
             Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (_) => JsonViewer(
                      jsonHeader: jsonHeaderName,
                      jsonObject: jsonObject
                    )
              ),
            );
          },
        ),
      ],
    );
  }
}

Widget _buildCircleButton({
  required Color color,
  required IconData icon,
  required VoidCallback onPressed,
}) {
  return InkWell(
    onTap: onPressed,
    borderRadius: BorderRadius.circular(40),
    child: Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        color: color.withOpacity(0.9),
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        size: 15,
        color: Colors.white,
      ),
    ),
  );
}
