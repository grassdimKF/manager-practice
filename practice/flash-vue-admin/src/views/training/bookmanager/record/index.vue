<template>
  <div class="app-container">
    <div class="block">
      <el-row :gutter="20">
        <el-col :span="4">
          <el-input v-model="listQuery.username" size="mini" placeholder="请输入姓名"></el-input>
        </el-col>
        <el-col :span="6">
          <el-button type="success" size="mini" icon="el-icon-search" @click.native="search">{{ $t('button.search') }}</el-button>
        </el-col>
      </el-row>
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
    </el-table>
    <el-pagination background layout="total, sizes, prev, pager, next, jumper" :page-sizes="[10, 20, 50, 100,500]" :page-size="listQuery.limit"
      :total="total" @size-change="changeSize" @current-change="fetchPage" @prev-click="fetchPrev" @next-click="fetchNext">
    </el-pagination>
  </div>
</template>


<script src="./record.js"></script>


<style rel="stylesheet/scss" lang="scss" scoped>
@import 'src/styles/common.scss';
</style>
