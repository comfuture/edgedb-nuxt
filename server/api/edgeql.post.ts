import { useEdgedb } from '@/composables/use-edgedb'

export default defineEventHandler(async (event) => {
  const client = await useEdgedb('dev')
  const { query, variables = {} } = await useBody(event)
  await client.ensureConnected()
  const result = await client.query(query, variables)
  return result
})
