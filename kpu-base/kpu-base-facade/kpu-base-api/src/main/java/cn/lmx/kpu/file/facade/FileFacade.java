package cn.lmx.kpu.file.facade;


import org.springframework.web.multipart.MultipartFile;
import cn.lmx.kpu.file.enumeration.FileStorageType;
import cn.lmx.kpu.file.vo.result.FileResultVO;

/**
 * 文件接口
 *
 * @author lmx
 * @since 2024年09月20日10:37:25
 */
public interface FileFacade {

    /**
     * 通过feign-form 实现文件 跨服务上传
     *
     * @param file        文件
     * @param bizType     业务类型
     * @param bucket      桶
     * @param storageType 存储类型
     * @return 文件信息
     */
    FileResultVO upload(MultipartFile file, String bizType, String bucket, FileStorageType storageType);

}
