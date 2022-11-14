<script setup lang="ts">
const query = `
select Movie {
  id, title, release_year,
  actors: {
    name, @character_name
  }
}
`

const { data: result } = useAsyncData('query', () => {
  return $fetch('/api/edgeql', {
    method: 'POST',
    body: JSON.stringify({ query }),
    // body: JSON.stringify({ query: 'select <int64>$one + <int64>$two', variables: { one: 1, two: 2 } }),
  })
})
</script>
<template>
  <div>...</div>
</template>