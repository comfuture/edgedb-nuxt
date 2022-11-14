import type {Client} from "edgedb";

export async function attendEvent(client: Client, args: {
  "event": string;
  "uid": string;
}): Promise<{
  "id": string;
}> {
  return client.queryRequiredSingle(`insert Attendence {
  event := (select Event filter .id = <uuid>$event),
  person := (select Person filter .id = <uuid>$uid),
}
`, args);
}