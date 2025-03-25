-- Key System
local correct_key = "Batman"

io.write("Enter the key to proceed: ")
local user_input = io.read()

if user_input ~= correct_key then
    print("Incorrect key. Exiting...")
    return
end

print("Key accepted. Running script...")


local aTimer = nil
local aTimerInterval = 1000
local aTimerTicks = 0
local aTimerTickMax = 0

local function aTimer_tick(timer)
    if aTimerTickMax > 0 and aTimerTicks >= aTimerTickMax then
        timer.destroy()
        return
    end
    aTimerTicks = aTimerTicks + 1
    openProcess("RecRoom.exe")
end

function AOBRep(search, change)
    local aob = AOBScan(search)
    if aob then
        for i = 0, aob.Count - 1 do
            autoAssemble(aob[i] .. ':\ndb ' .. change)
        end
        aob.Destroy()
    end
end

function skip()
    local searchA = '31 00 61 00 63 00 31 00 35 00 31 00 37 00 37 00 38 00 33 00 30 00 62 00 37 00 37 00 63 00 34 00 32 00 39 00 33 00 38 00 66 00 66 00 34 00 65 00 62 00 36 00 64 00 64 00 62 00 62 00 32 00 34'
    local replaceA = '61 00 34 00 62 00 36 00 37 00 35 00 63 00 34 00 32 00 64 00 61 00 64 00 63 00 39 00 38 00 34 00 61 00 38 00 38 00 31 00 65 00 35 00 61 00 61 00 65 00 35 00 61 00 66 00 38 00 35 00 63 00 37'
    AOBRep(searchA, replaceA)
end

