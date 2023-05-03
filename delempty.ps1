
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
	echo ERB폴더가 없습니다.
}
elseif(-not (Test-Path -PathType Container CSV)) {
	echo CSV폴더가 없습니다.
}
elseif(-not (Test-Path CSV/GameBase.csv) -or -not (sls -Quiet -Pattern 'タイトル,eraMegaten' -Path CSV/GameBase.csv)) {
	echo eraMegaten폴더가 아닌 것 같습니다.
	echo delempty.ps1 및 delempty.bat을 eraMegaten폴더로 이동한 후, delempty.bat를 실행하십시오.
}
else {
	echo CSV 및 ERB 내의 잘못된 파일과 디렉토리를 삭제해도 될까요?
	echo ' yes라고 입력하면 실행합니다.'
	if((Read-Host -Prompt 入力してください) -like 'yes') {
		echo 실행하는 중...
		proc './CSV' '*.CSV' > delempty.log
		proc './ERB' '*.ERB' >> delempty.log
		echo ''
		echo 실행을 종료했습니다. delempty.log 파일에 처리 결과를 출력했습니다.
	}
	else {
		echo 실행을 취소했습니다.
	}
}
echo ''

