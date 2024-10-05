import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:to_do/models/task_model.dart';

class FirebaseFunctions {
  CollectionReference<TaskModel> getTasksCollection() {
    return FirebaseFirestore.instance
        .collection("Tasks")
        .withConverter<TaskModel>(
      fromFirestore: (snapshot, _) {
        return TaskModel.fromJson(snapshot.data()!);
      },
      toFirestore: (task, _) {
        return task.toJson();
      },
    );
  }

  Future<void> addTask(TaskModel task) {
    var collection = getTasksCollection();
    var docRef = collection.doc();
    task.id = docRef.id;
    return collection.doc(task.id).set(task);
  }

  static Future<QuerySnapshot<TaskModel>> getTasks(){
    var collection = FirebaseFunctions().getTasksCollection();
    return collection.get();
  }
}
