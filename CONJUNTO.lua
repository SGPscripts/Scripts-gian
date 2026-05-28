-- Скрипт для спама в чат в Roblox
-- Используется для Delta Executor

local message = "Fucking niggers, I just ran over a kid, Roblox is shit, I threw a tank at the school, I killed people, fucking niggers, I hate you, fucking niggers, fucking niggers, I fucked a person, rich porn, shit, milk, I got someone black pregnant" -- Текст для отправки
local delayTime = 2 -- Задержка между сообщениями в секундах

task.spawn(function()
    while true do
        -- Использование RemoteEvent для отправки сообщения в чат
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(message, "All")
        task.wait(delayTime)
    end
end)
