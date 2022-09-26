package com.online.edu.ucenterservice.service.impl;

import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.online.edu.common.VO.MemberVO;
import com.online.edu.common.dto.MemberQuery;
import com.online.edu.common.enums.ResultEnum;
import com.online.edu.common.exception.EduException;
import com.online.edu.ucenterservice.pojo.EduMember;
import com.online.edu.ucenterservice.mapper.EduMemberMapper;
import com.online.edu.ucenterservice.service.EduMemberService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.codec.cli.Digest;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;
import org.springframework.util.StringUtils;

import java.util.concurrent.TimeUnit;

/**
 * <p>
 * 会员表 服务实现类
 * </p>
 *
 * @author 许JIAN林
 * @since 2019-12-30
 */
@Service
@Slf4j
public class EduMemberServiceImpl extends ServiceImpl<EduMemberMapper, EduMember> implements EduMemberService {


    @Autowired
    private StringRedisTemplate stringRedisTemplate;

    //过期时间
    final long OUT_TIME = 60 * 30;

    //默认密码
    final  String DEFAULE_PASS = DigestUtils.md5DigestAsHex("123456".getBytes());

    //根据微信id判断是否有用户信息
    @Override
    public EduMember getByOpenid(String openid) {
        QueryWrapper<EduMember> wrapper = new QueryWrapper<>();
        wrapper.eq("openid",openid);
        EduMember member = baseMapper.selectOne(wrapper);
        return member;
    }
    @Override
    public EduMember isExitMember(String mobile, String password,int type) {

        //密码加密查询
        String md5password = DigestUtils.md5DigestAsHex(password.getBytes());
        //构建查询条件
        QueryWrapper wrapper = new QueryWrapper();
        wrapper.eq("mobile", mobile);
        wrapper.eq("password",md5password);
        wrapper.eq("type",type);
        EduMember eduMember = baseMapper.selectOne(wrapper);
        return eduMember;
    }

    /**
     * 根据手机号码查询该号码是否已注册
     * @param mobile
     * @return true： 注册过   false：未注册
     */
    @Override
    public boolean isRegisterByMobile(String mobile,int type) {

        QueryWrapper<EduMember> wrapper = new QueryWrapper<>();
        wrapper.eq("mobile", mobile);
        wrapper.eq("type", type);
        EduMember eduMember = baseMapper.selectOne(wrapper);
        if (eduMember == null){
            log.info("【用户注册】该手机号码"+ mobile +"不存在");
            return false;
        }

        log.info("【用户注册】该手机号码" + mobile + "已注册");
        return true;
    }

    @Override
    public boolean saveEdumember(EduMember eduMember) {
        //判断用户手机号是否存在
        boolean flag = this.isRegisterByMobile(eduMember.getMobile(),eduMember.getType());
        if (!flag){
            //将密码加密保存到数据库
            String md5password = DigestUtils.md5DigestAsHex(eduMember.getPassword().getBytes());
            eduMember.setPassword(md5password);
            //设置默认头像
            eduMember.setAvatar("https://gdpuxjl-edu.oss-cn-shenzhen.aliyuncs.com/default.png");
            baseMapper.insert(eduMember);
            return true;
        }
        throw new EduException(ResultEnum.MOBILE_EXIST);
    }

    @Override
    public boolean updateInfo(MemberVO memberVO) throws EduException{
        //更新用户信息
        EduMember member = new EduMember();
        BeanUtils.copyProperties(memberVO,member);
        int byId = baseMapper.updateById(member);

        if (byId ==1){
            //将更新好的数据写进reids缓存
            //获取redis剩余时间
            Long expire = stringRedisTemplate.getExpire(memberVO.getAccesstoken());
            String jsonString = JSON.toJSONString(member);

            stringRedisTemplate.opsForValue().set(memberVO.getAccesstoken(), jsonString,expire, TimeUnit.SECONDS);
            return true;
        }
        return false;
    }

    /**
     *
     * @param id
     * @param curpass
     * @param newpass
     * @return 返回0，代表密码和原来不匹配 ，返回 1，修改成功 返回2 修改失败
     */
    @Override
    public int updatePass(String id, String curpass, String newpass) {

        //根据id查询用户密码
        String password = baseMapper.selectById(id).getPassword();
        //判断是否匹配
        //密码加密匹配
        String md5curpass = DigestUtils.md5DigestAsHex(curpass.getBytes());
        System.out.println("md5curpass"+md5curpass);


        if (md5curpass.equals(password)){
            //匹配,则修改密码
            String md5newpass = DigestUtils.md5DigestAsHex(newpass.getBytes());
            EduMember eduMember = new EduMember();
            eduMember.setId(id);
            eduMember.setPassword(md5newpass);
            int i = baseMapper.updateById(eduMember);
            if (i == 1){
                return 1;
            }else {
                return 2;
            }
        }else{
            //当前密码不匹配
            return 0;
        }

    }

    /** 重置用户密码 */
    @Override
    public boolean resetMemberPass(String id) {
        EduMember eduMember = new EduMember();

        eduMember.setId(id);
        eduMember.setPassword(DEFAULE_PASS);
        int i = baseMapper.updateById(eduMember);
        return i > 0;
    }

    @Override
    public boolean addMember(EduMember eduMember) {

        eduMember.setAge(0);
        eduMember.setSex(0);
        eduMember.setSign("哈喽~");
        eduMember.setPassword(DEFAULE_PASS);
        int insert = baseMapper.insert(eduMember);
        return insert > 0;
    }

    /** 根据条件进行查询，并分页显示 */
    @Override
    public IPage<EduMember> pageQuery(String memberId,Page page, Long type, MemberQuery memberQuery) {
        //新建条件查询对象
        QueryWrapper queryWrapper = new QueryWrapper();
        //设置查询类型
        queryWrapper.eq("type",type);
        //不显示管理员自身信息
        queryWrapper.ne("id",memberId);
        if (memberQuery == null) {
            //当教师查询条件为空时
            return baseMapper.selectPage(page,queryWrapper);
        }

        String mobile = memberQuery.getMobile();
        String nickname = memberQuery.getNickname();
        String begin = memberQuery.getBegin();
        String end = memberQuery.getEnd();
        if ( !StringUtils.isEmpty(mobile)) {
            queryWrapper.like("mobile", mobile);
        }
        if (!StringUtils.isEmpty(nickname)) {
            queryWrapper.like("nickname", nickname);
        }
        if (!StringUtils.isEmpty(begin)) {
            queryWrapper.ge("gmt_create", begin);
        }
        if (!StringUtils.isEmpty(end)) {
            queryWrapper.le("gmt_create", end);
        }
        return baseMapper.selectPage(page,queryWrapper);
    }
}
