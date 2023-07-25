import request from '@/utils/request'
export default {
    getList:function(params) {
        return request({
            url: '/training/bookinfo',
            method: 'get',
            params
        })
    },
    add:function(params) {
        return request({
            url: '/training/bookinfo',
            method: 'post',
            params
        })
    },
    update:function(params) {
        return request({
            url: '/training/bookinfo',
            method: 'put',
            params
        })
    },
    remove:function(id) {
        return request({
            url: '/training/bookinfo',
            method: 'delete',
            params: {
                id: id
            }
        })
    }
}
