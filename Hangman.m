%%Hangman
clear
clc

%Import hangman images
start = imread('Start.jpg');
first = imread('Guess1.jpg');
second = imread('Guess2.jpg');
third = imread('Guess3.jpg');
fourth = imread('Guess4.jpg');
fifth = imread('Guess5.jpg');
sixth = imread('Guess6.jpg');
seventh = imread('Guess7.jpg');
eighth = imread('Guess8.jpg');
ninth = imread('Guess9.jpg');
tenth = imread('Guess10.jpg');

%Show starting image
image(start)

%Load vector of 50 words
words  = ['awkward', 'bagpipes', 'banjo', 'bungler', 'croquet', 'crypt', "dwarves", 'fervid', 'fishhook', 'fjord', 'gazebo', 'gypsy', 'haiku', 'haphazard', 'hyphen', 'ivory', 'jazzy', 'jiffy', 'jinx', 'jukebox', 'kayak', 'kiosk', 'klutz', 'memento', 'mystify', 'numbskull', 'ostracize', 'oxygen', 'pajama', 'phlegm', 'pixel', 'polka', 'quad', 'quip', 'rhythmic', 'rogue', 'sphinx', 'squawk', 'swivel', 'toady', 'twelfth', 'unzip', 'waxy', 'wildebeest', 'yacht', 'zealous', 'zigzag', 'zippy', 'zombie'];
%Choose word at random
num = randi(49);
str = words(num);
%Separate string into its separate characters
chr = char(str);

fprintf('This is the word you have to guess:\n')
%Create vector of dashes to print and show user what they have to guess
for j =1:strlength(str)
    fprintf('-')
end

%Changes letters in word to dashes
for j =1:strlength(str)
    word(j)='-';
end

fprintf('\n\nYou have 10 guesses.')
fprintf('\nGuess one letter at a time.')
fprintf('\nPenalty for guessing same wrong letter twice.')
fprintf('\nMove figure to the side for optimal gameplay.')
fprintf('\nPress enter to continue')

%Pauses until user clicks 'Enter'
pause()
%Creates variable for number of guesses used
guessNum = 0;
%Creates strings to compare and print out at end of game
guessed = 'YOU GUESSED THE WORD!! YOU WIN!';
wordCorrect = ' a ';


%Stores user input into variable g
g = input('\n\n\nGuess a letter: ','s');

%Creates vector of letters already guessed by user
wordbank = g;

%Cerates variable for if user guessed letter
yes = 0;
%While guesses made is less than 10 and two strings created above ar e not
%equal
while (guessNum < 10) && (~strcmp(wordCorrect,guessed))
    %Loops through word and checks user guess is equal to any of letters in
    %the word
    for k = 1:strlength(chr)
        if g == chr(k)
            yes = 1;
            word(k)=g;
            %Decreases number guesses used
            guessNum = guessNum-1;
        end
    end
    if yes == 1
        fprintf('\nThat letter is in the word!')
    else
        fprintf('\nThat letter is not in the word...')
    end
    %Shows user their word so far
    fprintf('\n\nYour word so far\n%s\n',word)
    %If user guessed word then it sets two strings equal and prints.
    if (strcmp(word,chr))
        wordCorrect = guessed;
        fprintf('\n%s\n',wordCorrect)
        break
    %Otherwise, adds a guess and outputs image of hangman so far
    else
        guessNum = guessNum+1;
        fprintf('\nNumber of guesses you have left: %.0f\n',(10-guessNum))
        %Determines which hangman image is appropriate for number of guess
        if(guessNum==1)
            image(first)
        elseif(guessNum==2)
            image(second)
        elseif(guessNum==3)
            image(third)
        elseif(guessNum==4)
            image(fourth)
        elseif(guessNum==5)
            image(fifth)
        elseif(guessNum==6)
            image(sixth)
        elseif(guessNum==7)
            image(seventh)
        elseif(guessNum==8)
            image(eighth)
        elseif(guessNum==9)
            image(ninth)
        elseif(guessNum==10)
            image(tenth)  
        end
        %Determines how many guesses user has left and outputs the letters 
        %the user has guessed as well as prompts them to guess another 
        %letter, then it loops again if applicable
        if (10-guessNum)~=0
            fprintf('\nThe letters you have used so far: %s\n',wordbank)
            g = input('\nGuess another letter: ','s');
            wordbank = wordbank + " " + g;
        end
        
    end
    %Resets variable that determines if user guessed letter back to zero
    yes = 0;

    
end

%If user did not guess word in 10 guesses, tells them they lost and the
%word that they should've guessed
if(~strcmp(word,chr))
    fprintf('\n\nGame over...you lose, sorry buddy :( better luck next time\n')
    fprintf('\n The word was %s\n',chr)
end

%Prompts them to play again
fprintf('\nPress Ctrl+Shift+Enter to play again')
