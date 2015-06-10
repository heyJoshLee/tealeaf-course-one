I read the main points at: http://www.gotealeaf.com/books/ruby/read/preparations#stylishruby
and felt pretty comfortable with them.

I then read the full style guide at:  https://github.com/bbatsov/ruby-style-guide
I actually understood a lot of it, and have been coding many of the things
correctly just based on the books I've read from Tealeaf.
Some (many) things went over my head. I jotted down some things I thought
were interesting.

########################
Don't use parentheses around the condition of an if/unless/while/until.
# bad
if (x > 10)
  # body omitted
end

# good
if x > 10
  # body omitted
end

########################
Favor modifier while/until usage when you have a single-line body. [link]

# bad
while some_condition
  do_something
end

# good
do_something while some_condition

########################
Use ||= to initialize variables only if they're not already initialized.

# bad
name = name ? name : 'Bozhidar'

# bad
name = 'Bozhidar' unless name

# good - set name to Bozhidar, only if it's nil or false
name ||= 'Bozhidar'

########################
Prefer proc over Proc.new. [link]

# bad
p = Proc.new { |n| puts n }

# good
p = proc { |n| puts n }

########################
Favor the use of predicate methods to explicit comparisons with ==. 
Numeric comparisons are OK. [link]

# bad
if x % 2 == 0
end

if x % 2 == 1
end

if x == nil
end

# good
if x.even?
end

if x.odd?
end

if x.nil?
end

if x.zero?
end

if x == 0
end

########################
The names of potentially dangerous methods (i.e. methods that modify self or 
the arguments, exit! (doesn't run the finalizers like exit does), etc.) should 
end with an exclamation mark if there exists a safe version of that dangerous method.

# bad - there is no matching 'safe' method
class Person
  def update!
  end
end

# good
class Person
  def update
  end
end

# good
class Person
  def update!
  end

  def update
  end
end

########################
Use one space between the leading # character of the comment and the text of 
the comment. [link]

########################
Comments longer than a word are capitalized and use punctuation. Use one space 
after periods. [link]

########################
Avoid writing comments to explain bad code. Refactor the code to make it 
self-explanatory. (Do or do not - there is no try. --Yoda) 

########################
If multiple lines are required to describe the problem, subsequent lines 
# should be indented three spaces after the # (one general plus two for 
#   indentation purpose). <~ like this line

########################
Use TODO to note missing features or functionality that should be added at a 
later date. [link]

Use FIXME to note broken code that needs to be fixed. [link]

Use OPTIMIZE to note slow or inefficient code that may cause performance problems. 

########################
Prefer %w to the literal array syntax when you need an array of words 
(non-empty strings without spaces and special characters in them). 
Apply this rule only to arrays with two or more elements.

########################
When accessing the first or last element from an array, prefer first or 
last over [0] or [-1]. [link]

########################
Prefer symbols instead of strings as hash keys. [link]

# bad
hash = { 'one' => 1, 'two' => 2, 'three' => 3 }

# good
hash = { one: 1, two: 2, three: 3 }

Use the Ruby 1.9 hash literal syntax when your hash keys are symbols. [link]

# bad
hash = { :one => 1, :two => 2, :three => 3 }

# good
hash = { one: 1, two: 2, three: 3 }

########################
Use Hash#key? instead of Hash#has_key? and Hash#value? instead of 
Hash#has_value?. As noted here by Matz, the longer forms are considered 
deprecated. [link]

# bad
hash.has_key?(:test)
hash.has_value?(value)

# good
hash.key?(:test)
hash.value?(value)

########################
Use Hash#fetch when dealing with hash keys that should be present. [link]

heroes = { batman: 'Bruce Wayne', superman: 'Clark Kent' }
# bad - if we make a mistake we might not spot it right away
heroes[:batman] # => "Bruce Wayne"
heroes[:supermann] # => nil

# good - fetch raises a KeyError making the problem obvious
heroes.fetch(:supermann)

########################
Prefer string interpolation and string formatting instead of string 
concatenation: [link]

# bad
email_with_name = user.name + ' <' + user.email + '>'

# good
email_with_name = "#{user.name} <#{user.email}>"

# good
email_with_name = format('%s <%s>', user.name, user.email)

########################
With interpolated expressions, there should be no padded-spacing 
inside the braces. [link]

# bad
"From: #{ user.first_name }, #{ user.last_name }"

# good
"From: #{user.first_name}, #{user.last_name}"

########################
Don't use String#gsub in scenarios in which you can use a faster more 
specialized alternative. [link]

url = 'http://example.com'
str = 'lisp-case-rules'

# bad
url.gsub("http://", "https://")
str.gsub("-", "_")

# good
url.sub("http://", "https://")
str.tr("-", "_")

########################
Do not mess around in core classes when writing libraries. 
(Do not monkey-patch them.) [link]

########################
Avoid methods longer than 10 LOC (lines of code). Ideally, most methods 
will be shorter than 5 LOC. Empty lines do not contribute to the relevant LOC. [link]
