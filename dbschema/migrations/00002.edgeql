CREATE MIGRATION m1gbyz4ecqhk7xj6gej5c3aehsc4faoiieb6zpndxw7n6635p5usja
    ONTO m1vxqqhj2e35utjkfqfctplfikfjny6ldrxwsh3uaewwwtbeqlx5ka
{
  ALTER TYPE default::Event {
      CREATE PROPERTY description -> std::str;
  };
};
