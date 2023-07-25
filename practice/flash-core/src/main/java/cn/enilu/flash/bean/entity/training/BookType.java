package cn.enilu.flash.bean.entity.training;

import cn.enilu.flash.bean.entity.BaseEntity;
import lombok.Data;
import org.hibernate.annotations.Table;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;

@Entity(name = "t_book_type")
@Table(appliesTo = "t_book_type", comment = "图书类别")
@Data
@EntityListeners(AuditingEntityListener.class)
public class BookType extends BaseEntity {

    @Column(columnDefinition = "VARCHAR(32) COMMENT ‘类别名称’")
    private String name;
    @Column(columnDefinition = "INT COMMENT '排序'")
    private Integer num;
}
