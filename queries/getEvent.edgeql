# 이벤트 속성 및 참여 정보를 가져옵니다
select Event {
  title,
  date_candidates,
  attendences: {
    person: { name },
    sentiments
  }
} filter .id = <uuid>$id;