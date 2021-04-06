class Task{
  String taskId;
  String taskName;
  int taskScores;
  bool isCompleted;
  Task({
    this.taskId,
    this.taskName,
    this.taskScores,
    this.isCompleted
  });

  factory Task.fromJson(Map<String, dynamic> parsedJson){
    return Task(
        taskId: parsedJson['id'],
        taskName : parsedJson['name'],
        taskScores : parsedJson ['score'],
        isCompleted : parsedJson ['isCompleted']
    );
  }

}