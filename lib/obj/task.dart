class Task {
  String title;
  DateTime dueDate;
  String tag;
  bool done;

  Task(this.title, this.dueDate, this.tag, this.done);

  String getTitle() {
    return title;
  }

  DateTime getDueDate() {
    return dueDate;
  }

  String getTag() {
    return tag;
  }

  void setTitle(String title) {
    this.title = title;
  }

  void setDueDate(DateTime dueDate) {
    this.dueDate = dueDate;
  }

  void setTag(String tag) {
    this.tag = tag;
  }

  bool isDone() {
    return done;
  }

  void setDone(bool done) {
    this.done = done;
  }

  String toString() {
    return 'Task: $title, $dueDate, $tag';
  }
}
