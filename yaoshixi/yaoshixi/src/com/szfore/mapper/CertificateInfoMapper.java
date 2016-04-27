package com.szfore.mapper;

import org.apache.ibatis.annotations.Param;

import com.szfore.action.company.vo.CertificateInfo;

public interface CertificateInfoMapper {

	CertificateInfo loadCertificateInfo(@Param("userId")Integer userId, 
										@Param("jobId")Integer jobId, 
										@Param("companyId")Integer companyId);

}
