<script setup lang="ts">
const { fullPath } = useRoute()
const { data: result } = useAsyncData(fullPath, () => {
  return $fetch(`/api/${fullPath}`)
})
</script>
<template>
  <div>event detail... { result }</div>
</template>