function CBM()
    SearchA = "5B 00 51 00 75 00 65 00 73 00 74 00 5F 00 44 00 72 00 61 00 63 00 75 00 6C 00 61 00 31 00 5F 00 42 00 61 00 73 00 69 00 63 00 42 00 6F 00 6E 00 65 00 4D 00 65 00 6C 00 65 00 65 00 45 00 6E 00 65 00 6D 00 79 00 5D 00"
    ReplaceA = "5B 00 51 00 75 00 65 00 73 00 74 00 5F 00 44 00 72 00 61 00 63 00 75 00 6C 00 61 00 31 00 5F 00 4D 00 69 00 6E 00 69 00 42 00 6F 00 73 00 73 00 43 00 6F 00 69 00 6E 00 73 00 5F 00 57 00 6F 00 6C 00 66 00 5D 00 00 00"
    SearchB = "5B 00 51 00 75 00 65 00 73 00 74 00 5F 00 44 00 72 00 61 00 63 00 75 00 6C 00 61 00 31 00 5F 00 42 00 61 00 73 00 69 00 63 00 43 00 68 00 61 00 72 00 67 00 69 00 6E 00 67 00 57 00 6F 00 6C 00 66 00 45 00 6E 00 65 00 6D 00 79 00 5D 00"
    ReplaceB = "5B 00 51 00 75 00 65 00 73 00 74 00 5F 00 44 00 72 00 61 00 63 00 75 00 6C 00 61 00 31 00 5F 00 4D 00 69 00 6E 00 69 00 42 00 6F 00 73 00 73 00 43 00 6F 00 69 00 6E 00 73 00 5F 00 57 00 6F 00 6C 00 66 00 5D 00 00 00 00 00 00 00 00 00"
    SearchC = "5B 00 51 00 75 00 65 00 73 00 74 00 5F 00 44 00 72 00 61 00 63 00 75 00 6C 00 61 00 31 00 5F 00 42 00 61 00 73 00 69 00 63 00 4C 00 75 00 6E 00 67 00 69 00 6E 00 67 00 42 00 61 00 74 00 45 00 6E 00 65 00 6D 00 79 00 5D 00"
    ReplaceC = "5B 00 51 00 75 00 65 00 73 00 74 00 5F 00 44 00 72 00 61 00 63 00 75 00 6C 00 61 00 31 00 5F 00 4D 00 69 00 6E 00 69 00 42 00 6F 00 73 00 73 00 43 00 6F 00 69 00 6E 00 73 00 5F 00 57 00 6F 00 6C 00 66 00 5D 00 00 00 00 00"
    SearchD = "5B 00 51 00 75 00 65 00 73 00 74 00 5F 00 44 00 72 00 61 00 63 00 75 00 6C 00 61 00 31 00 5F 00 42 00 61 00 73 00 69 00 63 00 4C 00 75 00 6E 00 67 00 69 00 6E 00 67 00 42 00 61 00 74 00 45 00 6E 00 65 00 6D 00 79 00 5F 00 49 00 6E 00 76 00 65 00 72 00 74 00 65 00 64 00 5D 00"
    ReplaceD = "5B 00 51 00 75 00 65 00 73 00 74 00 5F 00 44 00 72 00 61 00 63 00 75 00 6C 00 61 00 31 00 5F 00 4D 00 69 00 6E 00 69 00 42 00 6F 00 73 00 73 00 43 00 6F 00 69 00 6E 00 73 00 5F 00 57 00 6F 00 6C 00 66 00 5D 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
    SearchE= "5B 00 51 00 75 00 65 00 73 00 74 00 5F 00 44 00 72 00 61 00 63 00 75 00 6C 00 61 00 31 00 5F 00 42 00 61 00 73 00 69 00 63 00 4C 00 75 00 6E 00 67 00 69 00 6E 00 67 00 57 00 6F 00 6C 00 66 00 45 00 6E 00 65 00 6D 00 79 00 5D 00"
    ReplaceE = "5B 00 51 00 75 00 65 00 73 00 74 00 5F 00 44 00 72 00 61 00 63 00 75 00 6C 00 61 00 31 00 5F 00 4D 00 69 00 6E 00 69 00 42 00 6F 00 73 00 73 00 43 00 6F 00 69 00 6E 00 73 00 5F 00 57 00 6F 00 6C 00 66 00 5D 00 00 00 00 00 00 00"
    SearchF = "5B 00 51 00 75 00 65 00 73 00 74 00 5F 00 44 00 72 00 61 00 63 00 75 00 6C 00 61 00 31 00 5F 00 42 00 61 00 73 00 69 00 63 00 52 00 61 00 6E 00 67 00 65 00 64 00 42 00 61 00 74 00 45 00 6E 00 65 00 6D 00 79 00 5D 00"
    ReplaceF = "5B 00 51 00 75 00 65 00 73 00 74 00 5F 00 44 00 72 00 61 00 63 00 75 00 6C 00 61 00 31 00 5F 00 4D 00 69 00 6E 00 69 00 42 00 6F 00 73 00 73 00 43 00 6F 00 69 00 6E 00 73 00 5F 00 57 00 6F 00 6C 00 66 00 5D 00 00 00"
    SearchG = "5B 00 51 00 75 00 65 00 73 00 74 00 5F 00 44 00 72 00 61 00 63 00 75 00 6C 00 61 00 31 00 5F 00 42 00 61 00 73 00 69 00 63 00 52 00 61 00 6E 00 67 00 65 00 64 00 42 00 61 00 74 00 45 00 6E 00 65 00 6D 00 79 00 5F 00 49 00 6E 00 76 00 65 00 72 00 74 00 65 00 64 00 5D 00"
    ReplaceG = "5B 00 51 00 75 00 65 00 73 00 74 00 5F 00 44 00 72 00 61 00 63 00 75 00 6C 00 61 00 31 00 5F 00 4D 00 69 00 6E 00 69 00 42 00 6F 00 73 00 73 00 43 00 6F 00 69 00 6E 00 73 00 5F 00 57 00 6F 00 6C 00 66 00 5D 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
    SearchH = "5B 00 51 00 75 00 65 00 73 00 74 00 5F 00 44 00 72 00 61 00 63 00 75 00 6C 00 61 00 31 00 5F 00 47 00 72 00 6F 00 75 00 6E 00 64 00 5F 00 42 00 6F 00 6E 00 65 00 5F 00 54 00 68 00 72 00 6F 00 77 00 6E 00 45 00 6E 00 65 00 6D 00 79 00 5D 00"
    ReplaceH = "5B 00 51 00 75 00 65 00 73 00 74 00 5F 00 44 00 72 00 61 00 63 00 75 00 6C 00 61 00 31 00 5F 00 4D 00 69 00 6E 00 69 00 42 00 6F 00 73 00 73 00 43 00 6F 00 69 00 6E 00 73 00 5F 00 57 00 6F 00 6C 00 66 00 5D 00 00 00 00 00 00 00 00 00 00 00"
    SearchI = "5B 00 51 00 75 00 65 00 73 00 74 00 5F 00 44 00 72 00 61 00 63 00 75 00 6C 00 61 00 31 00 5F 00 47 00 72 00 6F 00 75 00 6E 00 64 00 5F 00 4D 00 75 00 73 00 6B 00 65 00 74 00 45 00 6E 00 65 00 6D 00 79 00 5D 00"
    ReplaceI = "5B 00 51 00 75 00 65 00 73 00 74 00 5F 00 44 00 72 00 61 00 63 00 75 00 6C 00 61 00 31 00 5F 00 4D 00 69 00 6E 00 69 00 42 00 6F 00 73 00 73 00 43 00 6F 00 69 00 6E 00 73 00 5F 00 57 00 6F 00 6C 00 66 00 5D 00"
    SearchJ = "5B 00 51 00 75 00 65 00 73 00 74 00 5F 00 44 00 72 00 61 00 63 00 75 00 6C 00 61 00 31 00 5F 00 4D 00 69 00 6E 00 69 00 42 00 6F 00 73 00 73 00 42 00 6F 00 6E 00 65 00 4D 00 65 00 6C 00 65 00 65 00 45 00 6E 00 65 00 6D 00 79 00 5D 00"
    ReplaceJ = "5B 00 51 00 75 00 65 00 73 00 74 00 5F 00 44 00 72 00 61 00 63 00 75 00 6C 00 61 00 31 00 5F 00 4D 00 69 00 6E 00 69 00 42 00 6F 00 73 00 73 00 43 00 6F 00 69 00 6E 00 73 00 5F 00 57 00 6F 00 6C 00 66 00 5D 00 00 00 00 00 00 00 00 00"
    SearchK = "5B 00 51 00 75 00 65 00 73 00 74 00 5F 00 44 00 72 00 61 00 63 00 75 00 6C 00 61 00 31 00 5F 00 4D 00 69 00 6E 00 69 00 42 00 6F 00 73 00 73 00 47 00 72 00 6F 00 75 00 6E 00 64 00 42 00 6F 00 6E 00 65 00 54 00 68 00 72 00 6F 00 77 00 6E 00 45 00 6E 00 65 00 6D 00 79 00 5D 00"
    ReplaceK = "5B 00 51 00 75 00 65 00 73 00 74 00 5F 00 44 00 72 00 61 00 63 00 75 00 6C 00 61 00 31 00 5F 00 4D 00 69 00 6E 00 69 00 42 00 6F 00 73 00 73 00 43 00 6F 00 69 00 6E 00 73 00 5F 00 57 00 6F 00 6C 00 66 00 5D 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
    SearchL = "5B 00 51 00 75 00 65 00 73 00 74 00 5F 00 44 00 72 00 61 00 63 00 75 00 6C 00 61 00 31 00 5F 00 4D 00 69 00 6E 00 69 00 42 00 6F 00 73 00 73 00 47 00 72 00 6F 00 75 00 6E 00 64 00 5F 00 4D 00 75 00 73 00 6B 00 65 00 74 00 5D 00"
    ReplaceL = "5B 00 51 00 75 00 65 00 73 00 74 00 5F 00 44 00 72 00 61 00 63 00 75 00 6C 00 61 00 31 00 5F 00 4D 00 69 00 6E 00 69 00 42 00 6F 00 73 00 73 00 43 00 6F 00 69 00 6E 00 73 00 5F 00 57 00 6F 00 6C 00 66 00 5D 00 00 00 00 00 00 00 00 00"
    SearchM = "5B 00 51 00 75 00 65 00 73 00 74 00 5F 00 44 00 72 00 61 00 63 00 75 00 6C 00 61 00 31 00 5F 00 4D 00 69 00 6E 00 69 00 42 00 6F 00 73 00 73 00 4C 00 75 00 6E 00 67 00 69 00 6E 00 67 00 57 00 6F 00 6C 00 66 00 45 00 6E 00 65 00 6D 00 79 00 5D 00"
    ReplaceM = "5B 00 51 00 75 00 65 00 73 00 74 00 5F 00 44 00 72 00 61 00 63 00 75 00 6C 00 61 00 31 00 5F 00 4D 00 69 00 6E 00 69 00 42 00 6F 00 73 00 73 00 43 00 6F 00 69 00 6E 00 73 00 5F 00 57 00 6F 00 6C 00 66 00 5D 00 00 00 00 00 00 00 00 00 00 00 00 00"
    SearchN = "5B 00 51 00 75 00 65 00 73 00 74 00 5F 00 44 00 72 00 61 00 63 00 75 00 6C 00 61 00 31 00 5F 00 4D 00 69 00 6E 00 69 00 42 00 6F 00 73 00 73 00 52 00 61 00 6E 00 67 00 65 00 64 00 42 00 61 00 74 00 45 00 6E 00 65 00 6D 00 79 00 5D 00"
    ReplaceN = "5B 00 51 00 75 00 65 00 73 00 74 00 5F 00 44 00 72 00 61 00 63 00 75 00 6C 00 61 00 31 00 5F 00 4D 00 69 00 6E 00 69 00 42 00 6F 00 73 00 73 00 43 00 6F 00 69 00 6E 00 73 00 5F 00 57 00 6F 00 6C 00 66 00 5D 00 00 00 00 00 00 00 00 00"
    AOBRep(SearchA, ReplaceA)
    AOBRep(SearchB, ReplaceB)
    AOBRep(SearchC, ReplaceC)
    AOBRep(SearchD, ReplaceD)
    AOBRep(SearchE, ReplaceE)
    AOBRep(SearchF, ReplaceF)
    AOBRep(SearchG, ReplaceG)
    AOBRep(SearchH, ReplaceH)
    AOBRep(SearchI, ReplaceI)
    AOBRep(SearchJ, ReplaceJ)
    AOBRep(SearchK, ReplaceK)
    AOBRep(SearchL, ReplaceL)
    AOBRep(SearchM, ReplaceM)
    AOBRep(SearchN, ReplaceN)
