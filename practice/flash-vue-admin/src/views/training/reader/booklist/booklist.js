import recordApi from '@/api/training/record'
import bookApi from '@/api/training/bookinfo'
import permission from '@/directive/permission/index.js'
import store from '@/store/index.js'
import { DatePicker } from 'element-ui';

export default {
  //如果需要标签页缓存生效，则需要保证name值和菜单管理中的编码值一致
  name: 'booklist',
  directives: { permission },
  components: { DatePicker },
  data() {
    return {
      formVisible: false,
      isBorrowed: {},
      form: {
        returnTime: '',
      },
      pickerOptions: {
        shortcuts: [{
          text: '一周',
          onClick(picker) {
            const date = new Date();
            date.setTime(date.getTime() + 3600 * 1000 * 24 * 7);
            picker.$emit('pick', date);
          }
        }, {
          text: '半个月',
          onClick(picker) {
            const date = new Date();
            date.setTime(date.getTime() + 3600 * 1000 * 24 * 15);
            picker.$emit('pick', date);
          }
        }, {
          text: '一个月',
          onClick(picker) {
            const date = new Date();
            date.setTime(date.getTime() + 3600 * 1000 * 24 * 30);
            picker.$emit('pick', date);
          }
        }],
        //日期早于今天禁用
        disabledDate(time) {
          const currentTime = new Date();
          const selectedTime = new Date(time);
          return selectedTime < currentTime;
        }
      },
      formRules: {
        returnTime: [
          { required: true, message: '归还时间' + this.$t('common.isRequired'), trigger: 'blur' }
        ]
      },
      options:[{value: 1, label: '中文'}, {value: 2, label: '英文'}, {value: 3, label: '其他'}],
      listQuery: {
        id:'',
        bookid:'',
        returnTime:'',
        typeid:'',
        userid: store.state.user.profile.id,
        page: 1,
        limit: 10,
        name: undefined,
        author: undefined
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
      bookApi.getList(this.listQuery).then(response => {
        this.list = response.data.records
        this.listLoading = false
        this.total = response.data.total
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
    },
    handleFormClose() {
      formVisible = false
    },
    handleClose() {
      dialogVisible = false
    },
    borrowItem(item) {
      this.selRow = item
      this.formVisible = true
    },
    haveInventory(item) {
      if (item.inventory > 0) {
        return false
      }
      return true
    },
    save() {
      this.$refs['form'].validate((valid) => {
        if (valid) {
          this.listQuery.returnTime = this.form.returnTime
          this.listQuery.bookid = this.selRow.id
          this.listQuery.typeid = this.selRow.typeid
          recordApi.borrow(this.listQuery).then(response => {
            this.$message({
                message: this.$t('common.optionSuccess'),
                type: 'success'
            })
          this.fetchData()
          this.formVisible = false
        })}
        else {
          return false
        }
    })
  }
}

}
