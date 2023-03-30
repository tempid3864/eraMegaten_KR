# eraMegaten_KR

여신전생(女神転生) 시리즈의 2차창작인 eraMegaten ver0.309 의 사가판(私家版) 패치를 번역/이식/개조하여 통합한 파일

## Branch 설명

* __main__ : main_temp 전 Rev 최종 업데이트 기준 (ex) main_temp가 Rev.143이라면, main은 Rev.142의 최종 업데이트)

* __main_old__ : 업데이트 이전 Rev.137 버전 파일. 구버전 KR판 패치 호환용

* __main_temp__ : 최신 업데이트 branch. 별다른 목적이 없다면 해당 branch 이용

## 현재 패치 이식상황 (main_temp 기준)

Rev.143 KR 통합판 + __eraMegaten_6047__ + __eraMegaten_6055__ + __eraMegaten_6071__ + __eraMegaten_6076__ + __eraMegaten_6101__ + __eraMegaten_6119__ + __eraMegaten_6225__


## 도입법

__main_temp__ branch에서 파일 다운로드

이후 하단 방법을 따라 구상, 화상 순차적으로 선택해서 도입

## 구상

https://github.com/JustTasty/eraMegaten_KR_kojo

해당 repository 에서 각자 도입

## 화상

https://ux.getuploader.com/eraMegaten/

해당 로다에서 현 Rev 통합파일 다운 > resources 파일을 본체에 복사 & 붙여넣기

https://ux.getuploader.com/eraMegaten_picture/

화상 전용 로다도 참고할 것

## 실행

* __Emuera1824+v8.1__
 : 기본 실행기. 로딩이 느리고 메모리 사용량이 많다
 아래의 __Emuera1824_lazyloading__ 실행기 사용 중 버그 발생 시 이용할 것

* __Emuera1824_lazyloading__ 
 : 지연로딩 실행기. __lazyloading.cfg__ 파일과 한 쌍이며 최초 실행시 __lazyloading.dat__ 파일을 생성한다
 최초 실행 후 프로그램을 재실행해야 제대로 적용되며 게임 파일 변경 시 __lazyloading.dat__ 파일을 삭제 후 재생성 할 필요가 있다
 LFD나 SRW 등 다른 실행기도 있지만 사용의 편의성 때문에 해당 실행기를 넣어두었으니 다른 실행기 필요 시 직접 다운로드받아 이용할 것