end

function gtEz()
    searchA = '5B 00 51 00 75 00 65 00 73 00 74 00 5F 00 47 00 6F 00 62 00 6C 00 69 00 6E 00 5F 00 42 00 61 00 73 00 69 00 63 00 47 00 72 00 6F 00 75 00 6E 00 64 00 52 00 61 00 6E 00 67 00 65 00 64 00 45 00 6E 00 65 00 6D 00 79 00 5D'
    replaceA = '5B 00 51 00 75 00 65 00 73 00 74 00 5F 00 47 00 6F 00 62 00 6C 00 69 00 6E 00 5F 00 42 00 61 00 73 00 69 00 63 00 47 00 72 00 6F 00 75 00 6E 00 64 00 4D 00 65 00 6C 00 65 00 65 00 45 00 6E 00 65 00 6D 00 79 00 5D'
    searchB = '5B 00 51 00 75 00 65 00 73 00 74 00 5F 00 47 00 6F 00 62 00 6C 00 69 00 6E 00 5F 00 42 00 61 00 73 00 69 00 63 00 46 00 6C 00 79 00 69 00 6E 00 67 00 52 00 61 00 6E 00 67 00 65 00 64 00 45 00 6E 00 65 00 6D 00 79 00 5D'
    replaceB = '5B 00 51 00 75 00 65 00 73 00 74 00 5F 00 47 00 6F 00 62 00 6C 00 69 00 6E 00 5F 00 42 00 61 00 73 00 69 00 63 00 47 00 72 00 6F 00 75 00 6E 00 64 00 4D 00 65 00 6C 00 65 00 65 00 45 00 6E 00 65 00 6D 00 79 00 5D'
    searchC = '5B 00 51 00 75 00 65 00 73 00 74 00 5F 00 47 00 6F 00 62 00 6C 00 69 00 6E 00 5F 00 4B 00 6E 00 69 00 67 00 68 00 74 00 43 00 68 00 61 00 72 00 67 00 65 00 45 00 6E 00 65 00 6D 00 79 00 5D'
    replaceC = '5B 00 51 00 75 00 65 00 73 00 74 00 5F 00 47 00 6F 00 62 00 6C 00 69 00 6E 00 5F 00 42 00 61 00 73 00 69 00 63 00 47 00 72 00 6F 00 75 00 6E 00 64 00 4D 00 65 00 6C 00 65 00 65 00 45 00 6E 00 65 00 6D 00 79 00 5D'
    searchD = '5B 00 51 00 75 00 65 00 73 00 74 00 5F 00 47 00 6F 00 62 00 6C 00 69 00 6E 00 5F 00 45 00 6C 00 69 00 74 00 65 00 47 00 72 00 6F 00 75 00 6E 00 64 00 4D 00 65 00 6C 00 65 00 65 00 45 00 6E 00 65 00 6D 00 79 00 5D'
    replaceD = '5B 00 51 00 75 00 65 00 73 00 74 00 5F 00 47 00 6F 00 62 00 6C 00 69 00 6E 00 5F 00 42 00 61 00 73 00 69 00 63 00 47 00 72 00 6F 00 75 00 6E 00 64 00 4D 00 65 00 6C 00 65 00 65 00 45 00 6E 00 65 00 6D 00 79 00 5D'
    searchE = '5B 00 51 00 75 00 65 00 73 00 74 00 5F 00 47 00 6F 00 62 00 6C 00 69 00 6E 00 5F 00 45 00 6C 00 69 00 74 00 65 00 46 00 6C 00 79 00 69 00 6E 00 67 00 52 00 61 00 6E 00 67 00 65 00 64 00 45 00 6E 00 65 00 6D 00 79 00 5D'
    replaceE = '5B 00 51 00 75 00 65 00 73 00 74 00 5F 00 47 00 6F 00 62 00 6C 00 69 00 6E 00 5F 00 42 00 61 00 73 00 69 00 63 00 47 00 72 00 6F 00 75 00 6E 00 64 00 4D 00 65 00 6C 00 65 00 65 00 45 00 6E 00 65 00 6D 00 79 00 5D'
    searchF = '5B 00 51 00 75 00 65 00 73 00 74 00 5F 00 47 00 6F 00 62 00 6C 00 69 00 6E 00 5F 00 4B 00 6E 00 69 00 67 00 68 00 74 00 53 00 70 00 69 00 6E 00 45 00 6E 00 65 00 6D 00 79 00 5D'
    replaceF = '5B 00 51 00 75 00 65 00 73 00 74 00 5F 00 47 00 6F 00 62 00 6C 00 69 00 6E 00 5F 00 42 00 61 00 73 00 69 00 63 00 47 00 72 00 6F 00 75 00 6E 00 64 00 4D 00 65 00 6C 00 65 00 65 00 45 00 6E 00 65 00 6D 00 79 00 5D'
    searchG = '5B 00 51 00 75 00 65 00 73 00 74 00 5F 00 47 00 6F 00 62 00 6C 00 69 00 6E 00 5F 00 52 00 6F 00 74 00 61 00 74 00 69 00 6E 00 67 00 42 00 6F 00 73 00 73 00 45 00 6E 00 65 00 6D 00 79 00 5D'
    replaceG = '5B 00 51 00 75 00 65 00 73 00 74 00 5F 00 47 00 6F 00 62 00 6C 00 69 00 6E 00 5F 00 42 00 61 00 73 00 69 00 63 00 47 00 72 00 6F 00 75 00 6E 00 64 00 4D 00 65 00 6C 00 65 00 65 00 45 00 6E 00 65 00 6D 00 79 00 5D'
    AOBRep(searchA, replaceA)
    AOBRep(searchB, replaceB)
    AOBRep(searchC, replaceC)
    AOBRep(searchD, replaceD)
    AOBRep(searchE, replaceE)
    AOBRep(searchF, replaceF)
    AOBRep(searchG, replaceG)
    AOBRep(searchH, replaceH)
