package cn.enilu.flash.bean.entity.training;

import cn.enilu.flash.bean.entity.BaseEntity;
import cn.enilu.flash.bean.entity.system.User;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.Table;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;
import javax.persistence.*;


@Entity(name = "t_borrowing_record")
@Table(appliesTo = "t_borrowing_record", comment = "借阅记录")
@EntityListeners(AuditingEntityListener.class)
@Data
@AllArgsConstructor
@NoArgsConstructor
public class BorrowingRecord extends BaseEntity {
    @Column(columnDefinition = "BIGINT COMMENT '用户ID'")
    private Long userid;
    @Column(columnDefinition = "BIGINT COMMENT '图书ID'")
    private Long bookid;
    @Column(columnDefinition = "VARCHAR(32) COMMENT '借阅日期'")
    private String borrowTime;
    @Column(columnDefinition = "VARCHAR(32) COMMENT '归还日期'")
    private String returnTime;
    @Column(columnDefinition = "BIGINT COMMENT '类别ID'")
    private Long typeid;
    @Column(columnDefinition = "INT COMMENT ‘借阅状态’")
    private Integer status;
    @Transient
    @JoinColumn(name = "id", insertable = false, updatable = false)
    private Book book;
    @Transient
    @JoinColumn(name = "id", insertable = false, updatable = false)
    private User user;
}
