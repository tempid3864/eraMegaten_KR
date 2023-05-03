
function proc($path, $inc) {
	$curpath = ''
	$disp = 0
	foreach($f in (ls -Include $inc -Recurse -File -Path $path)) {
		$p = (Split-Path $f)
		if($curpath -ne $p) {
			$disp = 0
			$curpath = $p
		}
		if((gi $f).Length -le 256) {
			if(sls -Quiet -NotMatch -Pattern '^\s*(;[^\n]*\n?)?$' -Path $f) {
#				echo ("  $($f.Name)     -- not empty file!")
			}
			else {
#				del -WhatIf $f
				del $f
				if($disp -eq 0) {
					echo ""
					echo $curpath
					$disp = 1
				}
				echo ("  $($f.Name)     -- deleted.")
			}
		}
	}
	rmemptydir $path
}
function rmemptydir($path) {
#	echo $path
#	echo (ls -Path $path).Length
	foreach($d in (ls -Directory -Path $path)) {
		rmemptydir (Join-Path $path $d)
	}
	if((ls -Path $path | Measure-Object).Count -eq 0) {
#		del -WhatIf $path
		del $path
	}
}

if(-not (Test-Path -PathType Container ERB)) {
	echo 'ERB폴더가_없습니다.'
}
elseif(-not (Test-Path -PathType Container CSV)) {
	echo 'CSV폴더가 없습니다.'
}
elseif(-not (Test-Path CSV/GameBase.csv) -or -not (sls -Quiet -Pattern 'タイトル,eraMegaten' -Path CSV/GameBase.csv)) {
	echo 'eraMegaten폴더가 아닌 것 같습니다.'
	echo 'delempty.ps1 및 delempty.bat을 eraMegaten폴더로 이동한 후, delempty.bat를 실행하십시오.'
}
else {
	echo ''
	echo '-------------------------------------------------------------------------------'
	echo ''
	echo '※ 사용전 반드시 읽어주세요'
	echo ''
	echo '0KB이거나 주석만 있는 빈 파일을 삭제하는 스크립트입니다'
	echo ''
	echo '파일을 삭제하는 것이므로 사용에 주의해주세요'
	echo ''
	echo '스크립트 실행 후 게임 실행에 문제가 발생할 경우 게임을 새로 받아주시기 바랍니다'
	echo ''
	echo '-------------------------------------------------------------------------------'
	echo ''
	echo ''
	echo 'CSV및 ERB 내의 잘못된 파일과 디렉토리를 삭제해도 될까요?'
	echo ''
	echo 'yes라고 입력하면 실행합니다.'
	echo ''
	if((Read-Host -Prompt 입력) -like 'yes') {
		echo '실행하는 중...'
		proc './CSV' '*.CSV' > delempty.log
		proc './ERB' '*.ERB' >> delempty.log
		echo ''
		echo '실행을 종료했습니다. delempty.log 파일에 처리 결과를 출력했습니다.'
	}
	else {
		echo '실행을 취소했습니다.'
	}
}
echo ''