end

function crimsonEz()
    searchA = '5B 00 51 00 75 00 65 00 73 00 74 00 5F 00 47 00 6F 00 62 00 6C 00 69 00 6E 00 5F 00 42 00 61 00 73 00 69 00 63 00 47 00 72 00 6F 00 75 00 6E 00 64 00 52 00 61 00 6E 00 67 00 65 00 64 00 45 00 6E 00 65 00 6D 00 79 00 5D'
    replaceA = '5B 00 51 00 75 00 65 00 73 00 74 00 5F 00 47 00 6F 00 62 00 6C 00 69 00 6E 00 5F 00 42 00 61 00 73 00 69 00 63 00 47 00 72 00 6F 00 75 00 6E 00 64 00 4D 00 65 00 6C 00 65 00 65 00 45 00 6E 00 65 00 6D 00 79 00 5D'
    searchB = '5B 00 51 00 75 00 65 00 73 00 74 00 5F 00 47 00 6F 00 62 00 6C 00 69 00 6E 00 5F 00 42 00 61 00 73 00 69 00 63 00 46 00 6C 00 79 00 69 00 6E 00 67 00 52 00 61 00 6E 00 67 00 65 00 64 00 45 00 6E 00 65 00 6D 00 79 00 5D'
    replaceB = '5B 00 51 00 75 00 65 00 73 00 74 00 5F 00 47 00 6F 00 62 00 6C 00 69 00 6E 00 5F 00 42 00 61 00 73 00 69 00 63 00 47 00 72 00 6F 00 75 00 6E 00 64 00 4D 00 65 00 6C 00 65 00 65 00 45 00 6E 00 65 00 6D 00 79 00 5D'
    searchC = '5B 00 51 00 75 00 65 00 73 00 74 00 5F 00 47 00 6F 00 62 00 6C 00 69 00 6E 00 5F 00 4B 00 6E 00 69 00 67 00 68 00 74 00 43 00 68 00 61 00 72 00 67 00 65 00 45 00 6E 00 65 00 6D 00 79 00 5D'
    replaceC = '5B 00 51 00 75 00 65 00 73 00 74 00 5F 00 47 00 6F 00 62 00 6C 00 69 00 6E 00 5F 00 42 00 61 00 73 00 69 00 63 00 47 00 72 00 6F 00 75 00 6E 00 64 00 4D 00 65 00 6C 00 65 00 65 00 45 00 6E 00 65 00 6D 00 79 00 5D'
    searchD = '5B 00 51 00 75 00 65 00 73 00 74 00 5F 00 47 00 6F 00 62 00 6C 00 69 00 6E 00 5F 00 45 00 6C 00 69 00 74 00 65 00 47 00 72 00 6F 00 75 00 6E 00 64 00 4D 00 65 00 6C 00 65 00 65 00 45 00 6E 00 65 00 6D 00 79 00 5D'
    replaceD = '5B 00 51 00 75 00 65 00 73 00 74 00 5F 00 47 00 6F 00 62 00 6C 00 69 00 6E 00 5F 00 42 00 61 00 73 00 69 00 63 00 47 00 72 00 6F 00 75 00 6E 00 64 00 4D 00 65 00 6C 00 65 00 65 00 45 00 6E 00 65 00 6D 00 79 00 5D'
    searchE = '5B 00 51 00 75 00 65 00 73 00 74 00 5F 00 47 00 6F 00 62 00 6C 00 69 00 6E 00 5F 00 45 00 6C 00 69 00 74 00 65 00 46 00 6C 00 79 00 69 00 6E 00 67 00 52 00 61 00 6E 00 67 00 65 00 64 00 45 00 6E 00 65 00 6D 00 79 00 5D'
    replaceE = '5B 00 51 00 75 00 65 00 73 00 74 00 5F 00 47 00 6F 00 62 00 6C 00 69 00 6E 00 5F 00 42 00 61 00 73 00 69 00 63 00 47 00 72 00 6F 00 75 00 6E 00 64 00 4D 00 65 00 6C 00 65 00 65 00 45 00 6E 00 65 00 6D 00 79 00 5D'
    searchF = '5B 00 51 00 75 00 65 00 73 00 74 00 5F 00 47 00 6F 00 62 00 6C 00 69 00 6E 00 5F 00 4B 00 6E 00 69 00 67 00 68 00 74 00 53 00 70 00 69 00 6E 00 45 00 6E 00 65 00 6D 00 79 00 5D'
    replaceF = '5B 00 51 00 75 00 65 00 73 00 74 00 5F 00 47 00 6F 00 62 00 6C 00 69 00 6E 00 5F 00 42 00 61 00 73 00 69 00 63 00 47 00 72 00 6F 00 75 00 6E 00 64 00 4D 00 65 00 6C 00 65 00 65 00 45 00 6E 00 65 00 6D 00 79 00 5D'
    searchG = '5B 00 51 00 75 00 65 00 73 00 74 00 5F 00 47 00 6F 00 62 00 6C 00 69 00 6E 00 5F 00 52 00 6F 00 74 00 61 00 74 00 69 00 6E 00 67 00 42 00 6F 00 73 00 73 00 45 00 6E 00 65 00 6D 00 79 00 5D'
    replaceG = '5B 00 51 00 75 00 65 00 73 00 74 00 5F 00 47 00 6F 00 62 00 6C 00 69 00 6E 00 5F 00 42 00 61 00 73 00 69 00 63 00 47 00 72 00 6F 00 75 00 6E 00 64 00 4D 00 65 00 6C 00 65 00 65 00 45 00 6E 00 65 00 6D 00 79 00 5D'
    searchH = '5B 00 51 00 75 00 65 00 73 00 74 00 5F 00 47 00 6F 00 62 00 6C 00 69 00 6E 00 5F 00 56 00 6F 00 6C 00 6C 00 65 00 79 00 52 00 61 00 6E 00 67 00 65 00 64 00 45 00 6E 00 65 00 6D 00 79 00 5D'
    replaceH = '5B 00 51 00 75 00 65 00 73 00 74 00 5F 00 47 00 6F 00 62 00 6C 00 69 00 6E 00 5F 00 42 00 61 00 73 00 69 00 63 00 47 00 72 00 6F 00 75 00 6E 00 64 00 4D 00 65 00 6C 00 65 00 65 00 45 00 6E 00 65 00 6D 00 79 00 5D'
    AOBRep(searchA, replaceA)
    AOBRep(searchB, replaceB)
    AOBRep(searchC, replaceC)
    AOBRep(searchD, replaceD)
    AOBRep(searchE, replaceE)
    AOBRep(searchF, replaceF)
    AOBRep(searchG, replaceG)
    AOBRep(searchH, replaceH)
