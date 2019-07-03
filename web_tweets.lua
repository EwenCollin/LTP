local component = require "component"

local term = require "term"
local screen = component.screen
local gpu = component.gpu
local w, h = gpu.maxResolution()
gpu.setResolution(w, h)
math.randomseed(os.time())
gpu.fill(0, 0, w, h, " ")
gpu.setForeground(0xFFFFFF)
gpu.setBackground(0x000000)
gpu.fill(0, 0, w, h, " ")

local inet = require("internet")
local i = 1
local tweets = 0
local lastTweet
local bodyNew = ""
local bodyLast = ""
local init = 1
while i < 10 do
	gpu.setForeground(0xFFFFFF)
	gpu.fill (1,1,w,4, " ")
	gpu.set(1,5, "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛")
	gpu.set(1,4, "┃")
	gpu.set(1,3, "┃")
	gpu.set(1,2, "┃")
	gpu.set(1,1, "┃")
	gpu.set(160,4, "┃")
	gpu.set(160,3, "┃")
	gpu.set(160,2, "┃")
	gpu.set(160,1, "┃")
	term.setCursor(30,1)
	term.write("#LTP - L'écran de tweets en direct - skip quand il y a trop de tweets - Made by Sotshi", 1)
	i = i
	tweets = 0
	local newTweet = inet.request("http://ewen.yj.fr/LTP/tweets_ltp.php?nb=0&msg=1")
	if init == 1 then
		while tweets < 9 do
			local request = "http://ewen.yj.fr/LTP/tweets_ltp.php?nb=0"
			if tweets == 1 then 
				request = "http://ewen.yj.fr/LTP/tweets_ltp.php?nb=1"
			end
			if tweets == 2 then 
				request = "http://ewen.yj.fr/LTP/tweets_ltp.php?nb=2"
			end
			if tweets == 3 then 
				request = "http://ewen.yj.fr/LTP/tweets_ltp.php?nb=3"
			end
			if tweets == 4 then 
				request = "http://ewen.yj.fr/LTP/tweets_ltp.php?nb=4"
			end
			if tweets == 5 then 
				request = "http://ewen.yj.fr/LTP/tweets_ltp.php?nb=5"
			end
			if tweets == 6 then 
				request = "http://ewen.yj.fr/LTP/tweets_ltp.php?nb=6"
			end
			if tweets == 7 then 
				request = "http://ewen.yj.fr/LTP/tweets_ltp.php?nb=7"
			end
			if tweets == 8 then 
				request = "http://ewen.yj.fr/LTP/tweets_ltp.php?nb=8"
			end
			if tweets == 9 then 
				request = "http://ewen.yj.fr/LTP/tweets_ltp.php?nb=9"
			end
			if tweets == 10 then 
				request = "http://ewen.yj.fr/LTP/tweets_ltp.php?nb=10"
			end
			local response = inet.request(request)
			local body = ""
			for chunk in response do
				body = body .. chunk
			end
			if tweets == 0 then
				local lastTweet = inet.request("http://ewen.yj.fr/LTP/tweets_ltp.php?nb=0&msg=1")
				bodyLast = ""
				for chunk in lastTweet do
					bodyLast = bodyLast .. chunk
				end
			end
			
			local randomColorR = math.random(200,255)
			local randomColorG = math.random(200,255)
			local randomColorB = math.random(200,255)
			local randomColor = randomColorR*randomColorG*randomColorB
			gpu.setForeground(randomColor)
			term.setCursor(3, 50 - tweets*5-3)
			term.write(body, 1)
			gpu.set(1,50 - tweets*5, "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛")
			gpu.set(1,50 - tweets*5-4, "┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓")
			gpu.set(1,50 - tweets*5-3, "┃")
			gpu.set(1,50 - tweets*5-2, "┃")
			gpu.set(1,50 - tweets*5-1, "┃")
			gpu.set(160,50 - tweets*5-3, "┃")
			gpu.set(160,50 - tweets*5-2, "┃")
			gpu.set(160,50 - tweets*5-1, "┃")
			tweets = tweets+1
		end
		init = 0
	end
	bodyNew = ""
	for chunk in newTweet do
		bodyNew = bodyNew .. chunk
	end
	if bodyNew ~= bodyLast then
		local randomColorR = math.random(230,255)
		local randomColorG = math.random(230,255)
		local randomColorB = math.random(230,255)
		local randomColor = randomColorR*randomColorG*randomColorB
		gpu.setForeground(randomColor)
		gpu.copy(1,1,w,h, 0, -5)
	
		gpu.setForeground(0xFFFFFF)
		gpu.fill (1,1,w,4, " ")
		gpu.set(1,5, "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛")
		gpu.set(1,4, "┃")
		gpu.set(1,3, "┃")
		gpu.set(1,2, "┃")
		gpu.set(1,1, "┃")
		gpu.set(160,4, "┃")
		gpu.set(160,3, "┃")
		gpu.set(160,2, "┃")
		gpu.set(160,1, "┃")
		term.setCursor(30,1)
		term.write("#LTP - L'écran de tweets en direct - skip quand il y a trop de tweets - Made by Sotshi", 1)
		gpu.setForeground(randomColor)
		gpu.fill (1,46,w,5, " ")
		term.setCursor(3, 50-3)
		local request = "http://ewen.yj.fr/LTP/tweets_ltp.php?nb=0"
		local response = inet.request(request)
		local body = ""
		for chunk in response do
			body = body .. chunk
		end
		term.write(body, 1)
		gpu.set(1,50, "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛")
		gpu.set(1,50-4, "┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓")
		gpu.set(1,50-3, "┃")
		gpu.set(1,50-2, "┃")
		gpu.set(1,50-1, "┃")
		gpu.set(160,50-3, "┃")
		gpu.set(160,50-2, "┃")
		gpu.set(160,50-1, "┃")
		local lastTweet = inet.request("http://ewen.yj.fr/LTP/tweets_ltp.php?nb=0&msg=1")
		bodyLast = ""
		for chunk in lastTweet do
			bodyLast = bodyLast .. chunk
		end
	elseif bodyNew == bodyLast then
		term.setCursor(2, 2)
		term.write(" No New Tweet", 1)
		local lastTweet = inet.request("http://ewen.yj.fr/LTP/tweets_ltp.php?nb=0&msg=1")
		bodyLast = ""
		for chunk in lastTweet do
			bodyLast = bodyLast .. chunk
		end
	end
	
end