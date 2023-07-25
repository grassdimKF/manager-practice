package cn.enilu.flash.dao.training;

import cn.enilu.flash.bean.entity.training.Book;
import cn.enilu.flash.dao.BaseRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import javax.transaction.Transactional;

public interface BookRepository extends BaseRepository<Book, Long> {
    /**
     * 根据图书类别获取对应的类别名称
     * @param typeid 图书类别ID
     * @return 类别名称
     */
    @Query(nativeQuery = true, value = "SELECT name FROM t_book_type WHERE id = ?1")
    String findNameById(Long typeid);

    /**
     * 查询库存
     * @param bookid 图书ID
     * @return 库存
     */
    @Query(nativeQuery = true, value = "SELECT b.inventory FROM t_book_info b WHERE b.id = ?1")
    int getInventory(Long bookid);

    /**
     * 增加库存
     * @param bookid 图书ID
     */
    @Transactional
    @Modifying
    @Query(nativeQuery = true, value = "UPDATE t_book_info b SET b.inventory = b.inventory + 1 WHERE b.id = ?1")
    void increaseInventory(Long bookid);

    /**
     * 减少库存
     * @param bookid 图书ID
     */
    @Transactional
    @Modifying
    @Query(nativeQuery = true, value = "UPDATE t_book_info b SET b.inventory = b.inventory - 1 WHERE b.id = ?1")
    void decreaseInventory(Long bookid);

}
