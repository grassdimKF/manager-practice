import request from '@/utils/request'

export default{
  borrow:function(params) {
    return request({
        url: '/training/borrow',
        method: 'post',
        params
    })
  },
  getAllRecord:function(params) {
    return request({
        url: '/training/borrow/record',
        method: 'get',
        params
    })
  },
  getPersonal:function(userid) {
    return request({
        url: '/training/borrow/personal',
        method: 'get',
        params: {
          userid: userid
        }
    })
  },
  update:function(params) {
    return request({
        url: '/training/borrow/renew',
        method: 'post',
        params
    })
  },
  remove:function(id) {
    return request({
        url: '/training/borrow/back',
        method: 'delete',
        params: {
          id: id
        }
    })
  }

}

