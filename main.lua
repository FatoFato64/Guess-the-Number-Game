-- Guess the Number Game
math.randomseed(os.time()) -- Initialize random number generator
local bestScore = nil -- To store the best score (minimum attempts)

-- Function to start the game
local function startGame()
    print("Choose your difficulty level:")
    print("1. Easy (1-10)")
    print("2. Medium (1-100)")
    print("3. Hard (1-1000)")
    io.write("Your choice (1/2/3): ")
    local level = tonumber(io.read())
    
    -- Set the range based on the difficulty level
    local maxNumber = 100
    if level == 1 then
        maxNumber = 10
    elseif level == 3 then
        maxNumber = 1000
    end

    local secretNumber = math.random(1, maxNumber) -- Generate the random number
    local attempts = 0 -- Initialize attempt counter
    print("I have picked a number between 1 and " .. maxNumber .. ". Try to guess it!")

    while true do
        io.write("Enter your guess: ")
        local guess = tonumber(io.read()) -- Read the user's guess
        attempts = attempts + 1 -- Increment attempts

        if not guess then
            print("Please enter a valid number!")
        elseif guess < secretNumber then
            print("My number is higher.")
        elseif guess > secretNumber then
            print("My number is lower.")
        else
            print("Congratulations! You guessed the number " .. secretNumber .. " in " .. attempts .. " attempts!")
            if not bestScore or attempts < bestScore then
                bestScore = attempts -- Update best score
                print("New best score: " .. bestScore .. " attempts!")
            end
            break -- Exit the game loop
        end
    end
end

-- Main program loop
while true do
    startGame() -- Start a new game
    io.write("Do you want to play again? (yes/no): ")
    local answer = io.read():lower() -- Get the user's answer
    if answer ~= "yes" then
        print("Thanks for playing! Goodbye!")
        break -- Exit the program
    end
end
