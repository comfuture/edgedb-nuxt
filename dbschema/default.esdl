module default {
  scalar type Sentiment extending enum<Yes, Maybe, No> {
    annotation title := "참석 가능 여부";
  }

  type Person {
    annotation title := "이용자";
    required property name -> str;
  }

  type Attendence {
    annotation title := "이벤트 참석 여부";
    required link event -> Event {
      on source delete delete target; # 이벤트가 삭제되면 참석여부도 지워짐
    }
    required link person -> Person;
    property sentiments -> array<tuple<datetime, Sentiment>>;
    constraint exclusive on ( (Attendence.event, Attendence.person) );
  }

  type Event {
    annotation title := "모임 이벤트";
    required property title -> str;
    property description -> str;
    required link host -> Person;
    multi property date_candidates -> datetime;
    property is_closed -> bool {
      default := false;
    };
    multi link attendences := .<event[is Attendence];
  }
};