import { createClient } from 'edgedb'
import type { Client, ConnectOptions } from 'edgedb'

const clients = {}

export const useEdgedb = async (instance: string): Promise<Client> => {
  if (!clients[instance] || clients[instance].isClosed()) {
    console.info('connect', instance)
    const client = createClient(instance)
    await client.ensureConnected()
    clients[instance] = client
  }
  return clients[instance]
}
