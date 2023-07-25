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
      <el-row>
        <el-col :span="24">
          <el-button type="success" size="mini" icon="el-icon-plus" @click.native="add">{{ $t('button.add') }}</el-button>
        </el-col>
      </el-row>
    </div>

    <el-table :data="list" v-loading="listLoading" element-loading-text="Loading" border fit highlight-current-row
      @current-change="handleCurrentChange">
      <el-table-column label="书名">
        <template slot-scope="scope">
          {{scope.row.name}}
        </template>
      </el-table-column>
      <el-table-column label="作者">
        <template slot-scope="scope">
          {{scope.row.author}}
        </template>
      </el-table-column>
      <el-table-column label="出版日期">
        <template slot-scope="scope">
          {{scope.row.publicationDate}}
        </template>
      </el-table-column>
      <el-table-column label="出版社">
        <template slot-scope="scope">
          {{scope.row.publishingHouse}}
        </template>
      </el-table-column>
      <el-table-column label="编号">
        <template slot-scope="scope">
          {{scope.row.number}}
        </template>
      </el-table-column>
      <el-table-column label="库存">
        <template slot-scope="scope">
          {{scope.row.inventory}}
        </template>
      </el-table-column>
      <el-table-column label="类别">
        <template slot-scope="scope">
          {{scope.row.typeName}}
        </template>
      </el-table-column>
      <el-table-column label="语言">
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
          <el-button type="text" size="mini" icon="el-icon-edit" @click.native="editItem(scope.row)">{{ $t('button.edit') }}</el-button>
          <el-button type="text" size="mini" icon="el-icon-delete" @click.native="removeItem(scope.row)">{{ $t('button.delete') }}</el-button>
        </template>
      </el-table-column>
    </el-table>

    <el-pagination background layout="total, sizes, prev, pager, next, jumper" :page-sizes="[10, 20, 50, 100,500]" :page-size="listQuery.limit"
      :total="total" @size-change="changeSize" @current-change="fetchPage" @prev-click="fetchPrev" @next-click="fetchNext">
    </el-pagination>

    <el-dialog :title="formTitle" :visible.sync="formVisible" width="70%">
      <el-form ref="form" :model="form" :rules="formRules" label-width="120px">
        <el-row>
          <el-col :span="12">
            <el-form-item label="书名" prop="name">
              <el-input v-model="form.name" minlength=1></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="作者" prop="author">
              <el-input v-model="form.author" minlength=1></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="出版日期">
              <el-date-picker v-model="form.publicationDate" minlength=1 value-format="yyyy-MM-dd"></el-date-picker>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="出版社">
              <el-input v-model="form.publishingHouse" minlength=1></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="库存">
              <el-input v-model="form.inventory" minlength=1></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="类别" prop="typeid">
              <el-input v-model="form.typeid" minlength=1></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="语言">
              <el-select v-model="form.language" placeholder="请选择" @change="setValue($event)">
                <el-option v-for="item in options" :key="item.value" :label="item.label" :value="item.value"></el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="书本描述">
              <el-input type="textarea" :rows="2" placeholder="请输入内容" v-model="form.description"></el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-form-item>
          <el-button type="primary" @click="save">{{ $t('button.submit') }}</el-button>
          <el-button @click.native="formVisible = false">{{ $t('button.cancel') }}</el-button>
        </el-form-item>
      </el-form>
    </el-dialog>
  </div>
</template>


<script src="./bookinfo.js"></script>


<style rel="stylesheet/scss" lang="scss" scoped>
@import 'src/styles/common.scss';
</style>
