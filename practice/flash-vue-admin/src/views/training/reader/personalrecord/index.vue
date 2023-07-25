<template>
  <div class="app-container">
    <div class="block">

      <br>
    </div>
    <el-table :data="list" v-loading="listLoading" element-loading-text="Loading" border fit highlight-current-row
      @current-change="handleCurrentChange">
      <el-table-column label="借阅人">
        <template slot-scope="scope">
          {{scope.row.userName}}
        </template>
      </el-table-column>
      <el-table-column label="书名">
        <template slot-scope="scope">
          {{scope.row.bookName}}
        </template>
      </el-table-column>
      <el-table-column label="类别">
        <template slot-scope="scope">
          {{scope.row.typeName}}
        </template>
      </el-table-column>
      <el-table-column label="借书时间">
        <template slot-scope="scope">
          {{scope.row.borrowTime}}
        </template>
      </el-table-column>
      <el-table-column label="预计归还">
        <template slot-scope="scope">
          {{scope.row.returnTime}}
        </template>
      </el-table-column>
      <el-table-column label="借书状态">
        <template slot-scope="scope">
          <el-tag type="success" v-if="scope.row.status == 1" effect="dark">正常</el-tag>
          <el-tag type="danger" v-if="scope.row.status == 0" effect="dark">超时</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="操作">
        <template slot-scope="scope">
          <el-button type="success" plain size="small" @click="borrowItem(scope.row)" :disabled="scope.row.status==0">续期</el-button>
          <el-button type="success" plain size="small" @click="returnItem(scope.row)">归还</el-button>
        </template>
      </el-table-column>
    </el-table>
    <el-pagination background layout="total, sizes, prev, pager, next, jumper" :page-sizes="[10, 20, 50, 100,500]" :page-size="listQuery.limit"
      :total="total" @size-change="changeSize" @current-change="fetchPage" @prev-click="fetchPrev" @next-click="fetchNext">
    </el-pagination>

    <el-dialog :title="归还日期" :visible.sync="formVisible">
      <el-form ref="form" :model="form" :rules="formRules" label-width="110px">
        <el-form-item label="续期时间" prop="renewal">
          <el-date-picker v-model="form.renewal" type="datetime" placeholder="选择续期时间" align="right" :picker-options="pickerOptions" 
          value-format="yyyy-MM-dd HH:mm:ss">
          </el-date-picker>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="save">提交</el-button>
          <el-button @click.native="formVisible = false">取消</el-button>
        </el-form-item>
      </el-form>
    </el-dialog>
    <el-dialog :visible.sync="dialogVisible" title="确认归还此书" @close="handleClose">
      <span>您确定要归还此书吗？</span>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogVisible = false">取消</el-button>
        <el-button type="primary" @click="returnBook">确定</el-button>
      </div>
    </el-dialog>
  </div>
</template>


<script src="./personalrecord.js"></script>


<style rel="stylesheet/scss" lang="scss" scoped>
@import 'src/styles/common.scss';
</style>
