<template>
    <div>
         <vuetable ref="vuetable"
            api-url="https://vuetable.ratiw.net/api/users"
            :fields="['name', 'nickname', 'email', 'gender']"
            data-path="localData"
            pagination-path=""
        ></vuetable>
    </div>
 
</template>

<script>
import Vuetable from 'vuetable-2'

export default {
  components: {
    Vuetable
  }
}
</script>