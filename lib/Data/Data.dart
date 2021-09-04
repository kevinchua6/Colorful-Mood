import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum Status { HAPPY, DEPRESSED, ANGRY, CALM }

class CauseWithIcon {
  IconData iconData;
  String description;
  Cause cause;

  static final CauseWithIcon HOME =
      CauseWithIcon(Icons.house_outlined, 'home', Cause.HOME);
  static final CauseWithIcon HEALTH =
      CauseWithIcon(Icons.health_and_safety_outlined, 'health', Cause.HEALTH);
  static final CauseWithIcon WORK =
      CauseWithIcon(Icons.work_outline, 'work', Cause.WORK);
  static final CauseWithIcon OTHERS =
      CauseWithIcon(Icons.add, 'others', Cause.OTHERS);
  CauseWithIcon(this.iconData, this.description, this.cause);
}

class MoodState {
  Status status;
  int extent;
  MoodState(this.status, this.extent) {
    assert(extent >= 0 && extent <= 3);
  }
}

enum Cause { HOME, HEALTH, WORK, OTHERS }

class MoodRecord {
  MoodState moodState;
  List<Cause> causes = [];
  String details = "";

  MoodRecord(this.moodState);

  MoodRecord.withCauses(this.moodState, List<Cause> causes) {
    for (Cause c in causes) {
      this.causes.add(c);
    }
  }

  void addCause(Cause cause) {
    causes.add(cause);
  }

  void setDetails(String details) {
    this.details = details;
  }
}

class Store {
  static Store store = new Store();
  static MoodRecord? currentRecord;
  // TODO: Add records grouped by day
  List<MoodRecord> records = [];

  static void createRecordWithState(Status status, int extent) {
    currentRecord = MoodRecord(MoodState(status, extent));
  }

  static void addCauses(List<Cause> causes) {
    for (Cause cause in causes) {
      currentRecord!.addCause(cause);
    }
  }

  static void commit() {
    store.records.add(currentRecord!);
  }

  static addRecord(Status status, int extent) {
    store.records.add(MoodRecord(MoodState(status, extent)));
  }
}
