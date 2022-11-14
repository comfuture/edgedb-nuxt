insert Attendence {
  event := (select Event filter .id = <uuid>$event),
  person := (select Person filter .id = <uuid>$uid),
}
