package com.online.edu.ucenterservice.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.online.edu.common.VO.MemberVO;
import com.online.edu.common.dto.MemberQuery;
import com.online.edu.ucenterservice.pojo.EduMember;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 会员表 服务类
 * </p>
 *
 * @author 许JIAN林
 * @since 2019-12-30
 */
public interface EduMemberService extends IService<EduMember> {

    /**
     * 1.查询用户是否存在
     * @param openid
     * @return
     */
    EduMember getByOpenid(String openid);

    /**
     * 2.根据账号密码查询是否存在该用户
     * @param mobile
     * @param password
     * @return
     */
    EduMember isExitMember(String mobile, String password,int type);


    /**
     * 3.根据手机号码查询该号码是否已注册
     * @param mobile
     * @return true： 注册过   false：未注册
     */
    boolean isRegisterByMobile(String mobile,int type);


    /**
     * 用户注册
     * @param eduMember
     * @return
     */
    boolean saveEdumember(EduMember eduMember);

    /**
     * 更新用户信息
     * @param memberVO
     * @return
     */
    boolean updateInfo(MemberVO memberVO);

    /**
     * 更新用户密码
     * @param id
     * @param curpass
     * @param newpass
     * @return
     */
    int updatePass(String id, String curpass, String newpass);

    /** 根据条件进行查询，并分页显示 */
    IPage<EduMember> pageQuery(String memberId,Page<EduMember> pageParam, Long type, MemberQuery memberQuery);


    /** 重置用户密码 */
    boolean resetMemberPass(String id);

    /**
     * 添加新的用户
     */
    boolean addMember(EduMember eduMember);
}
