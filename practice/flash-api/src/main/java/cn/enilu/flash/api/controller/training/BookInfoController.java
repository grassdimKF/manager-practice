package cn.enilu.flash.api.controller.training;

import cn.enilu.flash.api.controller.BaseController;
import cn.enilu.flash.bean.constant.factory.PageFactory;
import cn.enilu.flash.bean.entity.training.Book;
import cn.enilu.flash.bean.enumeration.BizExceptionEnum;
import cn.enilu.flash.bean.exception.ApplicationException;
import cn.enilu.flash.bean.vo.front.Ret;
import cn.enilu.flash.bean.vo.front.Rets;
import cn.enilu.flash.bean.vo.query.SearchFilter;
import cn.enilu.flash.service.training.BookService;
import cn.enilu.flash.utils.StringUtil;
import cn.enilu.flash.utils.factory.Page;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/training/bookinfo")
public class BookInfoController extends BaseController {
    @Autowired
    private BookService bookService;

    /**
     * 获取图书信息以及模糊查询
     * @param id 图书ID
     * @param name 根据书名模糊查询的关键字
     * @param author 根据作者名模糊查询的关键字
     * @return 图书信息
     */
    @GetMapping()
    public Ret getList(@RequestParam(required = false) Long id,
                       @RequestParam(required = false) String name,
                       @RequestParam(required = false) String author
    ) {
        Page<Book> page = new PageFactory<Book>().defaultPage();
        page.addFilter("id", id);
        if (StringUtil.isNotEmpty(name)) {
            page.addFilter(SearchFilter.build("name", SearchFilter.Operator.LIKE, name));
        }
        if (StringUtil.isNotEmpty(author)) {
            page.addFilter(SearchFilter.build("author", SearchFilter.Operator.LIKE, author));
        }
        page = bookService.queryBook(page);
        return Rets.success(page);
    }

    @PostMapping
    public Ret add(@ModelAttribute Book book) {
        bookService.insert(book);
        return Rets.success();
    }

    @PutMapping
    public Ret update(@ModelAttribute Book book) {
        bookService.update(book);
        return Rets.success();
    }

    @DeleteMapping
    public Ret remove(Long bookid) {
        if (bookid == null) {
            throw new ApplicationException(BizExceptionEnum.REQUEST_NULL);
        }
        bookService.delete(bookid);
        return Rets.success();
    }

}
