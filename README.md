# SwiftMVPDemo

## MVP

在MVP架构中，M层为数据层, 从本地数据库或者服务器获取并处理数据, 然后将数据反馈给presenter；V层为展示层, 将所有的交互事件传递给presenter处理, 自身只提供更新数据的接口(对iOS来说, ViewController显示也属于View层)；P层为业务处理层, 接收处理View传递过来的用户交互事件, 从Model层获取数据后进行业务逻辑处理, 然后更新View。

## 面向协议编程
Demo中V-P的交互采用的是面向协议的形式进行，View层通过遵守Presenter的协议就可以根据数据处理的过程更新界面，以此来实现解耦。