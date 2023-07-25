import bookApi from '@/api/training/bookinfo'
import permission from '@/directive/permission/index.js'
import { DatePicker } from 'element-ui'

export default {
  //如果需要标签页缓存生效，则需要保证name值和菜单管理中的编码值一致
  name: 'bookinfo',
  directives: { permission },
  components: {
    'el-date-picker': DatePicker
  },
  data() {
    return {
      formVisible: false,
      formTitle: '添加图书信息',
      isAdd: true,
      options:[{value: 1, label: '中文'}, {value: 2, label: '英文'}, {value: 3, label: '其他'}],
      form: {
        name:'',
        author:'',
        publicationDate:null,
        publishingHouse:'',
        number:'',
        inventory:'',
        language:'',
        typeid:'',
        description:'',
        id: ''
      },
      formRules: {
        name: [
          { required: true, message: '书名' + this.$t('common.isRequired'), trigger: 'blur' },
          { min: 1, max: 10, message: '书名字段长度在1到10个字符', trigger: 'blur' }
        ],
        author: [
          { required: true, message: '作者' + this.$t('common.isRequired'), trigger: 'blur' },
          { min: 1, max: 10, message: '作者字段长度在1到10个字符', trigger: 'blur' }
        ],
        typeid: [
          {required: true, message: '类别ID' + this.$t('common.isRequired'), trigger: 'blur' },
          { pattern: /^[1-9]\d*$/, message: '该值应为大于0的数字', trigger: 'blur'}
        ]
      },
      listQuery: {
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
    setValue() {
      this.$forceUpdate()
    },
    //日期加四个随机数自动生成图书编号
    getBookNumber () {
      const date = new Date()
      const year = date.getFullYear() 
      const month = date.getMonth() + 1 
      const day = date.getDate() 
      var currentDate = year
      if (month >= 10) { 
        currentDate += month
      } else {
        currentDate += '0' + month
      }
      if (day >= 10) {
        currentDate += day
      } else {
        currentDate += '0' + day
      }
      return currentDate + Math.floor(Math.random() * 10000)
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
    resetForm() {
      //清空表单
      this.form = {
        name:'',
        author:'',
        publicationDate:'',
        publishingHouse:'',
        inventory:'',
        language:'',
        typeid:'',
        description:'',
        id:'',
        number:''
      }
    },
    add() {
      this.formTitle = '添加图书信息'
      this.formVisible = true
      this.isAdd = true
      this.resetForm()
    },
    save() {
      this.$refs['form'].validate((valid) => {
        if (valid) {
            const formData = {
                id:this.form.id,
                name:this.form.name,
                author:this.form.author,
                publicationDate:this.form.publicationDate,
                publishingHouse:this.form.publishingHouse,
                number:this.form.number,
                inventory:this.form.inventory,
                language:this.form.language,
                typeid:this.form.typeid,
                description:this.form.description,
            }
            if (this.isAdd){
              formData.number = this.getBookNumber()
            }
            if(formData.id){
                bookApi.update(formData).then(response => {
                    this.$message({
                        message: this.$t('common.optionSuccess'),
                        type: 'success'
                    })
                    this.fetchData()
                    this.formVisible = false
                })
            }else{
                bookApi.add(formData).then(response => {
                    this.$message({
                        message: this.$t('common.optionSuccess'),
                        type: 'success'
                    })
                    this.fetchData()
                    this.formVisible = false
                })
            }
        } else {
          return false
        }
      })
    },
    checkSel() {
      if (this.selRow && this.selRow.id) {
        return true
      }
      this.$message({
        message: this.$t('common.mustSelectOne'),
        type: 'warning'
      })
      return false
    },
    editItem(record){
      this.selRow = record
      this.edit()
    },
    edit() {
      if (this.checkSel()) {
        this.isAdd = false
        let form = Object.assign({}, this.selRow)
        this.form = form
        this.formTitle = '编辑图书信息'
        this.formVisible = true
      }
    },
    removeItem(record){
      this.selRow = record
      this.remove()
    },
    remove() {
      if (this.checkSel()) {
        var id = this.selRow.id
        this.$confirm(this.$t('common.deleteConfirm'), this.$t('common.tooltip'), {
          confirmButtonText: this.$t('button.submit'),
          cancelButtonText: this.$t('button.cancel'),
          type: 'warning'
        }).then(() => {
            bookApi.remove(id).then(response => {
            this.$message({
              message: this.$t('common.optionSuccess'),
              type: 'success'
            })
            this.fetchData()
          }).catch( err=> {
            this.$notify.error({
              title: '错误',
              message: err
            })
          })
        }).catch(() => {
        })
      }
    }

  }
}
