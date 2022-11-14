import type {Client} from "edgedb";

export async function getEvent(client: Client, args: {
  "id": string;
}): Promise<{
  "title": string;
  "date_candidates": Date[];
  "attendences": {
    "person": {
      "name": string;
    };
    "sentiments": [Date, "Yes" | "Maybe" | "No"][] | null;
  }[];
} | null> {
  return client.querySingle(`# 이벤트 속성 및 참여 정보를 가져옵니다
select Event {
  title,
  date_candidates,
  attendences: {
    person: { name },
    sentiments
  }
} filter .id = <uuid>$id;`, args);
}