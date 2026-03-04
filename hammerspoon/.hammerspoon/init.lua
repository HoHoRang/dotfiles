-- foundation_remapping 모듈 로드
local FRemap = require("foundation_remapping")

-- 글로벌 리매퍼 생성 (모든 장치에 적용)
local remapper = FRemap.new()

-- capslock 키를 F18로 리매핑
remapper:remap("capslock", "f18")

remapper:register()
