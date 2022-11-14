# 이벤트를 생성합니다
with
  host := (insert Person {
    id := <uuid>$uid
    name := <str>$name
  } unless conflict on .id
  else (
    select Person filter .id = <uuid>$uid
  ))
select (
  insert Event {
    title := <str>$title,
    description := <str>$description,
    host := host,
    date_candidates := <tuple<datetime>>$date_candidates,
  }
)