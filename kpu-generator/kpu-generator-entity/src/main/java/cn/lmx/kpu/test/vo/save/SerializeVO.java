package cn.lmx.kpu.test.vo.save;


import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.ToString;
import cn.lmx.basic.annotation.echo.Echo;
import cn.lmx.kpu.model.enumeration.Sex;

import java.io.Serializable;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.Date;

@Data
@ToString
public class SerializeVO implements Serializable {

    /**
     * 支持6种格式
     */
    private LocalDateTime localDateTime;

    private Date date;
    private LocalDate localDate;
    @JsonFormat(shape = JsonFormat.Shape.STRING)
    private LocalTime localTime;

    private Long lon;
    private BigInteger bi;
    private BigDecimal bd;

    @Echo(api = Echo.ENUM_API)
    private Sex sex;

}
