% AIOPS 메뉴얼

### 목차

[1.시작하기](#시작)

[2.화면](#화면)


큰 문서 제목
=======================
문서 부제목
---------

# 글머리1
## 시작

```
Content를 적는 칸입니다.

```
### 글머리3
```

> 인용
>> 인용 1
>>> BlockQuote

1. 1번
2. 2번
3. 3번


```
* 처음
    * 둘쨰
       * 셋째
       
## code 입력

 ```java


	/**
	 * 알람발생내역
	 * 알람 차트표 분,시간으로 조건 나누어져있음
	 * */
	@ApiOperation(value="알람 차트")
	@RequestMapping(value = "/alarm-chart", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public ResultVO alarmChart(@RequestBody @Valid UserAlarmParamVO userAlarmParamVO) {
		List<Map<String, Object>> map = mapper.alarmChart(userAlarmParamVO);
		return new ResultVO(true, map.size(), map);
	}

 ```


* * *
***
---------


syntax: [AIOPS](http://10.10.102.146:18083/aiops/RTM/)


<!--![Alt text](../images/aiopsMain.png)-->
### 화면
<a href="http://10.10.102.146:18083/aiops/RTM/">
<img src="../images/aiopsMain.png" width="500px" height="400px" title="px(픽셀) 크기 설정"  alt="bbb"></img>
</a>
-------

{| class="wikitable"
|-
! scope="col"| Item
! scope="col"| Quantity
! scope="col"| Price
|-
! scope="row"| Bread
| 0.3 kg
| $0.65
|-
! scope="row"| Butter
| 0.125 kg
| $1.25
|-
! scope="row" colspan="2"| Total
| $1.90
|}

===

ddd

===
