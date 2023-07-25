import request from '@/utils/request'
export default {
    getList:function(params) {
        return request({
            url: '/training/bookclassify',
            method: 'get',
            params
        })
    },
    add:function(params) {
        return request({
            url: '/training/bookclassify',
            method: 'post',
            params
        })
    },
    update:function(params) {
        return request({
            url: '/training/bookclassify',
            method: 'put',
            params
        })
    },
    remove:function(id) {
        return request({
            url: '/training/bookclassify',
            method: 'delete',
            params: {
                id: id
            }
        })
    },
}