end

function makerUI()
    local searchA = '37 00 64 00 38 00 32 00 61 00 34 00 33 00 63 00 33 00 62 00 32 00 65 00 31 00 62 00 34 00 34 00 30 00 38 00 30 00 39 00 33 00 63 00 31 00 63 00 39 00 61 00 34 00 31 00 63 00 37 00 30 00 35 00'
    local replaceA = '64 00 35 00 62 00 30 00 35 00 30 00 61 00 64 00 32 00 62 00 31 00 34 00 64 00 37 00 35 00 34 00 65 00 38 00 34 00 33 00 31 00 35 00 34 00 37 00 64 00 63 00 61 00 63 00 62 00 66 00 30 00 39 00'
    AOBRep(searchA, replaceA)
end

function sharetoRail()
    searchA = '5B 53 68 61 72 65 43 61 6D 65 72 61 5D'
    replaceA = '5B 41 72 65 6E 61 5F 52 61 69 6C 47 75 6E 5D'
    AOBRep(searchA, replaceA)
end

function feedtoshot()
    searchA = '5B 46 65 65 64 62 61 63 6B 54 6F 6F 6C 5D'
    replaceA = '5B 41 72 65 6E 61 5F 53 68 6F 74 67 75 6E 5D'
    AOBRep(searchA, replaceA)
end

function rapidFire()
    searchA = '33 33 D3 3F 00 00 00 00 00 00'
    replaceA = '00 3C 1C 46 00 00 00 00 00 00'
    AOBRep(searchA, replaceA)
end

