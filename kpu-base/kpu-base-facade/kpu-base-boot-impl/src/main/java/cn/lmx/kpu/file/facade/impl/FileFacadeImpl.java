package cn.lmx.kpu.file.facade.impl;


import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import cn.lmx.kpu.file.enumeration.FileStorageType;
import cn.lmx.kpu.file.facade.FileFacade;
import cn.lmx.kpu.file.service.FileService;
import cn.lmx.kpu.file.vo.param.FileUploadVO;
import cn.lmx.kpu.file.vo.result.FileResultVO;

/**
 * 文件接口
 *
 * @author lmx
 * @since 2024年09月20日10:45:54
 */
@Service
@RequiredArgsConstructor
public class FileFacadeImpl implements FileFacade {
    private final FileService fileService;


    @Override
    public FileResultVO upload(MultipartFile file, String bizType, String bucket, FileStorageType storageType) {
        FileUploadVO fileUploadVO = new FileUploadVO();
        fileUploadVO.setBizType(bizType);
        fileUploadVO.setBucket(bucket);
        fileUploadVO.setStorageType(storageType);
        return fileService.upload(file, fileUploadVO);
    }
}
