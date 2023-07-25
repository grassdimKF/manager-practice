<template>
  <div class="app-container">
    <div class="block">
      <el-row :gutter="20">
        <el-col :span="4">
          <el-input v-model="listQuery.name" size="mini" placeholder="请输入书名"></el-input>
        </el-col>
        <el-col :span="4">
          <el-input v-model="listQuery.author" size="mini" placeholder="请输入作者"></el-input>
        </el-col>
        <el-col :span="6">
          <el-button type="success" size="mini" icon="el-icon-search" @click.native="search">{{ $t('button.search') }}</el-button>
        </el-col>
      </el-row>
      <br>
    </div>
    <el-table :data="list" v-loading="listLoading" element-loading-text="Loading" border fit highlight-current-row
      @current-change="handleCurrentChange">
      <el-table-column label="书名">
        <template slot-scope="scope">
          {{scope.row.name}}
        </template>
      </el-table-column>
      <el-table-column label="作者" width="100px">
        <template slot-scope="scope">
          {{scope.row.author}}
        </template>
      </el-table-column>
      <el-table-column label="出版日期" width="140px">
        <template slot-scope="scope">
          {{scope.row.publicationDate}}
        </template>
      </el-table-column>
      <el-table-column label="出版社" width="140px">
        <template slot-scope="scope">
          {{scope.row.publishingHouse}}
        </template>
      </el-table-column>
      <el-table-column label="编号" width="140px">
        <template slot-scope="scope">
          {{scope.row.number}}
        </template>
      </el-table-column>
      <el-table-column label="库存" width="70px">
        <template slot-scope="scope">
          {{scope.row.inventory}}
        </template>
      </el-table-column>
      <el-table-column label="类别" width="100px">
        <template slot-scope="scope">
          {{scope.row.typeName}}
        </template>
      </el-table-column>
      <el-table-column label="语言" width="70px">
        <template slot-scope="scope">
          {{displayLanguage(scope.row.language)}}
        </template>
      </el-table-column>
      <el-table-column label="书本描述">
        <template slot-scope="scope">
          {{scope.row.description}}
        </template>
      </el-table-column>
      <el-table-column label="操作">
        <template slot-scope="scope">
          <el-button type="success" plain size="small" @click="borrowItem(scope.row)" :disabled="haveInventory(scope.row)">借阅</el-button>
        </template>
      </el-table-column>
    </el-table>
    <el-pagination background layout="total, sizes, prev, pager, next, jumper" :page-sizes="[10, 20, 50, 100,500]" :page-size="listQuery.limit"
      :total="total" @size-change="changeSize" @current-change="fetchPage" @prev-click="fetchPrev" @next-click="fetchNext">
    </el-pagination>
    <el-dialog :title="归还日期" :visible.sync="formVisible" @close="handleFormClose">
      <el-form ref="form" :model="form" :rules="formRules" label-width="110px">
        <el-form-item label="请选择归还时间" prop="returnTime">
          <el-date-picker v-model="form.returnTime" type="datetime" placeholder="选择日期时间" align="right" :picker-options="pickerOptions"
            value-format="yyyy-MM-dd HH:mm:ss">
          </el-date-picker>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="save">提交</el-button>
          <el-button @click.native="formVisible = false">取消</el-button>
        </el-form-item>
      </el-form>
    </el-dialog>
  </div>
</template>


<script src="./booklist.js"></script>


<style rel="stylesheet/scss" lang="scss" scoped>
@import 'src/styles/common.scss';
</style>
