package cn.enilu.flash.service.training;

import cn.enilu.flash.bean.entity.training.Book;
import cn.enilu.flash.dao.training.BookRepository;
import cn.enilu.flash.service.BaseService;
import cn.enilu.flash.utils.factory.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class BookService extends BaseService<Book,Long, BookRepository> {
    @Autowired
    private BookRepository bookRepository;

    /**
     * 通过类别ID设置类别名称
     * @param page 封装图书信息的页面对象
     * @return 图书信息
     */
    public Page<Book> queryBook(Page<Book> page) {
        Page<Book> newPage = queryPage(page);
        for (Book record : newPage.getRecords()) {
            record.setTypeName(bookRepository.findNameById(record.getTypeid()));
        }
        return newPage;
    }

    /**
     * 增加图书库存
     * @param bookid 图书ID
     */
    public void increaseInventory(Long bookid) {
        bookRepository.increaseInventory(bookid);
    }

    /**
     * 减少图书库存
     * @param bookid 图书ID
     */
    public void decreaseInventory(Long bookid) {
        int inventory = bookRepository.getInventory(bookid);
        if (inventory > 0) {
            bookRepository.decreaseInventory(bookid);
        } else {
            //图书库存小于等于零的操作
        }
    }
}
