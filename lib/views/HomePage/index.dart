import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_manda/utils/screen.dart';
import 'package:flutter_manda/widgets/DirverLine.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

double paddingFR = setScreen(type: 'w', value: 34);

class Homepage extends StatefulWidget {
  Homepage({Key key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334);
    return Scaffold(
      body: Container(
        child: ListView(children: <Widget>[Header(), DirverLine(), Main()]),
      ),
    );
  }
}

//应用列表
class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var applicationArr = [
      {
        'title': '智能平台',
        'apps': [
          {
            'name': 'github',
            'icon': IconData(0xe885, fontFamily: 'iconfont'),
            'color': Colors.orange
          },
          {
            'name': 'blog',
            'icon': IconData(0xe8e8, fontFamily: 'iconfont'),
            'color': Colors.green
          },
          {
            'name': '快递查询',
            'icon': IconData(0xe603, fontFamily: 'iconfont'),
            'color': Colors.blue
          },
        ]
      },
      {
        'title': '工作中心',
        'apps': [
          {
            'name': '自定义',
            'icon': IconData(0xe67e, fontFamily: 'iconfont'),
            'color': Colors.red
          },
          {
            'name': '扫一扫',
            'icon': IconData(0xe60d, fontFamily: 'iconfont'),
            'color': Colors.green
          },
        ]
      },
      {
        'title': '其他应用',
        'apps': [
          {
            'name': '音乐排行榜',
            'icon': IconData(0xe600, fontFamily: 'iconfont'),
            'color': Colors.redAccent
          },
          {
            'name': '图片欣赏',
            'icon': IconData(0xe716, fontFamily: 'iconfont'),
            'color': Colors.blue
          },
          {
            'name': '实时段子',
            'icon': IconData(0xe607, fontFamily: 'iconfont'),
            'color': Colors.orange
          },
          {
            'name': '身份证识别',
            'icon': IconData(0xe605, fontFamily: 'iconfont'),
            'color': Colors.green
          },
          {
            'name': 'Map',
            'icon': IconData(0xe60a, fontFamily: 'iconfont'),
            'color': Colors.orange
          },
          {
            'name': '更多应用',
            'icon': IconData(0xe792, fontFamily: 'iconfont'),
            'color': Colors.blue
          },
        ]
      }
    ];
    return Container(
        child: Column(
            children: applicationArr
                .asMap()
                .keys
                .map((index) => BuildAppliaciton(
                    applications: applicationArr[index], index: index))
                .toList()));
  }
}

class BuildAppliaciton extends StatelessWidget {
  final Map applications;
  final int index;
  const BuildAppliaciton({Key key, this.applications, this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            padding: EdgeInsets.only(
                left: paddingFR,
                right: paddingFR,
                bottom: setScreen(type: 'w', value: 20),
                top: index == 0 ? setScreen(type: 'w', value: 20) : 0),
            child: Text('${applications['title']}',
                style: TextStyle(
                    fontSize: setScreen(type: 'size', value: 35.0),
                    fontWeight: FontWeight.w500),
                textAlign: TextAlign.left)),
        GridView.builder(
          physics: NeverScrollableScrollPhysics(), //去除内部滚动
          itemCount: applications['apps'].length,
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //横轴元素个数
              crossAxisCount: 5,
              //纵轴间距
              mainAxisSpacing: 0.0,
              //横轴间距
              crossAxisSpacing: 0.0,
              //子组件宽高长度比例
              childAspectRatio: 0.88),
          itemBuilder: (BuildContext context, int index) {
            return Container(
              child: _applicationItem(applications['apps'][index], context),
            );
          },
        )
      ],
    );
  }

  Widget _applicationItem(item, context) {
    return Container(
        child: InkWell(
      onTap: () {
        Navigator.of(context).pushNamed('git_page', arguments: null); //注意2
        // PageRouter.router.navigateTo(context, "/git-repos");
        // Navigator.pushNamed(context, "git");
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              child: Icon(
                item['icon'],
                color: Colors.white,
                size: setScreen(type: 'size', value: 50),
              ),
              color: item['color'],
              width: setScreen(type: 'w', value: 80.0),
              height: setScreen(type: 'w', value: 80.0),
            ),
          ),
          Container(
            height: setScreen(type: 'h', value: 66),
            child: Text(
              '${item['name']}',
              style: TextStyle(fontSize: setScreen(type: 'size', value: 22)),
            ),
          )
        ],
      ),
    ));
  }
}

// 头部
class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        buildHeaderTitle(),
        buildHeaderBanner(),
        buildHeaderNotify()
      ],
    );
  }

  Container buildHeaderNotify() {
    return Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey, width: 0.2))),
        padding: EdgeInsets.only(top: 10.0, bottom: 10.0, left: paddingFR),
        child: Row(children: <Widget>[
          Icon(
            IconData(0xe7db, fontFamily: 'iconfont'),
            size: setScreen(type: 'size', value: 25.0),
          ),
          Text(
            '本周新增10个活跃用户',
            style: TextStyle(fontSize: setScreen(type: 'size', value: 25)),
          ),
        ]));
  }

  Container buildHeaderBanner() {
    var imgs = [
      'assets/img/banner1.jpg',
      'assets/img/b1.jpg',
      'assets/img/b6.jpg',
      'assets/img/banner3.jpg',
      'assets/img/banner4.jpg',
      'assets/img/banner5.jpg',
    ];
    Swiper _swiper = new Swiper(
      itemBuilder: (BuildContext context, int index) {
        return ClipRRect(
          child: Image.asset(imgs[index], fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(0), //圆角 这里先设置为0
        );
      },
      itemCount: imgs.length,
      onTap: (test) {
        print('我是第$test');
      },
      // viewportFraction: 0.8,
      // scale: 0.9,//这个的效果是直接显示三个 中间的最大占主屏
      // pagination: new SwiperPagination(),
    );

    return Container(
      child: _swiper,
      width: double.infinity,
      height: setScreen(type: 'w', value: 300),
    );
  }

  Container buildHeaderTitle() {
    double paddingTB = setScreen(type: 'w', value: 28);
    return Container(
      padding: EdgeInsets.fromLTRB(
          paddingFR, setScreen(type: 'w', value: 30), paddingFR, paddingTB),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Hi，早上好',
            style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
                fontSize: setScreen(type: 'size', value: 32.0),
                letterSpacing: 0.5,
                color: Colors.black // Color(0xFF4A6572),
                ),
          ),
          Row(
            children: <Widget>[
              Icon(IconData(0xe65c, fontFamily: 'iconfont'),
                  size: setScreen(type: 'size', value: 45.0)),
              Text(' 常州市',
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      fontSize: setScreen(type: 'size', value: 32.0),
                      letterSpacing: 0.5,
                      color: Colors.black // Color(0xFF4A6572),
                      ))
            ],
          )
        ],
      ),
    );
  }
}
