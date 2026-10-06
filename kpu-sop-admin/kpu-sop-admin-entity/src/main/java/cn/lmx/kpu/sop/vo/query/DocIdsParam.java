package cn.lmx.kpu.sop.vo.query;

import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Collection;

/**
 * @author lmx
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class DocIdsParam {

    @NotNull
    private Collection<Long> docIds;


}
