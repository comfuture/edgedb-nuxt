import { getEvent } from '@/queries/getEvent.edgeql';

export default defineEventHandler(async (event) => {
  const { params: { event: eventId } } = useActiveRoute();
  const client = await useEdgedb('dev')
  const result = await getEvent(client, { id: eventId as string });
  return result;
});
