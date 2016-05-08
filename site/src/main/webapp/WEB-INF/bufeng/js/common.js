var dialogUtil = {
    couponWindow: {//优惠券对话框
        window: undefined,
        create: function (param) {
            var defaultParam = {title: '恭喜获得', couponValue: '5'};
            param = $.extend({}, param, defaultParam);
            var dialog = $('<div class="window"></div>');
            var content = $('<div class="window-content"></div>');
            var head = $('<div class="head"><div class="container">' + param.title + '</div></div>');
            var middle =
                $('<div class="middle">' +
                //'<img src="/images/new/coupon/coupon_1_bg.jpg" width="60%"/>' +
                //'<span class="coupon-num" style="right:40%">' + param.couponValue + '</span>' +
                '<div class="coupon">' +
                    '<div class="img-panel">' +
                    '<img src="/images/new/coupon/coupon_1_bg.jpg"/>' +
                    '<a class="num-panel"><span class="num">5</span><span class="unit">元</span></a>' +
                    '<span class="cdesc">全场通用现金券</span>' +
                    '<span class="status">未兑换</span>' +
                    '</div>' +
                '</div>' +
                '<div class="text" ></div>' +
                '<div class="text">已存入“卡券”中了哟，<a href="/manage/couponAndFiveCard">立刻查看</a>！</div>' +
                '</div>');
            var bottom = $('<div class="bottom"><a href="#"><img src="/images/qk_13.png"/></a></div>');
            var that = this;
            bottom.find("img").click(function (e) {
                e.preventDefault();
                that.hide();
            });
            dialog.append(content);
            content.append(head).append(middle).append(bottom);
            this.window = dialog;
        },
        show: function (param) {
            if (this.window === undefined) {
                this.create(param);
                $("body").append(this.window);
            }
            this.window.show();
        },
        hide: function () {
            if (this.window !== undefined) {
                this.window.hide();
            }
        }
    }
};