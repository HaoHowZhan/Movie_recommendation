# -*- coding: utf-8 -*-

import requests
from lxml import etree
import re

def get_id(num):
    user_agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36"
    headers={"User-Agent":user_agent}
    html = requests.get('http://www.imdb.com/chart/toptv/?ref_=nv_tvv_250_3',headers=headers).content
    selector = etree.HTML(html)
    divs = selector.xpath('//*[@id="main"]/div/span/div/div/div[3]/table/tbody/tr[%s]/td[2]/a/@href' % num)
    id = re.search("tt\d\d\d\d\d\d\d", divs[0]).group()
    return id

# print(get_id(1))

def get_profile(id):
    profile = "http://www.imdb.com/title/%s/" % id
    return profile

# print(get_profile(get_id(1)))

def find_time(link):
    user_agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36"
    headers={"User-Agent":user_agent}
    html = requests.get(link, headers=headers).content
    selector = etree.HTML(html)
    time = selector.xpath('//*[@id="titleDetails"]/div[8]/time/text()')
    return time[0]

# print(find_time(get_profile(get_id(1))))

def find_profile(link):
    user_agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36"
    headers={"User-Agent":user_agent}
    
    html = requests.get(link, headers=headers).content
    selector = etree.HTML(html)
    name = selector.xpath('//h1[@itemprop="name"]/text()')[0]
    #print(name)
    time = selector.xpath('//time[@itemprop="duration"]/text()')[1]
    #print(time) 
    genre = selector.xpath('//div[@itemprop="genre"]/a/text()')
    #print(genre)


    html_keywords = requests.get(link + "keywords", headers = headers).content
    selector_keywords = etree.HTML(html_keywords)
    keywords = selector_keywords.xpath('//*[@data-item-votes]/@data-item-keyword')
    #print(keywords)

    html_fullcredits = requests.get(link + "fullcredits", headers = headers).content
    selector_fullcredits = etree.HTML(html_fullcredits)
    actors = selector_fullcredits.xpath('//span[@itemprop="name"]/text()')
    #print(actors)
    directors = selector_fullcredits.xpath('//table[@class="simpleTable simpleCreditsTable"][1]//td[@class="name"]/a/text()')
    #print(directors)

    result = [name, time, genre, keywords, actors, directors]
    
    return result

# print(find_profile(get_profile(get_id(1))))