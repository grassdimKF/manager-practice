package cn.enilu.flash.api.controller.training;

import cn.enilu.flash.api.controller.BaseController;
import cn.enilu.flash.bean.constant.factory.PageFactory;
import cn.enilu.flash.bean.entity.training.Book;
import cn.enilu.flash.bean.entity.training.BookType;
import cn.enilu.flash.bean.enumeration.BizExceptionEnum;
import cn.enilu.flash.bean.exception.ApplicationException;
import cn.enilu.flash.bean.vo.front.Ret;
import cn.enilu.flash.bean.vo.front.Rets;
import cn.enilu.flash.bean.vo.query.SearchFilter;
import cn.enilu.flash.service.training.BookClassifyService;
import cn.enilu.flash.utils.StringUtil;
import cn.enilu.flash.utils.factory.Page;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


@RestController
@RequestMapping("/training/bookclassify")
public class BookClassifyController extends BaseController {
    private Logger logger = LoggerFactory.getLogger(getClass());

    @Autowired
    private BookClassifyService bookClassifyService;

    /**
     * 图书分类的查询和排序
     * 排序根据num的数值进行排序
     * @param name 模糊查询的关键字
     * @return 排序后的图书类别
     */
    @GetMapping()
    public Ret getList(@RequestParam(required = false) String name) {
        Page<BookType> page = new PageFactory<BookType>().defaultPage();
        if (StringUtil.isNotEmpty(name)) {
            page.addFilter(SearchFilter.build("name", SearchFilter.Operator.LIKE, name));
            page = bookClassifyService.queryPage(page);
        } else {
            page = bookClassifyService.queryPage(page);
        }
        return Rets.success(page);
    }

    @PostMapping
    public Ret add(@ModelAttribute BookType bookType) {
        bookClassifyService.insert(bookType);
        return Rets.success();
    }

    @PutMapping
    public Ret update(@ModelAttribute BookType bookType) {
        bookClassifyService.update(bookType);
        return Rets.success();
    }

    @DeleteMapping
    public Ret remove(Long id) {
        if (id == null) {
            throw new ApplicationException(BizExceptionEnum.REQUEST_NULL);
        }
        bookClassifyService.delete(id);
        return Rets.success();
    }
}
