
<!DOCTYPE html>
<html>
<head>
    
<#include "head.ftl">

</head>

<body>
    
    <!-- 菜单 -->
    <#include "menu.ftl">

    <div class="bg-box">
        <div class="center">
            <div class="border-box">
                <h3 class="title-model">
                    <i></i>
                    <span>用户注册</span>
                </h3>
                <div class="register-nav">
                    <ul>
                        <li>
                            <i>!</i>
                            <span>应聘说明</span>
                        </li>
                        <li>
                            <i>1</i>
                            <span>注册帐户</span>
                        </li>
                        <li class="curr">
                            <i>2</i>
                            <span>填写简历</span>
                        </li>
                        <li>
                            <i>3</i>
                            <span>注册成功</span>
                        </li>
                    </ul>
                </div>

                


                <div class="resume">
                    <!--基本信息展示start-->
                    <div class="user-resume basic-info-show" style="display:none;">
                        <!--<div class="later-complete-resume">以后再完善简历，<a href="reg3.html">下一步&gt;&gt;</a></div>-->
                        <div class="title-flag">
                            <span class="title-text">基本信息</span>
                        </div>
                        <table cellpadding="0" cellspacing="0" class="table-box">
                            <tr>
                                <td class="w2">姓名：</td>
                                <td id="showRealName"></td>
                            </tr>
                            <tr>
                                <td class="w2">性别：</td>
                                <td id="showSex"></td>
                            </tr>
                            
                            <tr>
                                <td class="w2">手机号码：</td>
                                <td id="showUsername"></td>
                            </tr>
                            <tr>
                                <td class="w2">学历：</td>
                                <td id="showEducation"></td>
                            </tr>
                            <tr>
                                <td class="w2">毕业院校：</td>
                                <td id="showSchool"></td>
                            </tr>
                            <tr>
                                <td class="w2">Email：</td>
                                <td id="showEmail"></td>
                            </tr>
                            <tr>
                                <td class="w2">婚姻状况：</td>
                                <td id="showMarry"></td>
                            </tr>
                            <tr>
                                <td class="w2">英语等级：</td>
                                <td id="showEnglishDegree"></td>
                            </tr>                            
                            <tr>
                                <td class="w2">工作年限：</td>
                                <td id="showWorkYear"></td>
                            </tr>
                            <tr>
                                <td class="w2">所属专业：</td>
                                <td id="showProfessional"></td>
                            </tr>
                            <tr>
                                <td class="w2">个人简介：</td>
                                <td id="showProfile"></td>
                            </tr>
                            <tr>
                                <td class="w2"></td>
                                <td>
                                    <span class="btn-box basic-info-modify-btn">修改</span>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <!--基本信息展示end-->

                    <!--基本信息修改start-->
                    <div class="basic-info-modify" style="display:block;">
                        <!--<div class="later-complete-resume">以后再完善简历，<a href="reg3.html">下一步&gt;&gt;</a></div>-->
                        <div class="title-flag">
                            <span class="title-text">基本信息</span>
                        </div>
                        <table cellpadding="0" cellspacing="0" class="table-box">
                            <tbody>
                                <tr>
                                    <td class="w2"><span class="red">*</span>姓名：</td>
                                    <td>
                                        <input class="input1" type="text" maxlength="8" id="modifyRealName" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="w2"><span class="red">*</span>性别：</td>
                                    <td>
                                        <input class="radio" type="radio" name="modifySex" value="male" checked="checked" />
                                        <span>男</span>
                                        <input class="radio" type="radio" name="modifySex" value="female" />
                                        <span>女</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="w2"><span class="red">*</span>手机号码：</td>
                                    <td>
                                        <input class="input1 gray-bg" type="text" disabled="disabled" maxlength="11" id="modifyUsername" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="w2"><span class="red">*</span>学历：</td>
                                    <td>
                                        <select id="modifyEducation">
                                            <option value="select">-- 请选择 --</option>
                                            <option value="dazhuan">大专</option>
                                            <option value="benke">本科</option>
                                            <option value="suoshi">硕士</option>
                                            <option value="boshi">博士</option>
                                            <option value="mba">MBA</option>
                                            <option value="emba">EMBA</option>
                                            <option value="zhongzhuan">中专</option>
                                            <option value="zhongji">中技</option>
                                            <option value="gaozhong">高中</option>
                                            <option value="chuzhong">初中</option>
                                            <option value="qita">其他</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="w2"><span class="red">*</span>毕业院校：</td>
                                    <td>
                                        <input class="input1" type="text" maxlength="30" id="modifySchool" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="w2"><span class="red">*</span>Email：</td>
                                    <td>
                                        <input class="input1" type="text" maxlength="50" id="modifyEmail" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="w2"><span class="red">*</span>婚姻状况：</td>
                                    <td>
                                        <select id="modifyMarry">
                                            <option value="select">-- 请选择 --</option>
                                            <option value="single">未婚</option>
                                            <option value="married">已婚</option>
                                            <option value="divorce">保密</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="w2"><span class="red">*</span>英语等级：</td>
                                    <td>
                                        <select id="modifyEnglishDegree">
                                            <option value="select">-- 请选择 --</option>
                                            <option value="cet4">CET4</option>
                                            <option value="cet6">CET6</option>
                                            <option value="zhuan4">专业4级</option>
                                            <option value="zhuan8">专业8级</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="w2"><span class="red">*</span>工作年限：</td>
                                    <td>
                                        <select id="modifyWorkYear">
                                            <option value="select">-- 请选择 --</option>
                                            <option value="zaidu">在读学生</option>
                                            <option value="yinjie">应届毕业生</option>
                                            <option value="lg1">一年以上</option>
                                            <option value="lg2">二年以上</option>
                                            <option value="lg3">三年以上</option>
                                            <option value="lg5">五年以上</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="w2"><span class="red">*</span>所属专业：</td>
                                    <td>
                                        <input class="input1" type="text" maxlength="30" id="modifyProfessional" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="w2"><span class="red">*</span>个人简介：</td>
                                    <td>
                                        <textarea class="user-textarea reg-textarea" maxlength="400" id="modifyProfile"></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="w2"></td>
                                    <td>
                                        <span class="btn-box basic-info-save-btn">保存</span>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <!--基本信息修改end-->

                    <div class="separated"></div>
                    
                    <!--工作经验展示start-->
                    <div class="user-resume work-show">
                        <div class="title-flag">
                            <span class="title-text">简历信息</span>
                        </div>
                        <div class="add-btn">
                            <span class="add-btn-text">工作经验</span>
                        </div>
                        <div class="work-list">
                            
                        </div>
                    </div>
                    <!--工作经验展示end-->

                    <!--添加工作经验盒子start-->
                    <div class="user-resume" style="display:none;">
                        <div class="work-box">
                            <div>
                                <form id="work_0">
                                    <div class="remove-btn">
                                        <span id="cancelAddWork">取消</span>
                                    </div>

                                    <table class="table-box" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td class="w2"><span class="red">*</span>时间：</td>
                                            <td>
                                                <select class="fromYear">
                                                    <option value="">年</option>
                                                </select>
                                                <select class="fromMonth">
                                                    <option value="">月</option>
                                                </select>
                                                到
                                                <select class="toYear">
                                                    <option value="">年</option>
                                                </select>
                                                <select class="toMonth">
                                                    <option value="">月</option>
                                                </select>
                                            </td>
                                            <td align="right"><span class="btn-box work-save-btn" id="0">保存</span></td>
                                        </tr>
                                    </table>
                                    <table class="table-box" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td class="w2"><span class="red">*</span>公司名称：</td>
                                            <td class="w3">
                                                <input class="input1 companyName" type="text" maxlength="30">
                                            </td>
                                            <td class="w2"><span class="red">*</span>职位：</td>
                                            <td>
                                                <input class="input1 workPosition" type="text" maxlength="30">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="w2"><span class="red">*</span>工作描述：</td>
                                            <td colspan="3">
                                                <textarea class="user-textarea reg-textarea workContent" maxlength="800"></textarea>
                                            </td>
                                        </tr>
                                    </table>
                                </form>
                                <div class="line"></div>
                            </div>
                        </div>
                    </div>
                    <div class="continue-add">
                        <span class="add-work">添加工作经验</span>
                    </div>
                    <!--添加工作经验盒子end-->

                    <div class="separated"></div>
                    
                    <!--项目经验展示start-->
                    <div class="user-resume project-show">    
                        <div class="add-btn">
                            <span class="add-btn-text">项目经验</span>
                        </div>
                        <div class="project-list">
                            
                        </div>
                    </div>
                    <!--项目经验展示end-->

                    <!--添加项目经验盒子start-->
                    <div class="user-resume" style="display:none;">
                        <div class="project-box">
                            <div>
                                <form id="project_0">
                                    <div class="remove-btn">
                                        <span id="cancelAddProject">取消</span>
                                    </div>
                                    <table class="table-box" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td class="w2"><span class="red">*</span>时间：</td>
                                            <td>
                                                <select class="fromYear">
                                                    <option value="">年</option>
                                                </select>
                                                <select class="fromMonth">
                                                    <option value="">月</option>
                                                </select>
                                                到
                                                <select class="toYear">
                                                    <option value="">年</option>
                                                </select>
                                                <select class="toMonth">
                                                    <option value="">月</option>
                                                </select>
                                            </td>
                                            <td align="right"><span class="btn-box project-save-btn" id="0">保存</span></td>
                                        </tr>
                                    </table>
                                    <table class="table-box" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td class="w2"><span class="red">*</span>项目名称：</td>
                                            <td class="w3">
                                                <input class="input1 projectName" type="text" maxlength="30">
                                            </td>
                                            <td class="w2"><span class="red">*</span>项目职责：</td>
                                            <td>
                                                <input class="input1 projectPosition" type="text" maxlength="30">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class='w2'><span class="red">*</span>项目描述：</td>
                                            <td colspan='3'>
                                                <textarea class='user-textarea reg-textarea expContent' maxlength="800" style="width: 652px;"></textarea>
                                            </td>
                                        </tr>
                                    </table>
                                </form>
                                <div class="line"></div>
                            </div>
                        </div>
                    </div>
                    <!--添加项目经验盒子end-->
                    <div class="continue-add">
                        <span class="add-project">添加项目经验</span>
                    </div>

                    <div class="separated"></div>

                    <div style="text-align:center">
                        <a class="btn-box" href="${HrServerHost}/center/reg3.html">完 成</a>    
                    </div>
                    
                </div>
                
            </div>
        </div>
    </div>

    <!-- 底部 -->
    <#include "footer.ftl">

    
</body>
</html>
