CREATE MIGRATION m1vxqqhj2e35utjkfqfctplfikfjny6ldrxwsh3uaewwwtbeqlx5ka
    ONTO initial
{
  CREATE SCALAR TYPE default::Sentiment EXTENDING enum<Yes, Maybe, No> {
      CREATE ANNOTATION std::title := '참석 가능 여부';
  };
  CREATE TYPE default::Person {
      CREATE ANNOTATION std::title := '이용자';
      CREATE REQUIRED PROPERTY name -> std::str;
  };
  CREATE TYPE default::Attendence {
      CREATE PROPERTY sentiments -> array<tuple<std::datetime, default::Sentiment>>;
      CREATE ANNOTATION std::title := '이벤트 참석 여부';
      CREATE REQUIRED LINK person -> default::Person;
  };
  CREATE TYPE default::Event {
      CREATE ANNOTATION std::title := '모임 이벤트';
      CREATE REQUIRED LINK host -> default::Person;
      CREATE MULTI PROPERTY date_candidates -> std::datetime;
      CREATE PROPERTY is_closed -> std::bool {
          SET default := false;
      };
      CREATE REQUIRED PROPERTY title -> std::str;
  };
  ALTER TYPE default::Attendence {
      CREATE REQUIRED LINK event -> default::Event {
          ON SOURCE DELETE DELETE TARGET;
      };
      CREATE CONSTRAINT std::exclusive ON ((default::Attendence.event, default::Attendence.person));
  };
  ALTER TYPE default::Event {
      CREATE MULTI LINK attendences := (.<event[IS default::Attendence]);
  };
};
