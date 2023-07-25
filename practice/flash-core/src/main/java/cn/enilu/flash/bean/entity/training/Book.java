package cn.enilu.flash.bean.entity.training;

import cn.enilu.flash.bean.entity.BaseEntity;
import lombok.Data;
import org.hibernate.annotations.Table;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.Transient;


@Entity(name = "t_book_info")
@Table(appliesTo = "t_book_info", comment = "图书信息")
@Data
@EntityListeners(AuditingEntityListener.class)
public class Book extends BaseEntity {
    @Column(columnDefinition = "VARCHAR(32) COMMENT '作者'")
    private String author;
    @Column(columnDefinition = "TEXT COMMENT ‘描述’")
    private String description;
    @Column(columnDefinition = "INT COMMENT '总数'")
    private Integer inventory;
    @Column(columnDefinition = "INT COMMENT '语言1:中文，2:英文，3:其他'")
    private Integer language;
    @Column(columnDefinition = "VARCHAR(32) COMMENT '书名'")
    private String name;
    @Column(columnDefinition = "VARCHAR(64) COMMENT ‘编号’")
    private String number;
    @Column(columnDefinition = "VARCHAR(32) COMMENT '出版日期'")
    private String publicationDate;
    @Column(columnDefinition = "VARCHAR(64) COMMENT ‘出版社’")
    private String publishingHouse;
    @Column(columnDefinition = "BIGINT COMMENT '类别ID'")
    private Long typeid;

    @Transient
    private String typeName;
}
