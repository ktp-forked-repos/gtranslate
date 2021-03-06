# GTranslate

Library that wraps the Google Translate API. Translates a phrase from one language to another.


## Install

  gem install caius-gtranslate --source http://gems.github.com


## Usage

Fairly simple to use. Run `rake doc` for full examples.

	Google::Translate.english_to_french( "Hello" ) # => "Bonjour"

You can use language detection too:

	Google::Translate.to_english( "Bonjour" ) # => "Hello"

You can replace `Translate` with `Tr` for brevity as well

  Google::Tr.english_to_french( "Hello" ) # => "Bonjour"


## Licence

Licenced under the MIT Licence

Copyright (c) 2008 Caius Durling  
Portions Copyright (c) 2008 James Rose

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

* The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

See <http://www.caius.name/> for contact details.  
