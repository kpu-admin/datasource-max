package cn.lmx.kpu.file.facade.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import cn.lmx.basic.base.R;
import cn.lmx.kpu.file.api.FileApi;
import cn.lmx.kpu.file.enumeration.FileStorageType;
import cn.lmx.kpu.file.facade.FileFacade;
import cn.lmx.kpu.file.vo.result.FileResultVO;

/**
 * 文件接口
 *
 * @author lmx
 * @since 2024年09月20日10:45:54
 */
@Service
public class FileFacadeImpl implements FileFacade {
    @Autowired
    @Lazy
    private FileApi fileApi;

    @Override
    public FileResultVO upload(MultipartFile file, String bizType, String bucket, FileStorageType storageType) {
        R<FileResultVO> result = fileApi.upload(file, bizType, bucket, storageType);
        return result.getData();
    }
}
