import 'package:dashboard/bloc/bpwidgetprops/bpwidget_props_bloc.dart';
import 'package:dashboard/widgets/json_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SaveEditViewButtonWidget extends StatelessWidget {
  final String jsonHeaderName;
  const SaveEditViewButtonWidget({super.key, required this.jsonHeaderName});
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
            try {
              final bpWidgetProps = context.read<BpwidgetPropsBloc>().state.bpwidgetProps;
              final Map<String,dynamic> jsonObject = bpWidgetProps.toMap();
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
            } catch (error) {
              print("finally _buildCircleButton error => $error");
            }
            
            
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
