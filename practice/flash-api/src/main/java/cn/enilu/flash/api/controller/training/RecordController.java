package cn.enilu.flash.api.controller.training;

import cn.enilu.flash.bean.constant.factory.PageFactory;
import cn.enilu.flash.bean.entity.training.BorrowingRecord;
import cn.enilu.flash.bean.entity.training.Record;
import cn.enilu.flash.bean.enumeration.BizExceptionEnum;
import cn.enilu.flash.bean.exception.ApplicationException;
import cn.enilu.flash.bean.vo.front.Ret;
import cn.enilu.flash.bean.vo.front.Rets;
import cn.enilu.flash.bean.vo.query.SearchFilter;
import cn.enilu.flash.service.training.BookService;
import cn.enilu.flash.service.training.RecordService;
import cn.enilu.flash.utils.StringUtil;
import cn.enilu.flash.utils.factory.Page;
import cn.enilu.flash.web.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

@RestController
@RequestMapping("/training/borrow")
public class RecordController extends BaseController {
    @Autowired
    private RecordService recordService;
    @Autowired
    private BookService bookService;

    /**
     * 存储借阅记录，一个人同本书最多借三本
     * @param bookid 图书ID
     * @param userid 用户ID
     * @param returnTime 预计归还时间
     * @param typeid 图书类别ID
     * @return
     */
    @PostMapping()
    public Ret addPersonalRecord(@RequestParam("bookid") Long bookid,
                                 @RequestParam("userid") Long userid,
                                 @RequestParam("returnTime") String returnTime,
                                 @RequestParam("typeid") Long typeid
    ) {
        boolean flag1 = recordService.borrowPermission(userid);
        if (!flag1) {
            return Rets.failure("您有超时未归还的书，请先归还再进行借书操作");
        }
        Integer flag2 = recordService.bookCount(userid, bookid);
        if (flag2 == -1) {
            return Rets.failure("抱歉，您的在借阅总数已达到5本，请先归还再进行借书操作");
        }
        if (flag2 == 0) {
            return Rets.failure("抱歉，此书您已借出三本，可以考虑借阅其他书");
        }
        LocalDateTime now = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String borrowTime = now.format(formatter);
        BorrowingRecord borrowingRecord = new BorrowingRecord(userid, bookid, borrowTime, returnTime, typeid, 1, null,null);
        recordService.addPersonalRecord(borrowingRecord);
        return Rets.success();
    }

    /**
     * 续期，更新归还时间
     * @param id 借阅记录ID
     * @param renewal 新的归还日期
     * @return
     */
    @PostMapping("/renew")
    public Ret updateReturnTime(@RequestParam("id") Long id, @RequestParam("renewal") String renewal) {
        recordService.updateReturnTime(id, renewal);
        return Rets.success();
    }

    /**
     * 获取所有借阅记录
     * @param username 模糊查询的关键字
     * @return 借阅记录
     */
    @GetMapping("/record")
    public Ret getAllRecord(@RequestParam(required = false) String username) throws Exception {
        Page<Record> page = new PageFactory<Record>().defaultPage();
        List<Record> recordList = recordService.findAllRecord();
        recordService.updateStatus(recordList);
        if (StringUtil.isNotEmpty(username)) {
            page.addFilter(SearchFilter.build("name", SearchFilter.Operator.LIKE, username));
            page.setRecords(recordService.fuzzyFindRecords(username));
        } else {
            page.setRecords(recordList);
        }
        return Rets.success(page);
    }

    /**
     * 获取个人借阅记录
     * @param userid 用户ID
     * @return 个人借阅记录
     */
    @GetMapping("/personal")
    public Ret getPersonalRecord(Long userid) throws Exception {
        Page<Record> page = new PageFactory<Record>().defaultPage();
        List<Record> personalRecord = recordService.findPersonalRecord(userid);
        recordService.updateStatus(personalRecord);
        page.setRecords(personalRecord);
        return Rets.success(page);
    }

    /**
     * 删除借阅记录
     * @param id 借阅记录ID
     * @return
     */
    @DeleteMapping("/back")
    public Ret remove(Long id) {
        if (id == null) {
            throw new ApplicationException(BizExceptionEnum.REQUEST_NULL);
        }
        recordService.deleteRecord(id);
        return Rets.success();
    }
}