function jumboEz()
    searchA = '5B 00 51 00 75 00 65 00 73 00 74 00 5F 00 53 00 63 00 69 00 46 00 69 00 5F 00 42 00 61 00 73 00 69 00 63 00 46 00 6C 00 79 00 69 00 6E 00 67 00 52 00 61 00 6E 00 67 00 65 00 64 00 45 00 6E 00 65 00 6D 00 79 00 5D'
    replaceA = '5B 00 51 00 75 00 65 00 73 00 74 00 5F 00 53 00 63 00 69 00 46 00 69 00 5F 00 42 00 61 00 73 00 69 00 63 00 47 00 72 00 6F 00 75 00 6E 00 64 00 52 00 61 00 6E 00 67 00 65 00 64 00 45 00 6E 00 65 00 6D 00 79 00 5D'
    searchB = '5B 00 51 00 75 00 65 00 73 00 74 00 5F 00 53 00 63 00 69 00 46 00 69 00 5F 00 45 00 6C 00 69 00 74 00 65 00 47 00 72 00 6F 00 75 00 6E 00 64 00 52 00 61 00 6E 00 67 00 65 00 64 00 45 00 6E 00 65 00 6D 00 79 00 5D'
    replaceB = '5B 00 51 00 75 00 65 00 73 00 74 00 5F 00 53 00 63 00 69 00 46 00 69 00 5F 00 42 00 61 00 73 00 69 00 63 00 47 00 72 00 6F 00 75 00 6E 00 64 00 52 00 61 00 6E 00 67 00 65 00 64 00 45 00 6E 00 65 00 6D 00 79 00 5D'
    searchC = '5B 00 51 00 75 00 65 00 73 00 74 00 5F 00 53 00 63 00 69 00 46 00 69 00 5F 00 45 00 6C 00 69 00 74 00 65 00 46 00 6C 00 79 00 69 00 6E 00 67 00 52 00 61 00 6E 00 67 00 65 00 64 00 45 00 6E 00 65 00 6D 00 79 00 5D'
    replaceC = '5B 00 51 00 75 00 65 00 73 00 74 00 5F 00 53 00 63 00 69 00 46 00 69 00 5F 00 42 00 61 00 73 00 69 00 63 00 47 00 72 00 6F 00 75 00 6E 00 64 00 52 00 61 00 6E 00 67 00 65 00 64 00 45 00 6E 00 65 00 6D 00 79 00 5D'
    searchD = '5B 00 51 00 75 00 65 00 73 00 74 00 5F 00 53 00 63 00 69 00 46 00 69 00 5F 00 4B 00 6E 00 69 00 67 00 68 00 74 00 41 00 73 00 73 00 61 00 73 00 73 00 69 00 6E 00 45 00 6E 00 65 00 6D 00 79 00 5D'
    replaceD = '5B 00 51 00 75 00 65 00 73 00 74 00 5F 00 53 00 63 00 69 00 46 00 69 00 5F 00 42 00 61 00 73 00 69 00 63 00 47 00 72 00 6F 00 75 00 6E 00 64 00 52 00 61 00 6E 00 67 00 65 00 64 00 45 00 6E 00 65 00 6D 00 79 00 5D'
    searchE = '5B 00 51 00 75 00 65 00 73 00 74 00 5F 00 53 00 63 00 69 00 46 00 69 00 5F 00 54 00 69 00 6E 00 79 00 47 00 72 00 6F 00 75 00 6E 00 64 00 45 00 78 00 70 00 6C 00 6F 00 73 00 69 00 76 00 65 00 45 00 6E 00 65 00 6D 00 79 00 5D'
    replaceE = '5B 00 51 00 75 00 65 00 73 00 74 00 5F 00 53 00 63 00 69 00 46 00 69 00 5F 00 42 00 61 00 73 00 69 00 63 00 47 00 72 00 6F 00 75 00 6E 00 64 00 52 00 61 00 6E 00 67 00 65 00 64 00 45 00 6E 00 65 00 6D 00 79 00 5D'
    searchF = '5B 00 51 00 75 00 65 00 73 00 74 00 5F 00 53 00 63 00 69 00 66 00 69 00 5F 00 4A 00 75 00 6D 00 62 00 6F 00 74 00 72 00 6F 00 6E 00 42 00 6F 00 73 00 73 00 45 00 6E 00 65 00 6D 00 79 00 5D'
    replaceF = '5B 00 51 00 75 00 65 00 73 00 74 00 5F 00 53 00 63 00 69 00 46 00 69 00 5F 00 42 00 61 00 73 00 69 00 63 00 47 00 72 00 6F 00 75 00 6E 00 64 00 52 00 61 00 6E 00 67 00 65 00 64 00 45 00 6E 00 65 00 6D 00 79 00 5D'
    AOBRep(searchA, replaceA)
    AOBRep(searchB, replaceB)
    AOBRep(searchC, replaceC)
    AOBRep(searchD, replaceD)
    AOBRep(searchE, replaceE)
    AOBRep(searchF, replaceF)
end

