<!DOCTYPE html>
<html lang="en">
<#include "../common/home-header.ftl">
<body>

<div class="moon-news-body">
    <!--导航-->

    <#include "../common/navigation.ftl">
    <!--内容-->
    <div class="moon-content">
        <!--carousel-->
        <div class="moon-banner-new">
            <div class="layui-carousel moon-content-carousel" lay-filter="test1" id="test1">
                <div carousel-item id="home_banner">
                <#list banner as item>
                    <div onclick="goTo(${classifyId},${item.getArticleId()})">
                        <div class="moon-carousel-p">
                            <p>${item.getRealTime()}</p>
                            <h2>${item.getTitle()}</h2>
                        </div>
                        <#if item.getTypeId()==1>
                            <img width="800px" height="480px" src="${item.getImgUrl()[0]}">
                        <#else >
                            <img width="800px" height="480px" src="${config.getImgPrefix()+item.getImgUrl()[0]}">
                        </#if>

                    </div>
                </#list>
                </div>
            </div>
            <ul class="moon-banner-right">
                <#list banner as item>
                    <li id="banner-right-${item_index}" <#if item_index==0>class="banner-this"</#if>
                        onclick="goTo(${classifyId},${item.getArticleId()})">
                        <#if item.getTypeId()==1>
                            <img src="${item.getImgUrl()[0]}">
                        <#else >
                            <img src="${config.getImgPrefix()+item.getImgUrl()[0]}">
                        </#if>
                    </li>
                </#list>
            </ul>
        </div>

        <!--新闻内容-->
        <div class="moon-content-news">
            <div class="moon-content-news-lift" id="home-list">
                <#list topNews as news>
                    <!--图文-->
                    <#if news.getTypeId() == 1>
                        <div class="moon-news-card">
                            <div class="moon-news-text">
                                <img class="news-text-img" src="${news.imgUrl[0]}">
                                <div class="news-text-info">
                                    <div class="news-text-title"
                                         onclick="goTo(${classifyId},${news.getArticleId()})">${news.getTitle()!}</div>
                                    <div class="news-info">
                                        <div class="news-info-left">
                                            <button class="layui-btn layui-btn-xs moon-btn-primary-danger">${news.getClassifyName()!}</button>
                                            <img src="${news.getAvatar()}" alt="">
                                            <span class="moon-breadcrumb">
                                              <a>首页</a>
                                                <span>/</span>
                                              <a href="#">${news.getUsername()!}</a>
                                                <span>/</span>
                                              <a class="moon-this">${news.getCommentNum()!}条评论</a>
                                            </span>
                                        </div>
                                        <div class="news-info-right">
                                            <i class="layui-icon immnc mmnc-shanchuguanbicha cursor-pointer"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <span class="moon-news-card-split"></span>
                        </div>
                    </#if>
                    <!--多图-->
                    <#if news.getTypeId() == 2>
                        <div class="moon-news-card">
                            <div class="moon-news-img">
                                <div class="news-img-title"
                                     onclick="goTo(${classifyId},${news.getArticleId()})">${news.getTitle()!}</div>
                                <div class="news-img-atlas">
                                    <ul>
                                        <#list news.getImgUrl() as img>
                                            <#if img_index < 4>
                                                <li>
                                                    <img src="${config.getImgPrefix()+img}" alt="">
                                                </li>
                                            </#if>
                                        </#list>
                                    </ul>
                                </div>
                                <div class="news-img-info">
                                    <div class="news-info-left">
                                        <button class="layui-btn layui-btn-xs moon-btn-primary-danger">${news.getClassifyName()!}</button>
                                        <img src="" alt=""/>
                                        <span class="moon-breadcrumb">
                                          <a>首页</a>
                                            <span>/</span>
                                          <a href="#">${news.getUsername()!}</a>
                                            <span>/</span>
                                          <a class="moon-this">${news.getCommentNum()!}条评论</a>
                                        </span>
                                    </div>
                                    <div class="news-info-right">
                                        <i class="layui-icon immnc mmnc-shanchuguanbicha cursor-pointer"></i>
                                    </div>
                                </div>
                            </div>
                            <span class="moon-news-card-split"></span>
                        </div>
                    </#if>
                    <!--视频-->
                    <#if news.getTypeId() == 3>
                        <div class="moon-news-card">
                            <div class="moon-news-video">
                                <div class="moon-news-video-cover" onclick="goTo(${classifyId},${news.getArticleId()})">
                                    <img src="${config.getImgPrefix()+news.imgUrl[0]}" alt="${news.getTitle()}">
                                    <i class="layui-icon immnc mmnc-shipinbofangyingpian"></i>
                                </div>
                                <div class="moon-news-video-content">
                                    <div class="news-video-title"
                                         onclick="goTo(${classifyId},${news.getArticleId()})">${news.getTitle()!}</div>
                                    <div class="news-video-info">
                                        <div class="news-info-left">
                                            <button class="layui-btn layui-btn-xs moon-btn-primary-danger">${news.getClassifyName()}</button>
                                            <img src="${news.getAvatar()!}" alt="">
                                            <span class="moon-breadcrumb">
                                  <a>首页</a>
                                    <span>/</span>
                                  <a href="#">${news.getUsername()!}</a>
                                    <span>/</span>
                                  <a class="moon-this">${news.getCommentNum()}条评论</a>
                                </span>
                                        </div>
                                        <div class="news-info-right">
                                            <i class="layui-icon immnc mmnc-shanchuguanbicha cursor-pointer"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <span class="moon-news-card-split"></span>
                        </div>
                    </#if>
                </#list>
                <div id="refresh_float"></div>
            </div>
            <!--横幅-->
            <div class="moon-content-news-right">
                <!--横幅-->
                 <#if searchTopList?? && (searchTopList?size > 0)>
                    <div style="margin-top: 11px;margin-bottom: 22px" class="moon-news-card moon-height-js">
                        <span class="moon-news-card-split2"></span>
                        <div class="news-hot-list">
                            <div class="news-hot-title"><p>热搜风云榜</p></div>
                            <div class="news-hot-content">
                                <ul>
                                    <#list searchTopList as item>
                                        <li class="moon-news-card" onclick="goTo(${classifyId},${item.getArticleId()})">
                                            <a class="hot-item-title">
                                                <p>${item_index+1} ${item.getTitle()}</p>
                                            <#--<span class="moon-news-color-hot">热</span>-->
                                            <#--<span class="moon-news-color-new">新</span>-->
                                            </a>
                                            <span class="moon-news-card-split"></span>
                                        </li>
                                    </#list>

                                </ul>
                            </div>
                        </div>

                    </div>
                 </#if>
                <div id="top-side">

                <#--精彩图片-->
                    <#if graphic?? && (graphic?size > 0)>
                    <div style="margin-top: 2px" class="moon-news-card moon-height-js">
                        <span class="moon-news-card-split2"></span>
                        <div class="news-atlas-list">
                            <div class="news-atlas-title"><p>精彩新闻</p></div>
                            <div class="news-atlas-content">
                                <div class="atlas-item-row">
                                <#list graphic as item>
                                    <div class="atlas-column-t-i">
                                        <a class="atlas-item-column-t-i"
                                           onclick="goTo(${classifyId},${item.getArticleId()})">
                                            <div class="atlas-item-column-img">
                                                <img class="" src="${item.getImgUrl()[0]}" alt="">
                                            </div>
                                        </a>
                                        <a onclick="goTo(${classifyId},${item.getArticleId()})"
                                           class="atlas-item-column-info">${item.getTitle()}</a>
                                    </div>
                                </#list>
                                </div>
                            </div>
                        </div>
                    </div>
                    </#if>
                </div>
                <#if imgMap?? && (imgMap?size > 0)>
                    <div style="margin-top: 24px" class="moon-news-card moon-height-js">
                        <span class="moon-news-card-split2"></span>
                        <div class="news-atlas-list">
                            <div class="news-atlas-title"><p>精彩图片</p></div>
                            <div class="news-atlas-content">
                                <div class="atlas-item-row">
                                    <#list imgMap as item>
                                        <div style="margin-bottom: 10px"
                                             onclick="goTo(${classifyId},${item.getArticleId()})">
                                            <a class="atlas-item-column-a">
                                                <div class="atlas-item-column-img">
                                                    <img class="" src="${config.getImgPrefix()+item.getImgUrl()[0]}" alt="">
                                                </div>
                                                <p>${item.getImgUrl()?size}图</p>
                                            </a>
                                            <a class="atlas-item-column-info">${item.getTitle()}</a>
                                        </div>
                                    </#list>
                                </div>
                            </div>
                        </div>

                    </div>
                </#if>
            <#--精彩视频-->
                <#if videoList?? && (videoList?size > 0) >
                    <div style="margin-top: 24px" class="moon-news-card moon-height-js">
                        <span class="moon-news-card-split2"></span>
                        <div class="news-atlas-list">
                            <div class="news-atlas-title"><p>精彩视频</p></div>
                            <div class="news-atlas-content">
                                <div class="atlas-item-row">
                                    <#list videoList as item>
                                        <div style="margin-bottom: 10px"
                                             onclick="goTo(${classifyId},${item.getArticleId()})">
                                            <a class="atlas-item-column-a">
                                                <div class="atlas-item-column-img">
                                                    <img class="" src="${config.getImgPrefix()+item.getImgUrl()[0]}" alt="">
                                                </div>
                                                <i class="layui-icon immnc mmnc-shipinbofangyingpian"></i>
                                            </a>
                                            <a class="atlas-item-column-info">${item.getTitle()}</a>
                                        </div>
                                    </#list>
                                </div>
                            </div>
                        </div>

                    </div>
                </#if>
            <#--网站信息-->
                <div style="margin-top: 24px" class="moon-news-card moon-height-js">
                    <span class="moon-news-card-split2"></span>
                    <div class="news-hot-list">
                        <div class="news-hot-title"><p>网站信息</p></div>
                        <div class="news-web-content">
                            <ul>
                                <li class="moon-news-card">
                                    <a class="website-item-title">
                                        <span>关于我们</span>
                                    </a>
                                </li>
                                <li class="moon-news-card">
                                    <a class="website-item-title">
                                        <span>备案号：蜀ICP备18018817号-1</span>
                                    </a>
                                </li>
                                <li class="moon-news-card">
                                    <a class="website-item-title">
                                        <span>违法和不良信息举报：028-962377</span>
                                    </a>
                                </li>
                                <li class="moon-news-card">
                                    <a class="website-item-title">
                                        <span>中国互联网举报中心 电话:12377</span>
                                    </a>
                                </li>
                                <li class="moon-news-card">
                                    <a href="/images/dianxin.jpeg" target="_blank" class="website-item-title">
                                        <span>增值电信业务经营许可证</span>
                                    </a>
                                </li>
                                <li class="moon-news-card">
                                    <a href="/images/网文.jpg" target="_blank" class="website-item-title">
                                        <span>网络文化经营许可证</span>
                                    </a>
                                </li>
                                <li class="moon-news-card">
                                    <a href="/images/广播电视节目制作经营许可证.jpg" target="_blank" class="website-item-title">
                                        <span>广播电视节目制作经营许可证</span>
                                    </a>
                                </li>
                                <li class="moon-news-card">
                                    <a class="website-item-title">
                                        <span>技术支持：成都月步科技有限公司</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <ul class="layui-fixbar">
            <!--<li class="layui-icon" lay-type="bar1" style=""></li>-->
            <li class="layui-icon layui-icon-top layui-fixbar-top" lay-type="top" style="display: none;"></li>
        </ul>
    </div>

</div>
<script src="/layui/layui.js"></script>
<script src="/js/jquery-3.3.1.min.js"></script>
<script src="/js/jquery.cookie.js"></script>
<script src="/js/moon.js"></script>
<script src="/js/index.js"></script>
<script>
</script>
<script>

</script>
<script>
    document.addEventListener("DOMContentLoaded", ready);
    var urlPrefix = "https://p0.cdrysj.com/po";
    function ready() {
        getNav(0)
    }
</script>
<script>
    layui.use('carousel', function () {
        var carousel = layui.carousel;
        //建造实例
        carousel.render({
            elem: '#test1'
            , width: '800px' //设置容器宽度
            , height: '480px'
            , arrow: 'hover' //始终显示箭头
            , anim: 'default' //切换动画方式
            , interval: 2000
            //,indicator: 'none'//指示器位置
        });
        carousel.on('change(test1)', function (obj) { //test1来源于对应HTML容器的 lay-filter="test1" 属性值
            $("#banner-right-" + obj.prevIndex).removeClass("banner-this");
            $("#banner-right-" + obj.index).addClass("banner-this");
        });
    });
</script>

</body>
</html>
