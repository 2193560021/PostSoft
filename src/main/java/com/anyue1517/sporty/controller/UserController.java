package com.anyue1517.sporty.controller;

import com.anyue1517.sporty.common.Result;
import com.anyue1517.sporty.entity.User;
import com.anyue1517.sporty.service.UserService;
import com.anyue1517.sporty.utils.SMSUtils;
import com.anyue1517.sporty.utils.ValidateCodeUtils;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;


@RestController
@RequestMapping("/user")
@Slf4j
public class UserController {

    private UserService userService;

    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    /**
     * 用户注册
     *
     * @param user
     * @return
     */
    @PostMapping("/register")
    public Result<?> register(@RequestBody User user) {
        //构造查询条件
        LambdaQueryWrapper<User> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(User::getName, user.getName());
        User userOne1 = userService.getOne(queryWrapper);
        if (userOne1 != null) {
            return Result.error("-1", "用户名重复，请重新输入！");
        }

        LambdaQueryWrapper<User> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.eq(User::getPhone, user.getPhone());
        User userOne2 = userService.getOne(lambdaQueryWrapper);
        if (userOne2 != null) {
            return Result.error("-1", "手机号已被注册，请重新输入！");
        }
        //md5 加密保存
        String md5Password = DigestUtils.md5DigestAsHex(user.getPassword().getBytes());
        user.setPassword(md5Password);
        userService.save(user);
        return Result.success();
    }



    /**
     * 使用账号密码登录
     *
     * @param user
     * @return
     */
    @PostMapping("/login")
    public Result<?> login(@RequestBody User user, HttpServletRequest request) {
        //1,将页面提交的密码password进行md5加密
        String password = user.getPassword();
        password = DigestUtils.md5DigestAsHex(password.getBytes());

        //2,根据页面提交的用户名name查询数据库
        LambdaQueryWrapper<User> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(User::getName, user.getName());
        User userOne = userService.getOne(queryWrapper);

        //3，如果没有查询到返回登录失败信息
        if (userOne == null) {
            return Result.error("-1", "用户名不存在");
        }
        //4，密码比对，如果不一致返回登录失败信息
        if (!password.equals(userOne.getPassword())) {
            return Result.error("-1", "用户名或密码错误");
        }
        //5，登录成功，返回登录成功的用户信息冰将用户信息存入request域中
        request.getSession().setAttribute("user", userOne.getId());
        return Result.success(userOne);
    }


    /**
     * 新增用户
     *
     * @param user
     * @return
     */
    @PostMapping
    public Result<?> save(@RequestBody User user) {
        if (user.getPassword() == null) {
            user.setPassword("123456");
        }
        //md5 加密保存
        String md5Password = DigestUtils.md5DigestAsHex(user.getPassword().getBytes());
        user.setPassword(md5Password);
        userService.save(user);
        return Result.success();
    }


    /**
     * 根据id修改员工信息
     *
     * @param user
     * @return
     */
    @PutMapping
    public Result<?> update(@RequestBody User user) {

        userService.updateById(user);

        return Result.success();
    }


    /**
     * 用户信息的分页查询
     *
     * @param pageNum
     * @param pageSize
     * @param name
     * @return
     */
    @GetMapping
    public Result<?> findPage(@RequestParam(defaultValue = "1") Integer pageNum,
                              @RequestParam(defaultValue = "5") Integer pageSize,
                              @RequestParam(defaultValue = "") String name) {

        //构造分页构造器
        Page<User> pageInfo = new Page<>(pageNum, pageSize);

        //构造条件构造器
        LambdaQueryWrapper<User> queryWrapper = new LambdaQueryWrapper<>();
        //添加一个过滤条件(通过email查询)
        queryWrapper.like(StringUtils.isNotBlank(name), User::getName, name);
        queryWrapper.orderByDesc(User::getUpdateTime);
        //执行查询
        Page<User> userPage = userService.page(pageInfo, queryWrapper);
        return Result.success(userPage);
    }


    /**
     * 删除用户信息
     *
     * @param id
     * @return
     */
    @DeleteMapping("/{id}")
    public Result<?> del(@PathVariable long id) {
        userService.removeById(id);
        return Result.success();
    }
}
