class Task{
  String taskId;
  String taskName;
  int taskScores;
  Task({
    this.taskId,
    this.taskName,
    this.taskScores
  });

  factory Task.fromJson(Map<String, dynamic> parsedJson){
    return Task(
        taskId: parsedJson['id'],
        taskName : parsedJson['name'],
        taskScores : parsedJson ['score']
    );
  }

}