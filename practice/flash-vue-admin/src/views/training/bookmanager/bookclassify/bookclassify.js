import bookApi from '@/api/training/bookclassify'
import permission from '@/directive/permission/index.js'

export default {
  // 如果需要标签页缓存生效，则需要保证name值和菜单管理中的编码值一致
  name: 'bookclassify',
  directives: { permission },
  data() {
    return {
      formVisible: false,
      formTitle: '添加分类信息',
      isAdd: true,
      form: {
        name: '',
        id: '',
        num: ''
      },
      formRules: {
        name: [
          { required: true, message: '类别名称' + this.$t('common.isRequired'), trigger: 'blur' },
          { min: 2, max: 10, message: '类别名称字段长度在2到10个字符', trigger: 'blur' }
        ],
        num: [
          { required: true, message: '排序序号' + this.$t('common.isRequired'), trigger: 'blur' },
          { pattern: /^[1-9]\d*$/, message: '该值应为大于0的数字', trigger: 'blur' }
        ]
      },
      listQuery: {
        page: 1,
        limit: 10,
        sort: 'num',
        order: 'asc',
        name:undefined,
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
    resetForm() {
      this.form = {
        name: '',
        num:'',
        id: ''
      }
    },
    add() {
      this.formTitle = '添加分类信息'
      this.formVisible = true
      this.isAdd = true
      this.resetForm()
    },
    save() {
      this.$refs['form'].validate((valid) => {
        if (valid) {
          const formData = {
            id: this.form.id,
            name: this.form.name,
            num: this.form.num
          }
          if (formData.id) {
            bookApi.update(formData).then(response => {
              this.$message({
                message: this.$t('common.optionSuccess'),
                type: 'success'
              })
              this.fetchData()
              this.formVisible = false
            })
          } else {
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
    editItem(record) {
      this.selRow = record
      this.edit()
    },
    edit() {
      if (this.checkSel()) {
        this.isAdd = false
        const form = Object.assign({}, this.selRow)
        this.form = form
        this.formTitle = '编辑分类信息'
        this.formVisible = true
      }
    },
    removeItem(record) {
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
          }).catch(err => {
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
