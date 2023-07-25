package cn.enilu.flash.bean.entity.training;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Record {
    private Long id;
    private String userName;
    private String bookName;
    private String typeName;
    private String borrowTime;
    private String returnTime;
    private Long typeid;
    private Integer status;
}