function isleEZ()
    searchA = '5B 00 51 00 75 00 65 00 73 00 74 00 5F 00 50 00 69 00 72 00 61 00 74 00 65 00 5F 00 47 00 72 00 6F 00 75 00 6E 00 64 00 5F 00 42 00 6F 00 74 00 74 00 6C 00 65 00 5F 00 54 00 68 00 72 00 6F 00 77 00 6E 00 45 00 6E 00 65 00 6D 00 79 00 5D'
    replaceA = '5B 00 51 00 75 00 65 00 73 00 74 00 5F 00 50 00 69 00 72 00 61 00 74 00 65 00 5F 00 42 00 61 00 73 00 69 00 63 00 47 00 72 00 6F 00 75 00 6E 00 64 00 4D 00 65 00 6C 00 65 00 65 00 45 00 6E 00 65 00 6D 00 79 00 5D'
    searchB = '5B 00 51 00 75 00 65 00 73 00 74 00 5F 00 50 00 69 00 72 00 61 00 74 00 65 00 5F 00 47 00 72 00 6F 00 75 00 6E 00 64 00 5F 00 45 00 78 00 70 00 6C 00 6F 00 73 00 69 00 76 00 65 00 5F 00 54 00 68 00 72 00 6F 00 77 00 6E 00 45 00 6E 00 65 00 6D 00 79 00 5D'
    replaceB = '5B 00 51 00 75 00 65 00 73 00 74 00 5F 00 50 00 69 00 72 00 61 00 74 00 65 00 5F 00 42 00 61 00 73 00 69 00 63 00 47 00 72 00 6F 00 75 00 6E 00 64 00 4D 00 65 00 6C 00 65 00 65 00 45 00 6E 00 65 00 6D 00 79 00 5D'
    searchC = '5B 00 51 00 75 00 65 00 73 00 74 00 5F 00 50 00 69 00 72 00 61 00 74 00 65 00 5F 00 47 00 72 00 6F 00 75 00 6E 00 64 00 5F 00 52 00 61 00 6E 00 67 00 65 00 64 00 45 00 6E 00 65 00 6D 00 79 00 5D'
    replaceC = '5B 00 51 00 75 00 65 00 73 00 74 00 5F 00 50 00 69 00 72 00 61 00 74 00 65 00 5F 00 42 00 61 00 73 00 69 00 63 00 47 00 72 00 6F 00 75 00 6E 00 64 00 4D 00 65 00 6C 00 65 00 65 00 45 00 6E 00 65 00 6D 00 79 00 5D'
    searchD = '5B 00 51 00 75 00 65 00 73 00 74 00 5F 00 50 00 69 00 72 00 61 00 74 00 65 00 5F 00 47 00 72 00 6F 00 75 00 6E 00 64 00 5F 00 47 00 69 00 62 00 62 00 65 00 74 00 45 00 6E 00 65 00 6D 00 79 00 5D'
    replaceD = '5B 00 51 00 75 00 65 00 73 00 74 00 5F 00 50 00 69 00 72 00 61 00 74 00 65 00 5F 00 42 00 61 00 73 00 69 00 63 00 47 00 72 00 6F 00 75 00 6E 00 64 00 4D 00 65 00 6C 00 65 00 65 00 45 00 6E 00 65 00 6D 00 79 00 5D'
    searchE = '5B 00 51 00 75 00 65 00 73 00 74 00 5F 00 50 00 69 00 72 00 61 00 74 00 65 00 5F 00 42 00 6F 00 73 00 73 00 45 00 6E 00 65 00 6D 00 79 00 5D'
    replaceE = '5B 00 51 00 75 00 65 00 73 00 74 00 5F 00 50 00 69 00 72 00 61 00 74 00 65 00 5F 00 42 00 61 00 73 00 69 00 63 00 47 00 72 00 6F 00 75 00 6E 00 64 00 4D 00 65 00 6C 00 65 00 65 00 45 00 6E 00 65 00 6D 00 79 00 5D'
    searchF = '54 00 68 00 65 00 72 00 65 00 20 00 41 00 72 00 65 00 20 00 53 00 74 00 69 00 6C 00 6C 00 20 00 45 00 6E 00 65 00 6D 00 69 00 65 00 73 00 20 00 4F 00 75 00 74 00 20 00 54 00 68 00 65 00 72 00 65'
    replaceF = '54 00 68 00 61 00 6E 00 6B 00 20 00 59 00 6F 00 75 00 20 00 46 00 6F 00 72 00 20 00 55 00 73 00 69 00 6E 00 67 00 20 00 52 00 65 00 70 00 65 00 61 00 74 00 69 00 6E 00 67 00 73 00 20 00 4D 00 65 00 6E 00 75'
    searchG = '54 00 68 00 65 00 72 00 65 00 20 00 41 00 72 00 65 00 20 00 53 00 74 00 69 00 6C 00 6C 00 20 00 45 00 6E 00 65 00 6D 00 69 00 65 00 73 00 20 00 4F 00 75 00 74 00 20 00 54 00 68 00 65 00 72 00 65'
    replaceG = '54 00 68 00 61 00 6E 00 6B 00 20 00 59 00 6F 00 75 00 20 00 46 00 6F 00 72 00 20 00 55 00 73 00 69 00 6E 00 67 00 20 00 52 00 65 00 70 00 65 00 61 00 74 00 69 00 6E 00 67 00 73 00 20 00 4D 00 65 00 6E 00 75'
    searchH = '54 00 68 00 65 00 72 00 65 00 20 00 41 00 72 00 65 00 20 00 53 00 74 00 69 00 6C 00 6C 00 20 00 45 00 6E 00 65 00 6D 00 69 00 65 00 73 00 20 00 4F 00 75 00 74 00 20 00 54 00 68 00 65 00 72 00 65'
    replaceH = '54 00 68 00 61 00 6E 00 6B 00 20 00 59 00 6F 00 75 00 20 00 46 00 6F 00 72 00 20 00 55 00 73 00 69 00 6E 00 67 00 20 00 52 00 65 00 70 00 65 00 61 00 74 00 69 00 6E 00 67 00 73 00 20 00 4D 00 65 00 6E 00 75'
    AOBRep(searchA, replaceA)
    AOBRep(searchB, replaceB)
    AOBRep(searchC, replaceC)
    AOBRep(searchD, replaceD)
    AOBRep(searchE, replaceE)
    AOBRep(searchF, replaceF)
end

function sharetoPaintsniper()
    searchA = '5B 53 68 61 72 65 43 61 6D 65 72 61 5D'
    replaceA = '5B 50 61 69 6E 74 62 61 6C 6C 52 69 66 6C 65 53 63 6F 70 65 64 5D'
    AOBRep(searchA, replaceA)
