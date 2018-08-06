
local mista = 100

local function dodijeli(avion_id) -- argument id aviona

	for i = 0, mista - 1, 1 

Do

--redis.call("LPUSH", "parking_misto", "prazno")

--redis.call("SADD", "slobodno", i)

	if redis.call("LINDEX", "parking_misto", i) == avion_id then 

		return tostring(i); 

	End

End

return nil;

End



local function dodijeljeno(avion_id)

local parking_misto = dodijeli(avion_id);

	if parking_misto == nil then 

		Parking_misto = redis.call("SRANDMEMBER", "slobodno");

		redis.call("SREM", "slobodno", parking_misto);

		redis.call("LSET", "parking_misto", parking_misto, avion_id);

	End

	return parking_misto;

End


--local avion_id = ARGV[1] dolje

return dodijeljeno(avion_id)


local broj_aviona=80
	for j = 0, broj_aviona -1, 1
do 
	local avion_id=redis.call("GET", ARGV[1])
	dodijeljeno(avion_id)
end

