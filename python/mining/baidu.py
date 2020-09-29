#!/usr/bin/env python
# encoding: utf-8

from baidumap import config
from baidumap.api.handle import get_handle
from baidumap.object import BaiduMapObject

import logging

# get raw handler
ak_key = 'ZAMW5**********************'
raw_handler = get_handle(ak_key)

# get logger
FORMAT = "%(asctime)s %(thread)d %(message)s"
logging.basicConfig(format=FORMAT, datefmt="[%Y-%m-%d %H:%M:%S]")
logger = logging.getLogger()
logger.setLevel(logging.DEBUG)

if __name__ == '__main__':
    # log config(no necessary)
    config.mode = config.value.DEBUG
    config.logger = logger

    # Agent Mode
    print('---\nAgent Mode:\n')
    raw_handler = get_handle(ak_key)
    thu_main = BaiduMapObject(address='北京市清华大学紫荆园餐厅')
    thu_main.from_address(raw_handler)
    print('from address find location: %s' %
          thu_main.get_property('location')['location'])
    print('from address find location: %s' % thu_main.get_properties(
        ['lat', 'lng'], p_defaults={'lat': '-1',
                                    'lng': '-1'}))
    thu_main.from_location(raw_handler)
    print('\nfrom location find uid: %s' % thu_main.get_property('uid'))
    print('and its name: %s' % thu_main.get_property('name'))

    find_location = thu_main.get_properties(
        ['uid', 'name'], p_defaults={'uid': '',
                                     'name': ''})
    print('--\nfrom location find uid and name: %s' % find_location)

    for index in find_location:
        thu_main.from_json(find_location[index])
        thu_main.from_uid(raw_handler, detail=True)
        print('-\nfrom uid find info:\n%s' % thu_main)

    # Factory Mode
    print('---\nFactory Mode:\n')
    iplocer = get_handle(ak_key, 'location/ip')
    iplocer.set_params()
    print(
        iplocer.run(collect_keys=['address', 'content']).get_property(
            'address')['address'])

    print('---\n')
    placeser = get_handle(
        ak_key,
        'place/v2/search',
        is_list=True,
        query='ATM机',
        tag='银行',
        region='北京', )
    print(
        placeser.run(page_size=20, max_page_num=1, max_result_num=15)
        .get_property('address'))

    # complex sample

    # get zijing dormitory location from agent mode
    thu_main = BaiduMapObject(address='北京市清华大学紫荆宿舍')
    thu_main.from_address(raw_handler)
    thu_location = thu_main.get_property('location')['location']
    print('---\n\n起始坐标: %s' % (thu_location))

    # get circle search handle from factory mode
    # sort by distance
    circleser = get_handle(
        ak_key,
        'place/v2/search',
        is_list=True,
        query='火车站',
        scope=2,
        filter='sort_name:distance|sort_rule:1')

    circleser.set_params(radius=10000, location=thu_location)
    nearest_station = circleser.run(max_result_num=5)['results'][0]

    station_location = nearest_station.get_property('location')['location']
    print('万米内最近的火车站: %s' % (nearest_station.get_property('name')['name']))

    # get a handle to find road to hospital
    router = get_handle(ak_key, 'direction/v2/transit', is_list=True)

    router.set_params(origin=thu_location, destination=station_location)

    result = router.run()
    # print(repr(result))
    station = result.get_properties(['on_station', 'off_station'])
    print('提取出全部的on_station, off_station属性(地铁站名)')
    print(station)

