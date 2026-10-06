package cn.lmx.kpu.sdkcore.param;


import cn.lmx.kpu.sdkcore.common.FileResult;

/**
 * 文件下载参数
 * @author lmx
 */
public abstract class DownloadRequest<Req> extends BaseParam<Req, FileResult> implements DownloadAware {

    @Override
    public Class<FileResult> getResponseClass() {
        return FileResult.class;
    }
}
