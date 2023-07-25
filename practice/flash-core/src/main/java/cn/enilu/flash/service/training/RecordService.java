package cn.enilu.flash.service.training;

import cn.enilu.flash.bean.entity.training.BorrowingRecord;
import cn.enilu.flash.bean.entity.training.Record;
import cn.enilu.flash.dao.training.RecordRepository;
import cn.enilu.flash.service.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class RecordService extends BaseService<BorrowingRecord, Long, RecordRepository> {
     @Autowired
     private RecordRepository recordRepository;
     @Autowired
     private BookService bookService;

     /**
      * 存储借阅记录
      * @param borrowingRecord 借阅信息对象
      */
     public void addPersonalRecord(BorrowingRecord borrowingRecord) {
          bookService.decreaseInventory(borrowingRecord.getBookid());
          insert(borrowingRecord);
     }

     /**
      * 查询个人记录
      * @param userid 用户ID
      * @return 个人借阅记录
      */
     public List<Record> findPersonalRecord(Long userid) {
          return recordRepository.findPersonalRecord(userid);
     }

     /**
      * 计数一个人借相同书的数量不能超过3本,以及个人借书量不能超过5本
      *
      * @param userid 用户ID
      * @param bookid 图书ID
      * @return -1:总借书量已满5，0:借出同本书已满3，1:可以继续借书
      */
     public Integer bookCount(Long userid, Long bookid) {
          List<Record> personalRecord = findPersonalRecord(userid);
          int total = personalRecord.size();
          if (total >= 5) {
               return -1;
          }
          int count = 0;
          for (int i = 0; i < total; i++) {
               Long id = personalRecord.get(i).getId();
               Long bookId = recordRepository.findBookId(id);
               if (bookId == bookid) {
                    count++;
               }
               if (count >= 3) {
                    return 0;
               }
          }
          return 1;
     }

     /**
      * 判断是否有超时未还的书
      * @param userid 用户ID
      * @return 布尔值
      */
     public boolean borrowPermission(Long userid) {
          List<Record> personalRecord = findPersonalRecord(userid);
          for (int i = 0; i < personalRecord.size(); i++) {
               Integer status = personalRecord.get(i).getStatus();
               if (status == 0) {
                    return false;
               }
          }
          return true;
     }

     /**
      * 模糊查询借阅记录
      * @param username 用户名称
      * @return 模糊搜索后的借阅记录
      */
     public List<Record> fuzzyFindRecords(String username) {
          List<Record> resultList = new ArrayList<Record>();
          List<Long> idList = recordRepository.findAllIdByUserName(username);
          for (int i = 0; i < idList.size(); i++) {
               resultList.addAll(recordRepository.findPersonalRecord(idList.get(i)));
          }
          return resultList;
     }

     /**
      * 更新归还时间
      * @param id 借阅记录id
      * @param returnTime 归还时间
      */
     public void updateReturnTime(Long id, String returnTime) {
          recordRepository.updateReturnTime(id, returnTime);
     }

     /**
      * 获取所有借阅记录
      * @return 借阅记录
      */
     public List<Record> findAllRecord() {
          return recordRepository.findAllRecord();
     }

     /**
      * 删除借阅记录
      * @param id 借阅记录ID
      */
     public void deleteRecord(Long id) {
          Long bookid = recordRepository.findBookId(id);
          bookService.increaseInventory(bookid);
          delete(id);
     }

     /**
      * 归还时间与当前时间的时间差
      * @param returnTime 归还时间
      * @return 时间差
      * @throws ParseException
      */
     public Long calculateTime(String returnTime) throws ParseException {
          SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
          Long endTime = format.parse(returnTime).getTime();
          Long currentTime = new Date().getTime();
          Long timeDifferent = endTime - currentTime;
          return timeDifferent;
     }

     /**
      * 更新借阅状态
      * @param recordList 借阅记录
      */
     public void updateStatus(List<Record> recordList) throws Exception {
          for (int i = 0; i < recordList.size(); i++) {
               Record record = recordList.get(i);
               String returnTime = record.getReturnTime();
               Long timeDifferent = calculateTime(returnTime);
               if (timeDifferent < 0) {
                    recordRepository.updateStatus(record.getId(), 0);
               }
          }
     }


}