end

function sharetoLc()
    searchA = '5B 53 68 61 72 65 43 61 6D 65 72 61 5D'
    replaceA = '5B 41 72 65 6E 61 5F 50 6F 77 65 72 57 65 61 70 6F 6E 5F 42 65 61 6D 47 75 6E 5D'
    AOBRep(searchA, replaceA)
end

function feedtoRl()
    searchA = '5B 46 65 65 64 62 61 63 6B 54 6F 6F 6C 5D'
    replaceA = '5B 41 72 65 6E 61 5F 52 6F 63 6B 65 74 4C 61 75 6E 63 68 65 72 5D'
    AOBRep(searchA, replaceA)
end

function grvUp()
    searchA = 'C3 F5 1C C1 00 00 00 00 0A D7'
    replaceA = '00 40 1C 46 00 00 00 00 0A D7'
    AOBRep(searchA, replaceA)
end

function grvDown()
    searchA = 'C3 F5 1C C1 00 00 00 00 0A D7'
    replaceA = '00 40 1C C6 00 00 00 00 0A D7'
    AOBRep(searchA, replaceA)
end

function grvRestore()
    searchA = '00 40 1C C6 00 00 00 00 0A D7'
    replaceA = 'C3 F5 1C C1 00 00 00 00 0A D7'
    searchB = '00 40 1C 46 00 00 00 00 0A D7'
    replaceB = 'C3 F5 1C C1 00 00 00 00 0A D7'
    AOBRep(searchA, replaceA)
    AOBRep(searchB, replaceB)
end

function railinfAmmo()
    searchA = '03 00 00 00 06 00 00 00 34 36'
    replaceA = '7F 96 98 00 06 00 00 00 34 36'
    AOBRep(searchA, replaceA)
end

function shotinfAmmo()
    searchA = '03 00 00 00 06 00 00 00 D8 41'
    replaceA = '7F 96 98 00 06 00 00 00 D8 41'
    AOBRep(searchA, replaceA)
end



--\/-Buttons and shi-\/--

function questShit()
    local template = createForm(true)
    template.Width = 450
    template.Height = 180
    template.Caption = "Quest Shit"
    template.Color = 0x9a9a9a

    local button = createButton(template)
button.left = 26
button.Top = 15
button.Width = 110
button.Height = 40
button.OnClick = CBM
button.Caption = "CBM Sliver"

local button = createButton(template)
button.left = 160
button.Top = 15
button.Width = 110
button.Height = 40
button.OnClick = gtEz
button.Caption = "Golden EZ"

local button = createButton(template)
button.left = 160
button.Top = 65
button.Width = 110
button.Height = 40
button.OnClick = jumboEz
button.Caption = "Jumbo EZ"

local button = createButton(template)
button.left = 26
button.Top = 65
button.Width = 110
button.Height = 40
button.OnClick = isleEZ
button.Caption = "Isle EZ"

local button = createButton(template)
button.left = 26
button.Top = 65
button.Width = 110
button.Height = 40
button.OnClick = crimsonEz
button.Caption = "Crimson Ez"

end



--\/-Buttons and shi-\/--

local template = createForm(true)
template.Width = 450
template.Height = 260
template.Caption = "TjAltf4 CE Menu"
template.Color = 0x4a4a4a

local button = createButton(template)
button.Left = 26
button.Top = 15
button.Width = 110
button.Height = 40
button.OnClick = skip
button.Caption = "Nigger Skip"

local button = createButton(template)
button.left = 160
button.Top = 15
button.Width = 110
button.Height = 40
button.OnClick = makerUI
button.Caption = "MakerPenUI"

local button = createButton(template)
button.left = 26
button.Top = 65
button.Width = 110
button.Height = 40
button.OnClick = sharetoRail
button.Caption = "Cam To Rail"

local button = createButton(template)
button.left = 160
button.Top = 65
button.Width = 110
button.Height = 40
button.OnClick = feedtoshot
button.Caption = "Feed To Shotgun"

local button = createButton(template)
button.left = 290
button.Top = 15
button.Width = 110
button.Height = 40
button.OnClick = questShit
button.Caption = "Quest Shit"

local button = createButton(template)
button.left = 290
button.Top = 65
button.Width = 110
button.Height = 40
button.OnClick = sharetoPaintsniper
button.Caption = "Cam To PaintSniper"

local button = createButton(template)
button.left = 160
button.Top = 115
button.Width = 110
button.Height = 40
button.OnClick = sharetoLc
button.Caption = "Cam To Minigun"

local button = createButton(template)
button.left = 290
button.Top = 115
button.Width = 110
button.Height = 40
button.OnClick = feedtoRl
button.Caption = "Feed To Rocket"

local button = createButton(template)
button.left = 26
button.Top = 115
button.Width = 110
button.Height = 40
button.OnClick = rapidFire
button.Caption = "Rapid Fire"

local button = createButton(template)
button.left = 26
button.Top = 165
button.Width = 110
button.Height = 40
button.OnClick = grvUp
button.Caption = "Nigger"

local button = createButton(template)
button.left = 160
button.Top = 165
button.Width = 110
button.Height = 40
button.OnClick = grvDown
button.Caption = "Gravity (Down)"

local button = createButton(template)
button.left = 290
button.Top = 165
button.Width = 110
button.Height = 40
button.OnClick = grvRestore
button.Caption = "Gravity (Restore)"

local button = createButton(template)
button.left = 26
button.Top = 215
button.Width = 110
button.Height = 40
button.OnClick = railinfAmmo
button.Caption = "RailGun Inf"

local button = createButton(template)
button.left = 160
button.Top = 215
button.Width = 110
button.Height = 40
button.OnClick = shotinfAmmo
button.Caption = "Shotgun Inf"
