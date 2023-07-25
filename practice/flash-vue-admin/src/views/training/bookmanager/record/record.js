import recordApi from '@/api/training/record';
import permission from '@/directive/permission/index.js'
import store from '@/store/index.js'
import { DatePicker } from 'element-ui';

export default {
  //如果需要标签页缓存生效，则需要保证name值和菜单管理中的编码值一致
  name: 'record',
  directives: { permission },
  data() {
    return {
      options:[{value: 1, label: '中文'}, {value: 2, label: '英文'}, {value: 3, label: '其他'}],
      listQuery: {
        userid: store.state.user.profile.id,
        id: '',
        bookid: '',
        page: 1,
        limit: 10,
        username: undefined
      },
      total: 0,
      list: null,
      listLoading: true,
      selRow: {}
    }
  },
  filters: {
    statusFilter(status) {
      const statusMap = {
        published: 'success',
        draft: 'gray',
        deleted: 'danger'
      }
      return statusMap[status]
    }
  },
  created() {
    this.init()
  },
  methods: {
    init() {
      this.fetchData()
    },
    fetchData() {
      this.listLoading = true
      recordApi.getAllRecord(this.listQuery).then(response => {
        this.list = response.data.records
        this.listLoading = false
      })
    },
    search() {
      this.listQuery.page = 1
      this.fetchData()
    },
    fetchNext() {
      this.listQuery.page = this.listQuery.page + 1
      this.fetchData()
    },
    fetchPrev() {
      this.listQuery.page = this.listQuery.page - 1
      this.fetchData()
    },
    fetchPage(page) {
      this.listQuery.page = page
      this.fetchData()
    },
    changeSize(limit) {
      this.listQuery.limit = limit
      this.fetchData()
    },
    handleCurrentChange(currentRow) {
      this.selRow = currentRow
    },
    //页面展示语言种类 1:中文，2:英文，3:其他
    displayLanguage (val) {
      if (val == 1){
        return "中文"
      }
      else if (val == 2){
        return "英文"
      }
      else{
        return "其他"
      }
    }
  }


}
