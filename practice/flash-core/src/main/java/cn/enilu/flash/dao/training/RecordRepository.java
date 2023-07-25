package cn.enilu.flash.dao.training;

import cn.enilu.flash.bean.entity.training.BorrowingRecord;
import cn.enilu.flash.bean.entity.training.Record;
import cn.enilu.flash.dao.BaseRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import javax.transaction.Transactional;
import java.util.List;

@Repository
public interface RecordRepository extends BaseRepository<BorrowingRecord, Long> {

    /**
     * 查询所有借阅记录
     * @return 借阅记录
     */
    @Query("SELECT new cn.enilu.flash.bean.entity.training.Record(r.id,u.name,b.name,t.name,r.borrowTime,r.returnTime,r.typeid,r.status)" +
            "FROM t_borrowing_record r JOIN t_book_info b ON r.bookid = b.id JOIN t_sys_user u ON r.userid = u.id " +
            "JOIN t_book_type t ON r.typeid = t.id")
    List<Record> findAllRecord();

    /**
     * 根据用户ID查询对应的借阅记录
     * @param userid 用户ID
     * @return 用户个人的借阅记录
     */
    @Query("SELECT new cn.enilu.flash.bean.entity.training.Record(r.id,u.name,b.name,t.name,r.borrowTime,r.returnTime,r.typeid,r.status)" +
            "FROM t_borrowing_record r JOIN t_book_info b ON r.bookid = b.id JOIN t_sys_user u ON r.userid = u.id JOIN t_book_type t ON r.typeid = t.id " +
            "WHERE r.userid = :userid")
    List<Record> findPersonalRecord(@Param("userid") Long userid);

    /**
     * 通过模糊的名字查询所有对应的id
     * @return 用户id列表
     */
    @Query(nativeQuery = true, value = "SELECT id FROM t_sys_user u WHERE u.name LIKE CONCAT('%',?1, '%')")
    List<Long> findAllIdByUserName(String username);

    /**
     * 更新归还时间
     * @param id 借阅记录id
     * @param returnTime 预计归还时间
     */
    @Transactional
    @Modifying
    @Query(nativeQuery = true, value = "UPDATE t_borrowing_record SET return_time = ?2 WHERE id = ?1")
    void updateReturnTime(Long id, String returnTime);

    /**
     * 根据借阅记录ID查询图书ID
     * @param id 借阅记录ID
     * @return 图书ID
     */
    @Query(nativeQuery = true, value = "SELECT r.bookid FROM t_borrowing_record r WHERE r.id = ?1")
    Long findBookId(Long id);

    /**
     * 更新借阅状态
     * @param id 借阅记录ID
     * @param status 借阅状态
     */
    @Transactional
    @Modifying
    @Query(nativeQuery = true, value = "UPDATE t_borrowing_record SET status = ?2 WHERE id = ?1")
    void updateStatus(Long id, Integer status);

}

