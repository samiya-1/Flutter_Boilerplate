import 'package:flutter/material.dart';
import 'package:mvvm_provider_repo_flutter/res/colors.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({
    super.key,
    required this.title,
    this.loading = false,
    required this.onpress,
  });

  final String title;
  final bool loading;
  final VoidCallback onpress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress,

      child: Container(
        width: 200,
        height: 50,
        decoration: BoxDecoration(
          color: AppColors.buttonColor,
          borderRadius: BorderRadius.circular(10),
        ),

        child: Center(
          child:
              loading
                  ? CircularProgressIndicator(color: AppColors.whiteColor,)
                  : Text(title, style: TextStyle(color: AppColors.whiteColor)),
        ),
      ),
    );
  }
}
