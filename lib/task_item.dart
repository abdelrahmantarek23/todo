import 'package:flutter/material.dart';
import 'package:to_do/app_colors.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 115,
      margin: EdgeInsets.symmetric(horizontal: 12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Slidable(
        startActionPane: ActionPane(
          motion: DrawerMotion(),
          extentRatio: .6,
          children: [
            SlidableAction(
              onPressed: (context) {},
              label: "Delete",
              backgroundColor: Colors.red,
              icon: Icons.delete,
              spacing: 8,
              padding: EdgeInsets.zero,
              autoClose: true,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                bottomLeft: Radius.circular(25),
              ),
            ),
            SlidableAction(
              onPressed: (context) {},
              label: "Edit",
              backgroundColor: Colors.blue,
              icon: Icons.edit,
              spacing: 8,
              autoClose: true,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Container(
                height: 80,
                width: 4,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Task Title",
                      style: TextStyle(fontSize: 18, color: AppColors.primary),
                    ),
                    Text(
                      "Task Description",
                      style: TextStyle(fontSize: 14, color: AppColors.grey),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Icon(
                  Icons.done,
                  color: Colors.white,
                  size: 30,
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
