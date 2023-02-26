package com.org.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.org.mapper.FacilityMapper;
import com.org.model.Facility;
import com.org.service.IFacilityService;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author B.M
 * @since 2022-06-27
 */
@Service
public class FacilityServiceImpl extends ServiceImpl<FacilityMapper, Facility> implements IFacilityService {

}
